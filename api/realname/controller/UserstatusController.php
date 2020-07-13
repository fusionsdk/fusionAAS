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
use util\FatigueMgr;
use cmf\controller\RestBaseController;

class UserstatusController extends RestBaseController
{
    public function index()
    {
        $data = $this->request->param();
        if (empty($data['appId']) || empty($data['uid']) || empty($data['deviceId']) || empty($data['sessionId']))
        {
            $this->error('请求参数不完整');
        }

        $appId = $data['appId'];
        $uid = $data['uid'];
        $deviceId = $data['deviceId'];
        $sessionId = $data['sessionId'];

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
            $this->success('成功', $manager->getGuestStatus($appId, $uid, $deviceId, $sessionId));
        }
        else
        {
            $this->success('成功', $manager->getUserStatus($appId, $deviceId, $uid, $sessionId, $user->idcard, $user->real_name));
        }
    }
}
