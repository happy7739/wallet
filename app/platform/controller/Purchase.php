<?php


namespace app\platform\controller;


use app\common\model\Contract;
use app\common\service\Validate;
use app\common\controller\StatusCode;
use app\platform\service\PurchaseService;
use think\exception\ValidateException;

class Purchase extends BaseController
{
    //购买合约  传入用户ID、合约ID
    public function index(Validate $validateService,PurchaseService $purchaseService){
        //判断用户是否是第一次购买 ？ 直接购买（计算结算收益）：发放上一次购买收益、计算本次结算收益
        //判断用户余额是否充足
        //判断上一次合约是否结束
        try{
            startTrans();
            $validate = $validateService->exist($this->param['user_id'],'users','id',false);
            if($validate === true){
                return result('账号不存在');
            }
            $validate = $validateService->exist($this->param['profit_id'],'profit','id',false);
            if($validate === true){
                return result('合约不存在');
            }
            //判断用户是否是第一次购买
            $count = Contract::where('user_id',$this->param['user_id'])->count();
            //用户再次购买合约时，先发放收益和本金
            if($count !== 0){
                //获取上次合约id

            }
            //购买合约
            $res = $purchaseService->buy($this->param['user_id'],$this->param['profit_id'],$count);
            if($res){
                commit();
                return result('购买合约成功',StatusCode::$SUCCESS);
            } else {
                rollback();
                return result($res);
            }


        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('流程异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('购买失败');
        }
    }

}