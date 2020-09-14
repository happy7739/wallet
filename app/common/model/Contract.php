<?php
declare (strict_types = 1);

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Contract extends BaseModel
{
    //use SoftDelete;
    protected $table = 'contract'; //表名
    protected $pk = 'id'; //主键
    protected $autoWriteTimestamp = true; //开启自动写入时间
    protected $updateTime = false;//关闭修改时间写入
    static protected $table_name = '合约记录';
}
