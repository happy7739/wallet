<?php


namespace app\platform\service;


use app\common\model\Capital;
use app\common\model\Contract;
use app\common\model\Dynamic;
use app\common\model\Profit;
use app\common\model\Relationship;
use app\common\model\Transaction;
use think\facade\Db;
use think\Service;

class PurchaseService extends Service
{
    //判断合约是否到期
    public function expire($user_id){
        $contract = Contract::where('user_id',$user_id)
            ->where('end_time')
            ->field('create_time,cycle')
            ->find();
        //判断合约是否结束
        $create_time = strtotime($contract['create_time']);
        $end_time = $create_time + $contract['cycle'] * 86400;
        if($end_time > time()){
            return false;
        }else{
            return true;
        }
    }

    /**
     * @param $user_id
     * @return int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function rebate($user_id){
        $str = "UID=$user_id,";
        //获取上次合约id
        $contract = Contract::where('user_id',$user_id)
            ->where('end_time')
            ->field('id,price,create_time,cycle,interest')
            ->find();
        //判断合约是否结束
        $create_time = strtotime($contract['create_time']);
        $end_time = $create_time + $contract['cycle'] * 86400;
        if($end_time > time()){
            return 201;
        }
        //修改合约结束时间
        $res = Contract::where('user_id',$user_id)
            ->where('end_time')
            ->update(['end_time'=>time()]);
        if(!$res){
            trace($str.'合约结束时间修改失败！','error');
            return 202;
        }
        //发放收益和本金  异步处理上级动态收益发放
        $balance = $contract['price'] + $contract['interest'];
        $res = Capital::where('user_id',$user_id)
            ->update([
                'balance'=>Db::raw("balance+$balance")
            ]);
        if(!$res){
            trace($str.'本金和收益发放失败！','error');
            return 203;
        }
        //修改收益发放记录
        $contract = Transaction::where('user_id',$user_id)
            ->where('contract_id',$contract['id'])
            ->where('status',0)
            ->where('type',1)
            ->where('fulfil_time')
            ->update([
                'status'        => 1,
                'fulfil_time'   => time()
            ]);
        if(!$res){
            trace($str.'收益发放记录修改失败！','error');
            return 204;
        }
        return 200;
    }

    //判断余额是否充足
    public function judge_balance(int $user_id,int $profit_id){
        $nowbalance = Capital::where('user_id',$user_id)->value('balance');
        $profit = Profit::where('id',$profit_id)->value('profit');
        if($nowbalance < $profit['price']){
            return false;
        }else{
            return true;
        }
    }
    /**购买合约
     * @param int $user_id 用户ID
     * @param int $profit_id 合约ID
     * @return bool|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function buy(int $user_id,int $profit_id){
        //判断余额是否充足
        $nowbalance = Capital::where('user_id',$user_id)->value('balance');
        $profit = Profit::where('id',$profit_id)->field('price,cycle,profit')->find();
        if($nowbalance < $profit['price']){
            return 201;
        }
        /*trace('参数不规范：'.$id,'error');
        return false;*/
        $str = "UID=$user_id,";
        //扣除余额 增加业绩
        $newBalance = $nowbalance - $profit['price'];
        $fund = $profit['price'];
        $res = Capital::where('user_id',$user_id)
            ->update([
                'balance'=>$newBalance,
                'fund' => Db::raw("fund+$fund")
            ]);
        if(!$res){
            //return '扣除余额失败！';
            trace($str.'扣除余额失败！','error');
            return 202;
        }
        //新建合约记录
        /*$data = array(
            'user_id'   => $user_id,
            'price'     => $profit['price'],
            'cycle'     => $profit['cycle'],
            'profit'    => $profit['profit'],
        );
        $res = Contract::create($data);*/
        $interest = $profit['price'] * $profit['profit'] / 100;
        $interest = number_format((float)$interest,2,'.','');
        $contract = new Contract();
        $contract->user_id = $user_id;
        $contract->price = $profit['price'];
        $contract->cycle = $profit['cycle'];
        $contract->profit = $profit['profit'];
        $contract->interest = $interest;
        $res = $contract->save();
        $contract_id = $contract->id;
        if(!$res){
            trace($str.'合约记录创建失败！','error');
            return 203;
        }

        //计算结算收益
        //①购买者静态收益
        $data = array(
            'type'          => 1,
            'price'         => $interest,
            'contract_id'   => $contract_id,
            'user_id'       => $user_id
        );
        $res = Transaction::create($data);
        if(!$res){
            trace($str.'静态收益创建失败！','error');
            return 204;
        }
        return 200;
        /*
        //@todo  优化，业务解耦
        //②上级动态收益
        //查询上级
        $ship = Relationship::where('user_id',$user_id)
            ->where('p_id','<>',0)
            ->field('sp_id,stratum')
            ->find();
        //$str = ",1,2,3,4,5,6,7,8,9,10,";
        if($ship){//有上级
            //动态收益查询一个数组出来，避免多次查询数据库
            $dynamic = Dynamic::where('edition','<=',$ship['stratum'])
                ->field('edition,branch,profit')
                ->order('edition')
                ->select();
            if($dynamic){//有设置奖励
                //字符串变数组 倒序
                $str = trim($ship['sp_id'],',');
                $arr = explode(",",$str);
                $arr = array_reverse($arr); //[10,9,9,7,6,5,4,3,2,1]
                foreach ($dynamic as $key => $val){
                    //continue;//跳出本次循环
                    //break;//终止循环
                    //直推人数是否满足  $val['edition']代数 $val['branch']直推人数
                    $now_user_id = $arr[$val['edition']-1];
                    $user_branch = Relationship::where('p_id',$now_user_id)->count();//尽量不要在循环里面操作数据库
                    if($user_branch >= $val['branch']){
                        //计算动态收益 = 下级的静态收益 * 比率（系统额外给所有上级的）
                        $user_dynamic = $interest * $val['profit'] / 100;
                        $user_dynamic = number_format((float)$user_dynamic,2,'.','');
                        //插入数据库
                        $data = array(
                            'type'          => 2,
                            'price'         => $user_dynamic,
                            'contract_id'   => $contract_id,
                            'user_id'       => $now_user_id
                        );
                        $res = Transaction::create($data);
                        if(!$res){
                            return '用户ID='.$now_user_id.'动态收益创建失败！';
                        }
                    }
                }
            }
        }*/

    }
}