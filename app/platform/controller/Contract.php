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
        //return $this->param;
        try{
            $where = [];
            if(array_key_exists('email',$this->param) && $this->param['email']){
                $ids = $usersService->emailID($this->param['email']);
                $where[] = ['user_id','in',$ids];
            }
            array_key_exists('start',$this->param) && $this->param['start'] and $where[] = ['create_time','>',strtotime($this->param['start'])];
            array_key_exists('end',$this->param) && $this->param['end'] and $where[] = ['create_time','<',strtotime($this->param['end'])];
            $lists = $contractService->lists($where);
            $total_price = $contractService->getSum('price',$where);
            $total_interest = $contractService->getSum('interest',$where);
            $totalRow = array(
                'email' => '共计：',
                'price' => $total_price,
                'interest' => $total_interest
            );
            return result($totalRow,$lists,StatusCode::$SUCCESS);
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