<?php


namespace app\platform\controller;


use app\platform\service\ContractService;
use app\common\controller\StatusCode;
use app\platform\service\UsersService;

class Contract extends BaseController
{
    /**合约列表
     * @param ContractService $contractService
     * @return \think\response\Json
     */
    public function lists(ContractService $contractService,UsersService $usersService){
        try{
            $where = [];
            if(array_key_exists('email',$this->param) && $this->param['email']){
                $id = $usersService->emailID($this->param['email']);
                $where[] = ['user_id','=',$id];
            }
            $lists = $contractService->lists($where);
            $total_price = $contractService->getSum('price');
            $total_interest = $contractService->getSum('interest');
            $totalRow = array(
                'price' => $total_price,
                'interest' => $total_interest
            );
            return totalRow('ok',$lists,StatusCode::$SUCCESS,$totalRow);
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