<?php


namespace app\platform\service;


use app\common\model\Transaction;
use think\Service;

class TransactionService extends Service
{
    /**收益发放记录列表
     * @param $where
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function lists($where){
        return Transaction::lists($where,[],['userTransaction','ContractEmail'],'user_id,contract_id');
    }

    //用户获取收益发放记录
    public function userSelect($user_id){
        return Transaction::with(['userTransaction','ContractEmail'])
            ->where('user_id',$user_id)
            ->where('status',2)
            ->hidden(['status','email','user_id','contract_id','del_time'])
            ->select();
    }

    /**聚合求和
     * @param string $field 统计求和的字段
     * @param bool|array $where 统计限制 [['id','=','1'],...]
     * @return float|\think\db\BaseQuery
     */
    public function getSum($field,$where = true){
        return Transaction::getSum($field,$where);
    }


    /**删除
     * @param int $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function del(int $id){
        return Transaction::del($id);
    }
}