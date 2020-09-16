<?php


namespace app\common\service;


use app\common\model\Contract;
use think\Service;

class ContractService extends Service
{
    /**修改结束时间
     * @param int $contract_id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function endTime(int $contract_id){
        return Contract::modify($contract_id,['end_time'=>time()]);
    }
}