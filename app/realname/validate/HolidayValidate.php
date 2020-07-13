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

class HolidayValidate extends Validate
{
    protected $rule = [
        'dt'                            => 'require|date',
        'date_status'                   => 'require'
    ];

    protected $message = [
        'dt.require'                    => '节日日期不能为空',
        'dt.date'                       => '节日日期格式不正确',
        'date_status.require'           => '日期状态不能为空',
    ];

}