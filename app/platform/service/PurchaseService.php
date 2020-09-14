<?php


namespace app\platform\service;


use app\common\model\Capital;
use app\common\model\Contract;
use app\common\model\Profit;
use think\facade\Db;
use think\Service;

class PurchaseService extends Service
{
    /**购买合约
     * @param int $user_id 用户ID
     * @param int $profit_id 合约ID
     * @param int $count 购买次数
     * @return bool|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function buy(int $user_id,int $profit_id,int $count){
        //判断余额是否充足
        $nowbalance = Capital::where('user_id',$user_id)->value('balance');
        $profit = Profit::where('id',$profit_id)->field('price,cycle,profit')->find();
        if($nowbalance < $profit['price']){
            return '余额不足，请充值！';
        }
        //扣除余额 增加业绩
        $newBalance = $nowbalance - $profit['price'];
        $res = Capital::where('user_id',$user_id)->update(['balance'=>$newBalance,'fund'=>$profit['price']]);
        if(!$res){
            return '扣除余额失败！';
        }
        //新建合约记录
        $data = array(
            'user_id'   => $user_id,
            'price'     => $profit['price'],
            'cycle'     => $profit['cycle'],
            'profit'    => $profit['profit'],
            'frequency' => $count + 1
        );
        $res = Contract::create($data);
        if(!$res){
            return '合约记录创建失败！';
        }
        //计算结算收益
    }
}