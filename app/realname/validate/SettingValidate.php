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

class SettingValidate extends Validate
{
    protected $rule = [
        'options.guest_time_limit'              => 'require|integer',
        'options.guest_replay_limit'            => 'require|integer',
        'options.young_forbidden_timerange'     => 'require',
        'options.young_time_limit_weekday'      => 'require|integer',
        'options.young_time_limit_holiday'      => 'require|integer',
        'options.young2_pay_limit_once'         => 'require|float',
        'options.young2_pay_limit_monthly'      => 'require|float',
        'options.young3_pay_limit_once'         => 'require|float',
        'options.young3_pay_limit_monthly'      => 'require|float'
    ];

    protected $message = [
        'options.guest_time_limit.require'           => '游客体验时长不能为空',
        'options.guest_replay_limit.require'         => '游客再次体验周期不能为空',
        'options.young_time_limit_weekday.require'   => '未成年人可游戏时长(工作日)不能为空',
        'options.young_time_limit_holiday.require'   => '未成年人可游戏时长(节假日)不能为空',
        'options.young2_pay_limit_once.require'      => '单次购买限制(8-16周岁)不能为空',
        'options.young2_pay_limit_monthly.require'   => '每月购买限制(8-16周岁)不能为空',
        'options.young3_pay_limit_once.require'      => '单次购买限制(16-18周岁)不能为空',
        'options.young3_pay_limit_monthly.require'   => '每月购买限制(16-18周岁)不能为空',
        'options.guest_time_limit.integer'           => '游客体验时长只能是整数',
        'options.guest_replay_limit.integer'         => '游客再次体验周期只能是整数',
        'options.young_forbidden_timerange.require'  => '未成年人禁止游戏时间段不能为空',
        'options.young_time_limit_weekday.integer'   => '未成年人可游戏时长(工作日)只能是整数',
        'options.young_time_limit_holiday.integer'   => '未成年人可游戏时长(节假日)只能是整数',
        'options.young2_pay_limit_once.float'        => '单次购买限制(8-16周岁)只能是浮点数',
        'options.young2_pay_limit_monthly.float'     => '每月购买限制(8-16周岁)只能是浮点数',
        'options.young3_pay_limit_once.float'        => '单次购买限制(16-18周岁)只能是浮点数',
        'options.young3_pay_limit_monthly.float'     => '每月购买限制(16-18周岁)只能是浮点数',
    ];

}