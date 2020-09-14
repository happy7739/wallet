<?php
declare (strict_types = 1);

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Capital extends BaseModel
{
    protected $table = 'capital'; //表名
    protected $pk = 'user_id'; //主键
    protected $autoWriteTimestamp = false; //关闭自动写入时间
    protected $updateTime = false;//关闭修改时间写入
    static protected $table_name = '账户资金';

    public function users(){
        return $this->hasOne('users','id','user_id')->bind(['pid','email']);
    }
}
