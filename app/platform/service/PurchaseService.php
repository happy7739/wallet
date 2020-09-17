<?php


namespace app\platform\service;


use app\common\model\Capital;
use app\common\model\Contract;
use app\common\model\Dynamic;
use app\common\model\Profit;
use app\common\model\Relationship;
use app\common\model\Task;
use app\common\model\Transaction;
use think\facade\Db;
use think\Service;

class PurchaseService extends Service
{
    /**判断合约是否到期
     * @param int $user_id 用户ID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function expire(int $user_id){
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

    /**判断余额是否充足
     * @param int $user_id //用户ID
     * @param int $profit_id //合约ID
     * @return bool
     */
    public function judgeBalance(int $user_id,int $profit_id){
        $nowbalance = Capital::where('user_id',$user_id)->value('balance');
        $price = Profit::where('id',$profit_id)->value('price');
        if($nowbalance < $price){
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
        //合约信息
        $profit = Profit::where('id',$profit_id)->field('price,cycle,profit')->find();
        $str = "UID=$user_id,";
        //扣除余额 增加业绩
        $price = $profit['price'];
        $res = Capital::where('user_id',$user_id)
            ->update([
                'balance'   => Db::raw("balance-$price"),
                'fund'      => Db::raw("fund+$price")
            ]);
        if(!$res){
            trace($str.'购买合约扣除余额失败！','error');
            return false;
        }
        //获取上次合约信息ID
        $up_interest_id = Contract::where('user_id',$user_id)
            ->where('end_time')
            ->value('id');
        if($up_interest_id){//创建计划任务
            $task = array(
                'type' => 2,//发放收益
                'contract_id' => $up_interest_id
            );
            $res = Task::create($task);
            if(!$res){
                trace('发放收益任务创建失败！','error');
                return false;
            }
        }
        //新建合约记录
        $num = $profit['profit'] / 100;
        $interest = bcmul("$price","$num", 2);
        $contract = new Contract();
        $contract->user_id = $user_id;
        $contract->price = $profit['price'];
        $contract->cycle = $profit['cycle'];
        $contract->profit = $profit['profit'];
        $contract->interest = $interest;
        $res = $contract->save();
        $now_contract_id = $contract->id;
        if(!$res){
            trace($str.'合约记录创建失败！','error');
            return false;
        }
        //创建计算收益任务
        $task = array(
            'type' => 1,//计算收益
            'contract_id' => $now_contract_id
        );
        $res = Task::create($task);
        if(!$res){
            trace('计算收益任务创建失败！','error');
            return false;
        }
        return true;
    }

    /**计划任务 创建 购买者静态收益
     * @param int $contract_id 合约ID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function interest(int $contract_id){
        //获取合约信息
        $contract = Contract::where('id',$contract_id)
            ->field('user_id,interest')
            ->lock(true)
            ->find();
        $data = array(
            'type'          => 1,
            'price'         => $contract['interest'],
            'contract_id'   => $contract_id,
            'user_id'       => $contract['user_id']
        );
        $res = Transaction::create($data);
        if(!$res){
            trace('用户ID='.$contract['user_id'].',静态收益创建失败！','error');
            return false;
        }
        return true;
    }


    /**计划任务 计算动态收益
     * @param int $contract_id 合约ID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function dynamic(int $contract_id){
        //查询合约信息
        $contract = Contract::where('id',$contract_id)
            ->field('user_id,interest')
            ->lock(true)
            ->find();
        $interest = $contract['interest'];
        //查询上级
        $ship = Relationship::where('user_id',$contract['user_id'])
            ->where('p_id','<>',0)
            ->field('sp_id,stratum')
            ->find();
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
                $arr = array_reverse($arr);
                foreach ($dynamic as $key => $val){
                    //直推人数是否满足  $val['edition']代数 $val['branch']直推人数
                    $now_user_id = $arr[$val['edition']-1];
                    $user_branch = Relationship::where('p_id',$now_user_id)->count();//尽量不要在循环里面操作数据库
                    if($user_branch >= $val['branch']){
                        //计算动态收益 = 下级的静态收益 * 比率（系统额外给所有上级的）
                        $num = $val['profit'] / 100;
                        $user_dynamic = bcmul("$interest","$num", 2);
                        //插入数据库
                        $data = array(
                            'type'          => 2,
                            'price'         => $user_dynamic,
                            'contract_id'   => $contract_id,
                            'user_id'       => $now_user_id
                        );
                        $res = Transaction::create($data);
                        if(!$res){
                            trace('用户ID='.$now_user_id.'动态收益创建失败！','error');
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }

    /**计划任务 发放静态收益
     * @param int $contract_id 合约ID
     * @return int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function rebate(int $contract_id){
        //获取合约信息
        $contract = Contract::where('id',$contract_id)
            ->field('user_id,price,interest')
            ->find();
        //是否状态已经发放
        $tran = Transaction::where('user_id',$contract['user_id'])
            ->where('contract_id',$contract_id)
            ->where('type',1)
            ->lock(true)
            ->find();
        if($tran['status'] == 0){
            //发放收益和本金
            $balance = $contract['price'] + $contract['interest'];
            $res = Capital::where('user_id',$contract['user_id'])
                ->update([
                    'balance'=>Db::raw("balance+$balance")
                ]);
            if(!$res){
                trace('用户ID='.$contract['user_id'].',本金和收益发放失败！','error');
                return false;
            }
            $tran->status = 1;
            $tran->fulfil_time = time();
            $res = $tran->save();
            if(!$res){
                trace('用户ID='.$contract['user_id'].',收益发放记录修改失败！','error');
                return false;
            }
        }
        return true;
    }

    /**计划任务 发放动态收益
     * @param int $contract_id 合约ID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function grantDynamic(int $contract_id){
    //查询需要发放的动态收益数据
        $list = Transaction::where('contract_id',$contract_id)
            ->where('type',2)
            ->where('status',0)
            ->lock(true)
            ->select();
        foreach ($list as $key => $val){
            //是否状态已经修改
            $status = Transaction::where('id',$val['id'])
                ->lock(true)
                ->value('status');
            if($status == 0){
                //发放收益
                $price = $val['price'];
                $res = Capital::where('user_id',$val['user_id'])
                    ->update([
                        'balance'=>Db::raw("balance+$price")
                    ]);
                if(!$res){
                    trace("用户ID=".$val['user_id'].",动态收益发放失败！",'error');
                    return false;
                }
                //修改收益发放记录
                $val->status = 1;
                $val->fulfil_time = time();
                $res = $val->save();
                if(!$res){
                    trace("用户ID=".$val['user_id'].",动态收益发放记录修改失败！",'error');
                    return false;
                }
            }
        }
        return true;
    }
}