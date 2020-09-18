<?php
/**
 * Created by PhpStorm.
 * User: xiaoziyan
 * Date: 2020/8/20
 * Time: 10:45
 */
use think\facade\Route;
use \app\middleware\Power;
use \app\middleware\VisitLimit;
use \app\middleware\CheckAdminToken;
use \app\middleware\CheckUserToken;
use \app\middleware\Sign;
use \think\middleware\LoadLangPack;

define('STILL_TIME',1800);//登录静置最大时间

Route::domain(env('route.platform','adnser.xiaoziyan.cc'), function () {
    // 动态注册域名的路由规则
    //无需验证权限
    Route::group('common/',function (){
        Route::get('/test','test/index');
        Route::get('/getToken','test/token');
        Route::get('/repeat','test/repeat');

        //获取图形验证码
        Route::get('/imgCode','auth/imgCode');
        //权限树
        Route::get('/authorization','auth/authorization');
        //获取菜单，验证登录状态
        Route::get('/menuLists','index/menuLists')->middleware(CheckAdminToken::class);
        Route::get('/roleOption','Power/roleOption')->middleware(CheckAdminToken::class);
        //登录
        Route::post('/login','auth/login');
        Route::post('/logout','auth/logout')->middleware(CheckAdminToken::class);
        //验证权限
        Route::post('/checkPower','auth/checkPower')->middleware(CheckAdminToken::class);
        //市场选项
        Route::get('/marketOption','TradeOrder/market')->middleware(CheckAdminToken::class);

        //用户登录
        Route::post('/usersLogin','Users/login');
        //用户注册
        Route::post('/usersRegister','Users/register');
        //添加用户
        Route::post('/usersAdd','Users/addUsers');
        //编辑用户状态
        Route::post('/usersStatus','Users/status');
        //删除用户
        Route::post('/usersDel','Users/del');

        //新增合约配置数据设置
        Route::post('/addProfit','Profit/add');
        //删除合约配置数据设置
        Route::post('/delProfit','Profit/del');
        //修改合约配置数据设置
        Route::post('/modifyProfit','Profit/modify');
        //合约配置数据列表
        Route::get('/listsProfit','Profit/lists');

        //新增动态收益数据设置
        Route::post('/dynamicAdd','Dynamic/add');
        //删除动态收益数据设置
        Route::post('/dynamicDel','Dynamic/del');
        //修改动态收益数据设置
        Route::post('/dynamicModify','Dynamic/modify');
        //动态收益数据列表
        Route::get('/dynamicLists','Dynamic/lists');

        //新增团队收益数据设置
        Route::post('/teamAdd','Team/add');
        //删除团队收益数据设置
        Route::post('/teamDel','Team/del');
        //修改团队收益数据设置
        Route::post('/teamModify','Team/modify');
        //团队收益数据列表
        Route::get('/teamLists','Team/lists');

        //合约记录列表
        Route::get('/contractLists','Contract/lists');

    })->middleware(VisitLimit::class);

    Route::group(function (){
        //重置用户登录密码
        Route::post('/reset_pwd','Users/resetPwd');
        //重置用户交易密码
        Route::post('/reset_ta','Users/resetTrans');
        //购买合约
        Route::post('/purchase','Purchase/index');

    })->middleware([CheckUserToken::class,VisitLimit::class]);

    Route::group(function (){
        Route::get('/adminLists','Admins/lists');//管理员列表
        Route::get('/rolesLists','Roles/lists');//角色列表
        Route::get('/adminLogs','Logs/admins');//管理员操作日志

        Route::post('/addAdmin','Admins/add');//添加管理员
        Route::post('/modifyAdmin','Admins/modify');//编辑管理员
        Route::post('/delAdmin','Admins/del');//删除管理员

        Route::post('/addRole','Roles/add');//添加角色
        Route::post('/modifyRole','Roles/modify');//编辑角色
        Route::post('/delRole','Roles/del');//删除角色
        Route::post('/authorization','Roles/authorization');//角色授权

        Route::get('/tradeOrderLists','TradeOrder/lists');//委托列表
        Route::post('/delOrder','TradeOrder/cancel');//撤销委托


        Route::post('/profitAdd','Profit/add');//新增合约配置数据设置
        Route::post('/profitDel','Profit/del');//删除合约配置数据设置
        Route::post('/profitModify','Profit/modify');//修改合约配置数据设置
        Route::get('/profitLists','Profit/lists');//合约配置数据列表

        Route::post('/dynamicAdd','Dynamic/add');//新增动态收益数据设置
        Route::post('/dynamicDel','Dynamic/del');//删除动态收益数据设置
        Route::post('/dynamicModify','Dynamic/modify');//修改动态收益数据设置
        Route::get('/dynamicLists','Dynamic/lists');//动态收益数据列表

        Route::post('/teamAdd','Team/add');//新增团队收益数据设置
        Route::post('/teamDel','Team/del');//删除团队收益数据设置
        Route::post('/teamModify','Team/modify');//修改团队收益数据设置
        Route::get('/teamLists','Team/lists');//团队收益数据列表

        Route::get('/contractLists','Contract/lists');//合约记录列表
        Route::post('/contractDel','Contract/del');//删除合约记录

        Route::get('/transactionLists','Transaction/lists');//收益发放记录列表
        Route::post('/transactionDel','Transaction/del');//删除收益发放记录

    })->middleware([CheckAdminToken::class,Power::class,Sign::class,VisitLimit::class]);

    Route::miss(function() {
        return '4042 Not Found!';
    });
})->middleware([LoadLangPack::class])->allowCrossDomain();

Route::domain(env('route.platform','user.xiaoziyan.cc'), function () {
    // 动态注册域名的路由规则
    //无需验证权限
    Route::group('index/',function (){
        //用户登录
        Route::post('/usersLogin','Users/login');
        //用户注册
        Route::post('/usersRegister','Users/register');
        Route::get('/profitLists','Profit/userSelect');//合约配置数据列表
    })->middleware(VisitLimit::class);

    Route::group(function (){
        //获取邀请码
        Route::post('/invite_code','Users/inviteCode');
        //重置用户登录密码
        Route::post('/reset_pwd','Users/resetPwd');
        //重置用户交易密码
        Route::post('/reset_ta','Users/resetTrans');
        //购买合约
        Route::post('/purchase','Purchase/index');
        //获取已购买合约记录数据列表
        Route::post('/contractLists','Contract/userSelect');
        //用户获取收益发放记录数据列表
        Route::post('/transaction','Transaction/userSelect');
    })->middleware([CheckUserToken::class,VisitLimit::class]);

    Route::miss(function() {
        return '404 Not Found!';
    });
})->middleware([LoadLangPack::class])->allowCrossDomain();
