<?php
declare (strict_types = 1);

namespace app\platform\controller;

use app\common\controller\Redis;
use app\common\controller\StatusCode;
use app\common\model\Capital;
use app\common\model\Contract;
use app\common\model\Profit;
use app\common\model\Relationship;
use app\common\model\Task;
use app\common\model\Transaction;
use app\common\model\Users;
use app\common\model\Dynamic;
use app\common\service\SendService;
use app\common\service\SocketService;
use app\common\service\Validate;
use app\platform\service\ContractService;
use app\platform\service\DemoService;
use app\common\model\TradeOrder;
use app\platform\service\MarketService;
use app\platform\service\TradeOrderService;
use app\platform\service\UsersService;
use org\Rsa;
use think\facade\Db;
use think\helper\Str;


class Test extends BaseController
{

    public function index(Validate $validate){
        $param = $this->request->param();

        return Users::with(['users'])
            ->where('id',2)
            ->field('id,email,create_time,invite_code,invite_email')
            ->find();
        //TP6各个文件定义解析：
        //controller 处理入参（表单验证，参数过滤，参数包装）
        //service 注入到controller 处理业务。采用一个service处理一个业务，复杂业务或者核心业务采用一个方法对应一个小步骤的写法，高度解耦程序
        //event 在service完成回调后，由controller启动，对应listen触发拓展业务。再由对应service注入event事件，处理拓展业务
        //model 映射数据库，完成数据基本操作
        //
        //配置的全局服务 会在控制器调用前执行

        //一个请求的完成路径：
        //HTTP -> 路由 -> 中间件 -> 控制器 -> 验证器 -> 服务层 -> 事件监听 -> 事件订阅 -> 数据模型
        //表单验证
        //参数验证
        //调用service执行一个核心业务
        //触发event事件，执行额外业务
        //例子： 购买商品
        // 执行表单验证，确认入参正确
        // 使用event事件监听系统（listen）完成购物流程
        // 触发event事件订阅系统（subscribe），处理分销部分逻辑
        // 优势：
        // 条理分明，方便额外业务的拓展，高解耦
        // 劣势：
        // 代码东一块，西一块，不熟悉TP6的人找不到代码位置

    }

    function getFloatValue($f,$len = 2)
    {
        $tmpInt=intval($f);
        $tmpDecimal=$f-$tmpInt;
        $str="$tmpDecimal";
        $subStr=strstr($str,'.');
        if(strlen($subStr)<$len+1)
        {
            $repeatCount=$len+1-strlen($subStr);
            $str=$str."".str_repeat("0",$repeatCount);
        }
        return    $tmpInt."".substr($str,1,1+$len);
    }

    public function repeat(UsersService $usersService){
        $pid = 1;
        $num = 0;
        for($i = 0;$i < 10;$i++){
            if($pid < 10){
                $email = '773900'.$pid;
                if(($pid+1) < 10){
                    $email = $email.'0'.($pid+1);
                }else{
                    $email = $email.($pid+1);
                }
            }else{
                $email = '77390'.$pid.($pid+1);
            }
            $email = $email.'@qq.com';
            $password = 'qq123456';
            $res = $usersService->register($email,$password,$pid);
            if($res){
                $num++;
            }
            $pid++;
        }
        return $num;
    }

    public function token(){
        $email = '773901011@qq.com';
        $user = Users::where('email',$email)->find();
        request()->userId = $user->id;
        $token = strtoupper(hash('md5',$user->email.time()));
        cache($token,$user);
        cache($token.'stamp',time()+STILL_TIME);
        return $token;
    }

    public function task(){
        //常驻任务
        //定时去读取任务表
        //逐一执行 待执行 的任务
    }

}
