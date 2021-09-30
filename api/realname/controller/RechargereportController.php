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

namespace api\realname\controller;

use app\realname\model\GameAppModel;
use app\realname\model\GameUserModel;
use app\realname\model\GameUserRechargeModel;
use util\FatigueMgr;
use cmf\controller\RestBaseController;
use think\Db;

class RechargereportController extends RestBaseController
{
    public function index()
    {
        $data = $this->request->param();
        if (empty($data['appId']) || empty($data['uid']) || empty($data['deviceId']) 
            || empty($data['sessionId']) || empty($data['itemId']) || empty($data['money']))
        {
            $this->error('请求参数不完整');
        }

        $appId = $data['appId'];
        $uid = $data['uid'];
        $deviceId = $data['deviceId'];
        $sessionId = $data['sessionId'];
        $itemId = $data['itemId'];
        $money = floatval($data['money']);

        $manager = new FatigueMgr();

        $app = GameAppModel::get($appId);
        if (!$app) {
            $this->error("该应用不存在！");
        }
        // 关闭防沉迷
        if ($app->fatigue_status == 0)
        {
            $this->success('成功', $manager->getNoFatigueStatus());
        }

        $user = GameUserModel::get([
            'app_id' => $appId,
            'uid' => $uid,
            'user_type' => 1
        ]);
        if (!$user) {
            $this->error("实名认证玩家不存在！");
        }

        // 判断是否超过单次充值限额
        $limitOnce = $manager->getPayLimitOnce($user->idcard);
        if ($limitOnce == -1)
        {
            $this->success('成功', $manager->getNoFatigueStatus());
        }
        else if ($money > $limitOnce)
        {
            $this->error("未成年人充值超过单次限额！");
        }
        $limitMonthly = $manager->getPayLimitMonthly($user->idcard);
        if ($limitMonthly != -1 && $money > $limitMonthly)
        {
            $this->error("未成年人充值超过本月限额！");
        }

        $recharge = GameUserRechargeModel::get([
            'app_id' => $appId,
            'uid' => $uid
        ]);
        if (!$recharge) {
            Db::table('game_user_recharge')
                ->insert([
                    'app_id' => $appId,
                    'uid' => $uid,
                    'update_time' => time(),
                    'pay_monthly' => $money
                ]);
        }
        else
        {
            // 判断是否是新月
            if (date('Y-m') == date('Y-m', $recharge->update_time)) // 同月
            {
                $paySum = $recharge->pay_monthly + $money;
                if ($paySum > $limitMonthly)
                {
                    $this->error("未成年人充值超过本月限额！");
                }
                else
                {
                    $recharge->update_time = time();
                    $recharge->pay_monthly = $paySum;
                    $recharge->save();
                }
            }
            else // 新月
            {
                $recharge->update_time = time();
                $recharge->pay_monthly = $money;
                $recharge->save();
            }
        }

        $this->success('成功', $manager->getUserStatus($appId, $deviceId, $uid, $sessionId, $user->idcard, $user->real_name));
    }
}
