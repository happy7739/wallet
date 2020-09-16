<?php
declare (strict_types = 1);

namespace app\listener;

use app\common\service\ContractService;
use app\common\service\TaskService;
use app\platform\service\PurchaseService;
use app\common\model\Task;
use think\exception\ValidateException;

class Happy
{
    /**
     * 事件监听处理
     *
     * @return mixed
     */
    public function handle($event,PurchaseService $purchaseService,TaskService $taskService,ContractService $contractService)
    {
        do {
            //查询计划任务数据库
            $arr = Task::where('status',0)
                ->field('id,type,contract_id')
                ->lock(true)
                ->select();
            foreach ($arr as $key => $val){
                $id = $val['id'];
                $contract_id = $val['contract_id'];
                //创建收益数据
                if($val['type'] == 1){
                    try{
                        startTrans();
                        $str = "计划任务ID=$id,";
                        //静态收益
                        $res = $purchaseService->interest($contract_id);
                        if($res){
                            //动态收益
                            $res = $purchaseService->dynamic($contract_id);
                            if($res){
                                //修改计划任务状态
                                $res = $taskService->status($id);
                                if ($res){
                                    commit();
                                    dump($str.'创建收益数据完成。');
                                }else{
                                    rollback();
                                    trace($str.'修改状态失败。','error');
                                }
                            }else{
                                rollback();
                                trace($str.'动态收益创建失败。','error');
                            }
                        }else{
                            rollback();
                            trace($str.'静态收益创建失败。','error');
                        }
                    }catch (ValidateException $validate){
                        rollback();
                        dump($validate->getMessage());
                    }catch (\Throwable $t){
                        rollback();
                        trace('创建收益数据流程异常：'.$t->getMessage().' - '.$t->getLine(),'error');
                        dump('创建收益数据失败');
                    }
                }
                //发放收益
                if($val['type'] == 2){
                    try{
                        $str = "计划任务ID=$id,";
                        startTrans();
                        //静态收益
                        $res = $purchaseService->rebate($contract_id);
                        if($res){
                            //修改合约结束时间
                            $res = $contractService->endTime($contract_id);
                            if($res) {
                                //动态收益
                                $res = $purchaseService->grantDynamic($contract_id);
                                if ($res) {
                                    //修改计划任务状态
                                    $res = $taskService->status($id);
                                    if ($res) {
                                        commit();
                                        dump($str.'发放收益完成。');
                                    } else {
                                        rollback();
                                        trace($str . '修改状态失败。', 'error');
                                    }
                                } else {
                                    rollback();
                                    trace($str . '动态收益发放失败。', 'error');
                                }
                            }else{
                                rollback();
                                trace($str . '合约结束时间修改失败。', 'error');
                            }
                        }else{
                            rollback();
                            trace($str.'静态收益发放失败。','error');
                        }
                    }catch (ValidateException $validate){
                        rollback();
                        dump($validate->getMessage());
                    }catch (\Throwable $t){
                        rollback();
                        trace('发放收益流程异常：'.$t->getMessage().' - '.$t->getLine(),'error');
                        dump('发放收益失败');
                    }
                }
            }
            dump(time());
            sleep(5);
        } while (true);
        dump('buy Test listener');
    }

}
