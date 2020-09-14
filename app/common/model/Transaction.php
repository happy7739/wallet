<?php
declare (strict_types = 1);

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Transaction extends BaseModel
{
    protected $table = 'relationship'; //表名
    protected $pk = 'id'; //主键
    protected $autoWriteTimestamp = true; //开启自动写入时间
    protected $updateTime = 'fulfil_time';
    static protected $table_name = '收益发放记录';
}
