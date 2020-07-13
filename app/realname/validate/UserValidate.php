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

use util\IDCardMgr;
use think\Validate;

class UserValidate extends Validate
{
    protected $rule = [
        'real_name'                     => 'require|chsAlphaNum',
        'idcard'                        => 'require|checkIdCard',
        'online_time'                   => 'require|number',
        'pay_monthly'                   => 'require|float'
    ];

    protected $message = [
        'real_name.require'             => '姓名不能为空',
        'real_name.chsAlphaNum'         => '姓名只能输入中文、字母和数字',
        'idcard.require'                => '身份证不能为空',
        'idcard.checkIdCard'            => '身份证号无效',
        'online_time.require'           => '在线时长不能为空',
        'online_time.number'            => '在线时长只能是整数',
        'pay_monthly.require'           => '累计充值不能为空',
        'pay_monthly.float'             => '累计充值只能是浮点数',
    ];

    // 自定义身份证验证规则
    protected function checkIdCard($value)
    {
        $manager = new IDCardMgr();
        return $manager->valid($value);
    }

}