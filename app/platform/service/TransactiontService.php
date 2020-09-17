<?php


namespace app\platform\service;


use app\common\model\Transaction;
use think\Service;

class TransactiontService extends Service
{
    /**收益发放记录列表
     * @param $where
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function lists($where){
        return Transaction::lists($where,[],['userTransaction'],'');
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