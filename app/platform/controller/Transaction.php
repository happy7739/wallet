<?php


namespace app\platform\controller;


use app\common\controller\StatusCode;
use app\platform\service\TransactiontService;

class Transaction extends BaseController
{
    /**收益发放记录列表
     * @param TransactiontService $transactiontService
     * @return \think\response\Json
     */
    public function lists(TransactiontService $transactiontService){
        try{
            $where = [];
            $lists = $transactiontService->lists($where);
            return result('ok',$lists,StatusCode::$SUCCESS);
        }catch (\Throwable $throwable){
            return result($throwable->getMessage(),StatusCode::$FAIL);
        }
    }

    /**删除
     * @param TransactiontService $transactiontService
     * @return \think\response\Json
     */
    public function del(TransactiontService $transactiontService){
        try {
            startTrans();
            $res = $transactiontService->del(intval($this->param['id']));
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