<?php


namespace app\platform\service;


use app\common\model\Contract;
use think\Service;

class ContractService extends Service
{
    /**合约列表
     * @param $where
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function lists($where){
        return Contract::lists($where,[],['userContract'],'');
    }

    /**删除
     * @param int $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function del(int $id){
        return Contract::del($id);
    }
}