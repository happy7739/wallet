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
    use SoftDelete;
    protected $table = 'transaction'; //表名
    protected $pk = 'id'; //主键
    protected $autoWriteTimestamp = true; //开启自动写入时间
    protected $deleteTime = 'del_time';
    static protected $table_name = '收益发放记录';

    public function userTransaction(){
        return $this->hasOne('users','id','user_id')->bind(['email']);
    }

    public function getFulfilTimeAttr($name){//fulfil_time
        return $name > 0 ? $this->getCreateTimeAttr($name) : '-';
    }
}
