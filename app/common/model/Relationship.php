<?php
declare (strict_types = 1);

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Relationship extends BaseModel
{
    protected $table = 'relationship'; //表名
    protected $pk = 'id'; //主键
    protected $autoWriteTimestamp = false; //关闭自动写入时间
    static protected $table_name = '用户关系';
}
