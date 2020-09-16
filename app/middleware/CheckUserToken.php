<?php
declare (strict_types = 1);

namespace app\middleware;

use app\common\controller\StatusCode;

/**
 * 用户登录状态验证
 * Class CheckAdminToken
 * @package app\middleware
 * Date: 2020/8/22 17:13
 */
class CheckUserToken
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
        if(!$request->param('token') || $request->param('token') === 'null'){
            return result(lang('Please log in first'),StatusCode::$LOGIN);
        }
        $users = cache($request->param('token'));
        if(cache('?'.$request->param('token').'stamp') === false) return result('登录超时',StatusCode::$LOGIN);
        if(!$users) return result(lang('Please log in first'),StatusCode::$LOGIN);
        if(time() > cache($request->param('token').'stamp')){
            cache($request->param('token'),null);
            return result('长时间未操作，自动退出登录',StatusCode::$LOGIN);
        }
        request()->userId = $users->id;
        request()->userInfo = $users;
        cache($request->param('token').'stamp',time() + STILL_TIME);
        return $next($request);
    }
}
