<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: FusionSDK Team <kevin@fusionsdk.com>
// +----------------------------------------------------------------------

namespace app\realname\validate;

use think\Validate;

class AppValidate extends Validate
{
    protected $rule = [
        'app_name'                      => 'require',
        'app_secret'                    => 'require',
        'realname_status'               => 'require',
        'fatigue_status'                => 'require',
        'recharge_status'               => 'require',
        'recharge_query_url'            => 'url'
    ];

    protected $message = [
        'app_name.require'              => '应用名称不能为空',
        'app_secret.require'            => '应用密钥不能为空',
        'realname_status.require'       => '实名认证状态不能为空',
        'fatigue_status.require'        => '防沉迷状态不能为空',
        'recharge_status.require'       => '充值统计方式不能为空',
        'recharge_query_url.url'        => '游戏充值查询地址不是有效的URL',
    ];

}