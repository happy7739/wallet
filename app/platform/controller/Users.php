<?php


namespace app\platform\controller;


use app\platform\service\UsersService;
use app\common\service\Validate;
use app\common\controller\StatusCode;
use org\Rsa;
use think\helper\Str;
use think\exception\ValidateException;

class Users extends BaseController
{
    public function lists(UsersService $usersService){
        try{
            $where = [];
            array_key_exists('email',$this->param) && $this->param['email'] and $where[] = ['email','like','%'.$this->param['email'].'%'];
            array_key_exists('start',$this->param) && $this->param['start'] and $where[] = ['create_time','>',strtotime($this->param['start'])];
            array_key_exists('end',$this->param) && $this->param['end'] and $where[] = ['create_time','<',strtotime($this->param['end'])];
            $lists = $usersService->lists($where);
            return result('ok',$lists,StatusCode::$SUCCESS);
        }catch (\Throwable $throwable){
            return result($throwable->getMessage(),StatusCode::$FAIL);
        }
    }

    /**登录
     * @param UsersService $usersService
     * @param Validate $validateService
     * @return \think\response\Json
     */
    public function login(UsersService $usersService,Validate $validateService){
        try{
            $this->param = $this->request->param();
            //return result('test',$this->param);
            //表单验证
            $this->validate($this->param,'User.login');
            //验证邮箱是否已注册
            $validate = $validateService->exist($this->param['email'],'users','email',true);
            if($validate === false){
                rollback();
                return result('账号或密码错误');
            }
            //验证密码
            $res = $usersService->verifyPwd($this->param['email'],$this->param['password']);
            if($res){
                //获取token
                $token = $usersService->getToken($this->param['email']);
                return result(lang('Login successful'),['token'=>$token],StatusCode::$SUCCESS) ;
            }else{
                return result('账号或密码错误');
            }
        }catch (ValidateException $validate){
            //验证反馈
            return result(lang($validate->getError()),StatusCode::$FAIL);
        }catch (\Throwable $t){
            //程序异常
            trace('登录异常:'.$t->getMessage().'|'.$t->getLine(),'error');
            return result(lang('The server is busy. Please try again later'));
        }
    }
    /**
     * 注册
     * @param UsersService $usersService
     * @param Validate $validateService
     * @return \think\response\Json
     * Date: 2020/8/22 15:09
     */
    public function register(UsersService $usersService,Validate $validateService){
        try{
            $this->param = $this->request->param();
            //return result('test',$this->param);
            startTrans();
            $this->validate($this->param,'User.register');
            //验证邮箱是否已注册
            $validate = $validateService->exist($this->param['email'],'users','email',false);
            if(!$validate === true){
                rollback();
                return result('账号已存在');
            }
            //验证邀请码是否存在
            $validate = $validateService->exist($this->param['invite_code'],'users','invite_code',true);
            if(!$validate === true){
                rollback();
                return result('邀请码错误');
            }
            //产生邀请码
            do {
                $invite_code = Str::random(6);
                $res = $validateService->exist($invite_code,'users','invite_code',true);
            }while($res);
            $res = $usersService->register($this->param['email'],$this->param['password'],$invite_code,$this->param['invite_code']);
            if($res){
                commit();
                return result('注册成功',StatusCode::$SUCCESS);
            } else {
                rollback();
                return result('注册失败');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('注册用户异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('添加失败');
        }
    }

    /**添加用户
     * @param UsersService $usersService
     * @param Validate $validateService
     * @return \think\response\Json
     */
    public function addUsers(UsersService $usersService,Validate $validateService){
        try{
            //$this->param = $this->request->param();
            //return result('test',$this->param);
            startTrans();
            $this->validate($this->param,'User.addUsers');
            //验证邮箱是否已注册
            $validate = $validateService->exist($this->param['email'],'users','email',false);
            if(!$validate === true){
                rollback();
                return result('账号已存在');
            }
            //产生邀请码
            do {
                $invite_code = Str::random(6);
                $res = $validateService->exist($invite_code,'users','invite_code',true);
            }while($res);
            $res = $usersService->register($this->param['email'],$this->param['password'],$invite_code);
            if($res){
                commit();
                return result('添加成功',StatusCode::$SUCCESS);
            } else {
                rollback();
                return result('添加失败');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('注册用户异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('添加失败');
        }
    }

    /**重置登录密码
     * @param UsersService $usersService
     * @param Validate $validateService
     * @return \think\response\Json
     */
    public function resetPwd(UsersService $usersService,Validate $validateService){
        try{
            $user = cache($this->param['token']);
            $user_id = $user->id;
            $this->param = $this->request->param();
            //return result('test',$this->param);
            startTrans();
            $this->validate($this->param,'User.password');
            $validate = $validateService->rule($this->param['password']);
            if(!$validate === true){
                rollback();
                return result($validate);
            }
            $data = array(
                'password' => Rsa::encode($this->param['password']),
            );
            $res = $usersService->reset($user_id,$data);
            if($res){
                commit();
                return result('修改成功',StatusCode::$SUCCESS);
            } else {
                rollback();
                return result('修改失败');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('修改登录密码异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('修改失败');
        }
    }

    /**重置交易密码
     * @param UsersService $usersService
     * @param Validate $validateService
     * @return \think\response\Json
     */
    public function resetTrans(UsersService $usersService,Validate $validateService){
        try{
            $user = cache($this->param['token']);
            $user_id = $user->id;
            startTrans();
            $this->validate($this->param,'User.transaction');
            //密码验证 加密
            $validate = $validateService->rule($this->param['transaction']);
            if(!$validate === true){
                rollback();
                return result($validate);
            }
            $data = array(
                'transaction' => Rsa::encode($this->param['transaction']),
            );
            $res = $usersService->reset($user_id,$data);
            if($res){
                commit();
                return result('修改成功',StatusCode::$SUCCESS);
            } else {
                rollback();
                return result('修改失败');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate->getMessage());
        }catch (\Throwable $t){
            rollback();
            trace('修改交易密码异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('修改失败');
        }
    }

    //获取邀请码
    public function inviteCode(){
        $user = cache($this->param['token']);
        return $user->invite_code;
    }

    /**删除用户
     * @param UsersService $usersService
     * @return \think\response\Json
     */
    public function del(UsersService $usersService){
        try{
            startTrans();
            $res = $usersService->del(intval($this->param['id']));
            if($res){
                commit();
                return result('删除成功',StatusCode::$SUCCESS);
            }else{
                rollback();
                return result('删除失败');
            }
        }catch (\Throwable $t){
            rollback();
            trace('删除用户异常：'.$t->getMessage(),'error');
            return result('删除失败');
        }
    }

    /**用户状态
     * @param UsersService $usersService
     * @return \think\response\Json
     */
    public function status(UsersService $usersService){
        try{
            startTrans();//启动事务
            $res = $usersService->status(intval($this->param['id']));
            if($res){
                commit();// 提交事务
                return result('修改成功',$this->param,StatusCode::$SUCCESS);
            }else{
                rollback();
                return result('修改失败1');
            }
        }catch (ValidateException $validate){
            rollback();
            return result($validate);
        }catch (\Throwable $t){
            rollback();
            trace('修改用户状态异常：'.$t->getMessage().' - '.$t->getLine(),'error');
            return result('修改失败2');
        }
    }
}