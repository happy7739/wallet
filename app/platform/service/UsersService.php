<?php

namespace app\platform\service;

use app\common\model\Capital;
use app\common\model\Relationship;
use app\common\model\Users;
use org\Rsa;
use think\facade\Db;
use think\Service;

class UsersService extends Service
{
    /**用户列表
     * @param $where
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function lists($where){
        return Users::lists($where,[],['users'],'password,del_time,transaction');
    }

    /**查询下级
     * @param $user_id
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function subordinate($user_id){
        return Users::where('pid','=',$user_id)
            ->field('email,create_time')
            ->select();
    }

    /**登录验证密码
     * @param string $email
     * @param string $password
     * @return bool
     */
    public function verifyPwd(string $email, string $password) : bool {
        $db_pwd = Users::where('email',$email)->value('password');
        return Rsa::decode($db_pwd) === $password;
    }

    /**注册账号
     * @param $email
     * @param $password
     * @param $invite_code
     * @param null $superior
     * @return bool|void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function register($email , $password , $invite_code ,$superior = null){
        $user = new Users;
        $user->email = $email;
        $user->password = Rsa::encode($password);
        if($superior == null){
            $pid = 0;
        }else{
            $pid = Users::where('invite_code','=',$superior)->value('id');
        }
        $user->pid = $pid;
        $user->invite_code = $invite_code;
        $res = $user->save();
        $user_id = $user->id;
        if($res){
            if($pid == 0){
                $ship = array(
                    'user_id' => $user_id, // 获取自增ID
                    'p_id' => $pid,
                    'sp_id' => '',// 所有上级ID
                    'stratum' => 0,
                );
            }else{
                //查询上级关系表
                $relat = Relationship::where('user_id',$pid)
                    ->field('sp_id,stratum')
                    ->order('id','desc')
                    ->find();
                $ship = array(
                    'user_id' => $user_id, // 获取自增ID
                    'p_id' => $pid,
                    'stratum' => $relat['stratum']+1,
                );
                if($relat['stratum'] == ''){
                    $ship['sp_id'] = ','.$pid.',';// 所有上级ID
                }else{
                    $ship['sp_id'] = $relat['sp_id'].$pid.',';// 所有上级ID
                }
            }
            //创建关系
            $resp = Relationship::create($ship);
            //创建资金账户
            Capital::create(['user_id'=>$user_id]);
        }
        return $res;
    }

    /**修改
     * @param int $id
     * @param $data
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function reset(int $id,$data){
        return Users::modify($id,$data);
    }

    /**删除用户
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function del($id){
        return Users::del($id);
    }

    /**
     * 编辑用户状态
     * @param int $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function status(int $id)
    {
        $now = Users::where('id',$id)->value('status');
        $data['status'] = (int)$now ? 0 : 1;
        return Users::modify($id,$data);
    }

    /**
     * 生成TOKEN，并绑定登录用户
     * @param string $email
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * Date: 2020/8/21 16:22
     */
    public function getToken(string $email) : string{
        $user = Users::where('email',$email)->find();
        request()->userId = $user->id;
        $token = strtoupper(hash('md5',$user->email.time()));
        cache($token,$user);
        cache($token.'stamp',time()+STILL_TIME);
        return $token;
    }

    /**邮箱转ID
     * @param string $email
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function emailID(string $email){
        $list = Users::where('email','like',"%$email%")->field('id')->select();
        $str = '';
        foreach ($list as $key => $val){
            $str = $str.$val['id'].',';
        }
        $ids = rtrim($str,',');
        return $ids;
    }
}