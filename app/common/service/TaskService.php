<?php


namespace app\common\service;


use app\common\model\Task;
use think\Service;

class TaskService extends Service
{
    /**修改状态
     * @param int $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function status(int $id){
        return Task::modify($id,['status'=>1,'end_time'=>time()]);
    }
}