<?php


namespace app\platform\controller;


use app\common\model\Contract;
use app\common\service\Validate;
use app\common\controller\StatusCode;
use app\platform\service\PurchaseService;
use think\exception\ValidateException;

class Purchase extends BaseController
{
    //购买合约  传入合约ID  获取用户ID
    public function index(Validate $validateService,PurchaseService $purchaseService){
        $user_id = request()->userId;
        //判断用户是否是第一次购买 ？ 直接购买（计算结算收益）：发放上一次购买收益、计算本次结算收益
        //判断用户余额是否充足
        //判断上一次合约是否结束
        try{
            startTrans();
            $validate = $validateService->exist($this->param['profit_id'],'profit','id',false);
            if($validate === true){
                rollback();
                return result('合约不存在');
            }
            $res = $purchaseService->expire($user_id);
            if($res == false){
                rollback();
                return result('合约未结束，请稍后再试。');
            }
            $res = $purchaseService->judge_balance($user_id,$this->param['profit_id']);
            if($res == false){
                rollback();
                return result('余额不足，请充值！');
            }
            //购买合约
            $res = $purchaseService->buy($user_id,$this->param['profit_id']);
            if($res){
                commit();
                return result('购买合约成功。',StatusCode::$SUCCESS);
            }else{
                rollback();
                return result('购买失败!');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('购买合约流程异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('购买失败');
        }
    }

}