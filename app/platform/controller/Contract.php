<?php


namespace app\platform\controller;


use app\platform\service\ContractService;
use app\common\controller\StatusCode;

class Contract extends BaseController
{
    /**合约列表
     * @param ContractService $contractService
     * @return \think\response\Json
     */
    public function lists(ContractService $contractService){
        try{
            $where = [];
            $lists = $contractService->lists($where);
            return result('ok',$lists,StatusCode::$SUCCESS);
        }catch (\Throwable $throwable){
            return result($throwable->getMessage(),StatusCode::$FAIL);
        }
    }

    /**删除
     * @param ContractService $contractService
     * @return \think\response\Json
     */
    public function del(ContractService $contractService){
        try {
            startTrans();
            $res = $contractService->del(intval($this->param['id']));
            if($res){
                commit();
                return result('删除成功',StatusCode::$SUCCESS);
            }else{
                rollback();
                return result('删除失败');
            }
        }catch (\Throwable $throwable){
            rollback();
            trace('删除合约失败'.$throwable->getMessage(),'error');
            return result('删除失败');
        }
    }
}