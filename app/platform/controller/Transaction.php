<?php


namespace app\platform\controller;


use app\common\controller\StatusCode;
use app\platform\service\TransactiontService;
use app\platform\service\UsersService;

class Transaction extends BaseController
{
    /**收益发放记录列表
     * @param TransactiontService $transactiontService
     * @return \think\response\Json
     */
    public function lists(TransactiontService $transactiontService,UsersService $usersService){
        try{
            $where = [];
            if(array_key_exists('email',$this->param) && $this->param['email']){
                $ids = $usersService->emailID($this->param['email']);
                $where[] = ['user_id','in',$ids];
            }
            array_key_exists('type',$this->param) && $this->param['type'] and $where[] = ['type','=',$this->param['type']];
            array_key_exists('status',$this->param) && $this->param['status'] and $where[] = ['status','=',$this->param['status']];
            array_key_exists('start',$this->param) && $this->param['start'] and $where[] = ['create_time','>',strtotime($this->param['start'])];
            array_key_exists('end',$this->param) && $this->param['end'] and $where[] = ['create_time','<',strtotime($this->param['end'])];
            $lists = $transactiontService->lists($where);
            $total_price = $transactiontService->getSum('price',$where);
            $totalRow = array(
                'email' => '共计：',
                'price' => $total_price
            );
            return result($totalRow,$lists,StatusCode::$SUCCESS);
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