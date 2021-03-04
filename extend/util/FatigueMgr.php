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

namespace util;

use app\realname\model\GameAppModel;
use app\realname\model\GameHolidayModel;
use app\realname\model\GameUserModel;
use app\realname\model\GameUserRechargeModel;
use app\realname\model\GameGuestDeviceModel;
use util\IDCardMgr;
use think\Db;

/**
 * 防沉迷工具类
 */
class FatigueMgr
{

    /**
     * 判断今日在线状态
     *
     * @param  string $appId 应用ID
     * @param  string $idCard 身份证号
     * @param  int $onlineTime 今日在线时长
     * @return boolean
     */
    public function vaildOnlineStatus($appId, $idCard, $onlineTime)
    {
        // 判断app的防沉迷状态
        if (!$this->appFatigueStatus($appId)) {
            return true;
        }

        // 判断年龄等级
        $ageLevel = $this->ageLevel($idCard);
        // if ($ageLevel == '0')
        // {
        //     return false;
        // }
        // else if ($ageLevel == '3')
        // {
        //     return true;
        // }
        if ($ageLevel == '3')
        {
            return true;
        }

        // 判断是否在未成年人禁止游戏时间段
        if ($this->forbiddenTimeRangeStatus()) {
            return false;
        }

        // 判断是否是休息日
        if ($this->isRestDay()) {
            return !$this->isOverLimitTimeToday(true, $onlineTime);
        } else {
            return !$this->isOverLimitTimeToday(false, $onlineTime);
        }
    }

    /**
     * 判断app的防沉迷状态是否开启
     *
     * @param  string $appId
     * @return boolean
     */
    private function appFatigueStatus($appId)
    {
        $data = GameAppModel::get($appId);
        if (!$data) {
            return false;
        }
        return ($data->fatigue_status == '1') ? true : false;
    }

    /**
     * 判断年龄阶段
     *
     * @param  string $idCard
     * @return string 0:8岁以下, 1:8-15岁, 2:16-17岁, 3:成年人
     */
    private function ageLevel($idCard)
    {
        $manager = new IDCardMgr();
        $age = $manager->age($idCard);
        if ($age < 8)
        {
            // 8岁以下
            return '0';
        }
        else if ($age >=8 && $age < 16)
        {
            // 8-15岁
            return '1';
        }
        else if ($age >=16 && $age < 18)
        {
            // 16-17岁
            return '2';
        }
        else
        {
            // 成年人
            return '3';
        }
    }

    /**
     * 判断是否在未成年人禁止游戏时间段
     *
     * @return boolean
     */
    private function forbiddenTimeRangeStatus()
    {
        $flag = false;
        // 获取配置
        $range = cmf_get_option('realname_settings')['young_forbidden_timerange'];
        if (empty($range))
        {
            return $flag;
        }
        $arr_range = explode(",", $range);

        foreach ($arr_range as $r)
        {
            $start = explode("-", $r)[0];
            $end = explode("-", $r)[1];
            if ($this->checkIsBetweenTime($start, $end))
            {
                $flag = true;
                return $flag;
            }
        }

        return $flag;
    }

    /**
     * 判断当前的时分是否在指定的时间段内
     * 
     * @param $start 开始时分  eg:10:30
     * @param $end  结束时分   eg:15:30
     * @return: boolean  1：在范围内，0:没在范围内
     */
    private function checkIsBetweenTime($start, $end)
    {
        $date = date('H:i');
        $curTime = strtotime($date); //当前时分
        $assignTime1 = strtotime($start); //获得指定分钟时间戳，00:00
        $assignTime2 = strtotime($end); //获得指定分钟时间戳，01:00
        $result = false;
        if ($curTime >= $assignTime1 && $curTime <= $assignTime2){
            $result = true;
        }
        return $result;
    }

    /**
     * 判断是否是休息日
     * 
     * @return: boolean
     */
    private function isRestDay()
    {
        // 当日时间戳
        $dt = strtotime(date('Y-m-d'));
        $data = GameHolidayModel::get($dt);
        if (!$data)
        {
            // $wd = date('w', time()); // 星期几
            // return ($wd == 6 || $wd == 0) ? true : false;
			// Modified by stozen (2020-11-04) 周六周日非节假日
            return false;
        }
        else
        {
            return ($data->date_status == 1) ? true: false;
        }
    }

    /**
     * 判断当日游戏时长是否超过限制
     * 
     * @param $restFlag boolean true:休息日 false:工作日
     * @param $onlineTime int 在线时长
     * @return: boolean
     */
    private function isOverLimitTimeToday($restFlag, $onlineTime)
    {
        $limitTime = $restFlag ? intval(cmf_get_option('realname_settings')['young_time_limit_holiday'])
                                : intval(cmf_get_option('realname_settings')['young_time_limit_weekday']);
        return ($onlineTime >= $limitTime) ? true : false;
    }

    /**
     * 获取当月购买限制
     * 
     * @param $idCard
     * @return: int
     */
    public function getPayLimitMonthly($idCard)
    {
        $ageLevel = $this->ageLevel($idCard);
        if ($ageLevel == '0')
        {
            return 0;
        }
        else if ($ageLevel == '1')
        {
            return floatval(cmf_get_option('realname_settings')['young2_pay_limit_monthly']);
        }
        else if ($ageLevel == '2')
        {
            return floatval(cmf_get_option('realname_settings')['young3_pay_limit_monthly']);
        }
        else
        {
            return -1;
        }
    }

    /**
     * 获取一次购买限制
     * 
     * @param $idCard
     * @return: int
     */
    public function getPayLimitOnce($idCard)
    {
        $ageLevel = $this->ageLevel($idCard);
        if ($ageLevel == '0')
        {
            return 0;
        }
        else if ($ageLevel == '1')
        {
            return floatval(cmf_get_option('realname_settings')['young2_pay_limit_once']);
        }
        else if ($ageLevel == '2')
        {
            return floatval(cmf_get_option('realname_settings')['young3_pay_limit_once']);
        }
        else
        {
            return -1;
        }
    }

    /**
     * 获取当天游戏时长限制
     * 
     * @param $idCard
     * @return: int
     */
    public function getOnlineTimeLimitDaily($idCard)
    {
        $ageLevel = $this->ageLevel($idCard);
        // if ($ageLevel == '0')
        // {
        //     return 0;
        // }
        // else if ($ageLevel == '3')
        // {
        //     return -1;
        // }
        if ($ageLevel == '3')
        {
            return -1;
        }
        else
        {
            return $this->isRestDay() ? intval(cmf_get_option('realname_settings')['young_time_limit_holiday'])
                                        : intval(cmf_get_option('realname_settings')['young_time_limit_weekday']);
        }
    }

    /**
     * 获取游客用户的反沉迷状态
     * 
     * @param $appId
     * @param $uid
     * @param $deviceId
     * @param $sessionId
     * @return: array (
     *       "level" => 0,
     *       "status" => 1,
     *       "remaining_time" => 0,
     *       "surplus_money_monthly" => 0,
     *       "once_recharge_limit" => 0,
     *       "online_limit" => 0,
     *       "recharge_limit_monthly" => 0 )
     */
    public function getGuestStatus($appId, $uid, $deviceId, $sessionId)
    {
        $status = array(
            "level" => 0,
            "status" => 1,
            "remaining_time" => 0,
            "surplus_money_monthly" => 0,
            "once_recharge_limit" => 0,
            "online_limit" => intval(cmf_get_option('realname_settings')['guest_time_limit']),
            "recharge_limit_monthly" => 0
        );
        $device = GameGuestDeviceModel::get([
            'app_id' => $appId,
            'device_id' => $deviceId
        ]);
        // 新设备
        if (!$device) {
            Db::table('game_guest_device')
                ->insert([
                    'app_id' => $appId,
                    'uid' => $uid,
                    'device_id' => $deviceId,
                    'create_time' => time(),
                    'update_time' => time()
                ]);
        } else {
            $replay_ts = $device->create_time + intval(cmf_get_option('realname_settings')['guest_replay_limit']);
            if ($replay_ts <= time()) // 同设备重新体验
            {
                $device->uid = $uid;
                $device->create_time = time();
                $device->update_time = time();
                $device->save();
            }
            else
            {
                if ($device->uid != $uid)
                {
                    // 返回
                    $status['status'] = 4; // 设备重复踢线
                    $status['remaining_time'] = 0;
                    return $status;
                }
                else
                {
                    $device->update_time = time();
                    $device->save();
                }
            }
        }

        $guest = GameUserModel::get([
            'app_id' => $appId,
            'uid' => $uid,
            'user_type' => 0
        ]);
        // 新游客
        if (!$guest) {
            Db::table('game_user')
                ->insert([
                    'app_id' => $appId,
                    'uid' => $uid,
                    'user_type' => 0,
                    'real_name' => '',
                    'idcard' => '',
                    'create_time' => time(),
                    'session_id' => $sessionId,
                    'update_time' => time(),
                    'online_time' => 0
                ]);
            // 返回
            $status['status'] = 0; // 正常
            $status['remaining_time'] = $status['online_limit'];
            return $status;
        }
        
        // 判断体验时长是否结束
        if ($guest->online_time >= $status['online_limit']) // 是
        {
            // 返回
            $status['status'] = 1; // 踢线
            $status['remaining_time'] = 0;
            return $status;
        }
        // 判断是否同一次登录
        if ($guest->session_id != $sessionId) // 不是
        {
            $guest->session_id = $sessionId;
            $guest->update_time = time();
            $guest->save();
            // 返回
            $status['status'] = 0; // 正常
            $status['remaining_time'] = $status['online_limit'] - $guest->online_time;
            return $status;
        }
        // 判断是否超时
        $olt = $guest->online_time + (time() - $guest->update_time);
        if ($olt >= $status['online_limit']) // 超时
        {
            $guest->update_time = time();
            $guest->online_time = $olt;
            $guest->save();
            // 返回
            $status['status'] = 1; // 踢线
            $status['remaining_time'] = 0;
            return $status;
        }

        $guest->update_time = time();
        $guest->online_time = $olt;
        $guest->save();
        // 返回
        $status['status'] = 0; // 正常
        $status['remaining_time'] = $status['online_limit'] - $olt;
        return $status;
    }

    /**
     * 获取实名用户的反沉迷状态
     * 
     * @param $appId
     * @param $deviceId
     * @param $uid
     * @param $sessionId
     * @param $idCard
     * @param $realName
     * @return: array (
     *       "level" => 0,
     *       "status" => 1,
     *       "remaining_time" => 0,
     *       "surplus_money_monthly" => 0,
     *       "once_recharge_limit" => 0,
     *       "online_limit" => 0,
     *       "recharge_limit_monthly" => 0 )
     */
    public function getUserStatus($appId, $deviceId, $uid, $sessionId, $idCard, $realName)
    {
        $status = array(
            "level" => 2,
            "status" => 1,
            "remaining_time" => 0,
            "surplus_money_monthly" => 0,
            "once_recharge_limit" => $this->getPayLimitOnce($idCard),
            "online_limit" => $this->getOnlineTimeLimitDaily($idCard),
            "recharge_limit_monthly" => $this->getPayLimitMonthly($idCard)
        );

        $ageLevel = $this->ageLevel($idCard);
        // if ($ageLevel == '0') // 8岁以下
        // {
        //     // 返回
        //     $status['level'] = 2;
        //     // return $status;
        // }
        // else if ($ageLevel == '3') // 成年人
        if ($ageLevel == '3') // 成年人
        {
            // 返回
            $status['level'] = 1;
            $status['status'] = 0;
            $status['remaining_time'] = -1;
            $status['surplus_money_monthly'] = -1;
            $status['once_recharge_limit'] = -1;
            $status['online_limit'] = -1;
            $status['recharge_limit_monthly'] = -1;
            return $status;
        }
        else if ($ageLevel == '1') // 8到16岁(未满)
        {
            $status['level'] = 3;
        }
        else if ($ageLevel == '2') // 16到18岁(未满)
        {
            $status['level'] = 4;
        }

        // 未成年0-17岁
        if ($this->forbiddenTimeRangeStatus()) // 限制时间
        {
            $status['status'] = 2; // 限制时间踢线
            $status['remaining_time'] = 0;
            $status['surplus_money_monthly'] = 0;
            return $status;
        }

        // 1. 获取用户信息
        $user = GameUserModel::get([
            'app_id' => $appId,
            'uid' => $uid,
            'user_type' => 1
        ]);
        // 新实名用户
        if (!$user) {
            Db::table('game_user')
                ->insert([
                    'app_id' => $appId,
                    'uid' => $uid,
                    'user_type' => 1,
                    'real_name' => $realName,
                    'idcard' => $idCard,
                    'create_time' => time(),
                    'session_id' => $sessionId,
                    'update_time' => time(),
                    'online_time' => 0
                ]);
            // 返回
            $status['status'] = 0; // 正常
            $status['remaining_time'] = $status['online_limit'];
            return $status;
        }
        // 判断是否是新的一天
        if (date('Y-m-d') == date('Y-m-d', $user->update_time)) // 同天
        {
            // 判断是否同一次登录
            if ($user->session_id != $sessionId) // 不是
            {
                // 超时
                if ($user->online_time >= $status['online_limit'])
                {
                    // 返回
                    if ($this->isRestDay())
                    {
                        $status['status'] = 3; // 踢线(休息日)
                    }
                    else
                    {
                        $status['status'] = 1; // 踢线
                    }
                }
                else
                {
                    $user->session_id = $sessionId;
                    $user->update_time = time();
                    $user->save();
                    // 返回
                    $status['status'] = 0; // 正常
                    $status['remaining_time'] = $status['online_limit'] - $user->online_time;
                }
            }
            else
            {
                // 判断是否超时
                $olt = $user->online_time + (time() - $user->update_time);
                if ($olt >= $status['online_limit']) // 超时
                {
                    $user->update_time = time();
                    $user->online_time = $olt;
                    $user->save();
                    // 返回
                    if ($this->isRestDay())
                    {
                        $status['status'] = 3; // 踢线(休息日)
                    }
                    else
                    {
                        $status['status'] = 1; // 踢线
                    }
                    $status['remaining_time'] = 0;
                }
                else // 没超时
                {
                    $user->update_time = time();
                    $user->online_time = $olt;
                    $user->save();
                    // 返回
                    $status['status'] = 0; // 正常
                    $status['remaining_time'] = $status['online_limit'] - $olt;
                }
            }
        }
        else // 不同天
        {
            $user->session_id = $sessionId;
            $user->update_time = time();
            $user->online_time = 0;
            $user->save();
            // 返回
            $status['status'] = 0; // 正常
            $status['remaining_time'] = $status['online_limit'];
        }

        // 2.获取充值信息
        $recharge = GameUserRechargeModel::get([
            'app_id' => $appId,
            'uid' => $uid
        ]);
        // 新充值用户
        if (!$recharge) {
            Db::table('game_user_recharge')
                ->insert([
                    'app_id' => $appId,
                    'uid' => $uid,
                    'update_time' => time(),
                    'pay_monthly' => 0
                ]);
            // 返回
            $status['surplus_money_monthly'] = $status['recharge_limit_monthly'];
        }
        else
        {
            // 判断是否是新月
            if (date('Y-m') == date('Y-m', $recharge->update_time)) // 同月
            {
                // 返回
                $status['surplus_money_monthly'] = $status['recharge_limit_monthly'] - $recharge->pay_monthly;
            }
            else // 不同月
            {
                // 返回
                $status['surplus_money_monthly'] = $status['recharge_limit_monthly'];
            }
        }

        if ($ageLevel == '0') // 8岁以下
        {
            $status['level'] = 2;
            $status['surplus_money_monthly'] = 0;
            $status['once_recharge_limit'] = $this->getPayLimitOnce($idCard);
            $status['recharge_limit_monthly'] = $this->getPayLimitMonthly($idCard);
        }

        return $status;
    }

    /**
     * 获取实名状态关闭情况下的用户状态
     * 
     * @return: array (
     *       "level" => 0,
     *       "status" => 1,
     *       "remaining_time" => 0,
     *       "surplus_money_monthly" => 0,
     *       "once_recharge_limit" => 0,
     *       "online_limit" => 0,
     *       "recharge_limit_monthly" => 0 )
     */
    public function getNoFatigueStatus()
    {
        return array(
            "level" => 1,
            "status" => 0,
            "remaining_time" => -1,
            "surplus_money_monthly" => -1,
            "once_recharge_limit" => -1,
            "online_limit" => -1,
            "recharge_limit_monthly" => -1
        );
    }
}