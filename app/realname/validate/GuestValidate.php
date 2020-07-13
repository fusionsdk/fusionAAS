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

class GuestValidate extends Validate
{
    protected $rule = [
        'online_time'                   => 'require|number'
    ];

    protected $message = [
        'online_time.require'           => '累计在线时长不能为空',
        'online_time.number'            => '累计在线时长只能是整数',
    ];

}