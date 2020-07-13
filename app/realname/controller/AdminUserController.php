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

namespace app\realname\controller;

use cmf\controller\AdminBaseController;
use app\realname\model\GameAppModel;
use app\realname\model\GameUserModel;
use app\realname\model\GameUserRechargeModel;
use app\realname\model\GameGuestDeviceModel;
use think\Db;
use think\db\Query;
use think\facade\Cache;

class AdminUserController extends AdminBaseController
{

    /**
     * 游客管理列表
     * @adminMenu(
     *     'name'   => '游客管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '游客管理',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function guestIndex()
    {
        $content = hook_one('realname_user_guest_index_view');

        if (!empty($content)) {
            return $content;
        }

        // 分页参数
        $pageParams = array();
        $req = $this->request->param();
        if (!empty($req['uid'])) {
            $pageParams['uid'] = $req['uid'];
        }
        if (!empty($req['app_id'])) {
            $pageParams['app_id'] = $req['app_id'];
        }

        $data = Db::view(['game_user' => 'u'], 'app_id,uid,create_time,update_time,online_time')
            ->view(['game_guest_device' => 'd'], 'device_id,create_time ctime,update_time utime', 'd.app_id=u.app_id and d.uid=u.uid', 'LEFT')
            ->view(['game_app' => 'a'], 'app_name', 'a.app_id=u.app_id', 'LEFT')
            ->where(function (Query $query) {
                // 帐号
                $query->where('user_type', '0');

                $req = $this->request->param();
                if (!empty($req['uid'])) {
                    $query->where('u.uid', 'like', '%' . $req['uid'] . '%');
                }
                if (!empty($req['app_id'])) {
                    $query->where('u.app_id', $req['app_id']);
                }
            })
            ->order("create_time DESC")
            ->paginate(10, false, ['query'=>$pageParams]);
        $page = $data->render();
        $apps = Db::table('game_app')->order('create_time', 'DESC')->select();
        $this->assign("users", $data);
        $this->assign('page', $page);
        $this->assign('apps', $apps);
        return $this->fetch();
    }

    /**
     * 编辑游客
     * @adminMenu(
     *     'name'   => '编辑游客',
     *     'parent' => 'guestIndex',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑游客',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function guestEdit()
    {
        $content = hook_one('realname_user_guest_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $req = $this->request->param();
        $uid = $req['uid'];
        $app_id = $req['app_id'];
        $data = GameUserModel::get([
            'uid' => $uid,
            'app_id' => $app_id,
            'user_type' => '0'
        ]);
        if (!$data) {
            $this->error("该游客不存在！");
        }
        $app = GameAppModel::get($app_id);
        $this->assign("data", $data);
        $this->assign("app", $app);
        return $this->fetch();
    }

    /**
     * 编辑游客提交
     * @adminMenu(
     *     'name'   => '编辑游客提交',
     *     'parent' => 'guestIndex',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑游客提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function guestEditPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'guest');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);

            } else {
                $uid = $data['uid'];
                $app_id = $data['app_id'];
                $guest = GameUserModel::get([
                    'uid' => $uid,
                    'app_id' => $app_id,
                    'user_type' => '0'
                ]);
                if (!$guest) {
                    $this->error("该游客不存在！");
                }
                $guest->online_time = $data['online_time'];
                if ($guest->save() !== false) {
                    $this->success("保存成功！", url('admin_user/guestIndex'));
                } else {
                    $this->error("保存失败！");
                }
            }
        }
    }

    /**
     * 实名用户管理列表
     * @adminMenu(
     *     'name'   => '实名用户管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '实名用户管理',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userIndex()
    {
        $content = hook_one('realname_user_user_index_view');

        if (!empty($content)) {
            return $content;
        }

        // 分页参数
        $pageParams = array();
        $req = $this->request->param();
        if (!empty($req['uid'])) {
            $pageParams['uid'] = $req['uid'];
        }
        if (!empty($req['real_name'])) {
            $pageParams['real_name'] = $req['real_name'];
        }
        if (!empty($req['idcard'])) {
            $pageParams['idcard'] = $req['idcard'];
        }
        if (!empty($req['app_id'])) {
            $pageParams['app_id'] = $req['app_id'];
        }

        $data = Db::view(['game_user' => 'u'], 'app_id,uid,real_name,idcard,create_time,update_time,online_time')
            ->view(['game_user_recharge' => 'r'], 'update_time utime,pay_monthly', 'r.app_id=u.app_id and r.uid=u.uid', 'LEFT')
            ->view(['game_app' => 'a'], 'app_name', 'a.app_id=u.app_id', 'LEFT')
            ->where(function (Query $query) {
                // 帐号
                $query->where('user_type', '1');
                
                $req = $this->request->param();
                if (!empty($req['uid'])) {
                    $query->where('u.uid', 'like', '%' . $req['uid'] . '%');
                }
                if (!empty($req['real_name'])) {
                    $query->where('u.real_name', 'like', '%' . $req['real_name'] . '%');
                }
                if (!empty($req['idcard'])) {
                    $query->where('u.idcard', 'like', '%' . $req['idcard'] . '%');
                }
                if (!empty($req['app_id'])) {
                    $query->where('u.app_id', $req['app_id']);
                }
            })
            ->order("create_time DESC")
            ->paginate(10, false, ['query'=>$pageParams]);
        $page = $data->render();
        $apps = Db::table('game_app')->order('create_time', 'DESC')->select();
        $this->assign("users", $data);
        $this->assign('page', $page);
        $this->assign('apps', $apps);
        return $this->fetch();
    }

    /**
     * 编辑实名用户
     * @adminMenu(
     *     'name'   => '编辑实名用户',
     *     'parent' => 'userIndex',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑实名用户',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userEdit()
    {
        $content = hook_one('realname_user_user_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $req = $this->request->param();
        $uid = $req['uid'];
        $app_id = $req['app_id'];
        $data = Db::view(['game_user' => 'u'], 'app_id,uid,real_name,idcard,online_time')
            ->view(['game_user_recharge' => 'r'], 'pay_monthly', 'r.app_id=u.app_id and r.uid=u.uid', 'LEFT')
            ->where('u.app_id', $app_id)
            ->where('u.uid', $uid) 
            ->select();
        if (!$data) {
            $this->error("该实名用户不存在！");
        }
        $app = GameAppModel::get($app_id);
        $this->assign("data", $data[0]);
        $this->assign("app", $app);
        return $this->fetch();
    }

    /**
     * 编辑实名用户提交
     * @adminMenu(
     *     'name'   => '编辑实名用户提交',
     *     'parent' => 'userIndex',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑实名用户提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function userEditPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'user');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);

            } else {
                $uid = $data['uid'];
                $app_id = $data['app_id'];
                $real_name = $data['real_name'];
                $idcard = $data['idcard'];
                $online_time = $data['online_time'];
                $pay_monthly = $data['pay_monthly'];

                // 启动事务
                Db::startTrans();
                try {
                    // 用户表
                    Db::table('game_user')
                        ->where('uid', $uid)
                        ->where('app_id', $app_id)
                        ->where('user_type', 1)
                        ->update([
                           'real_name' => $real_name,
                           'idcard' => $idcard,
                           'online_time' => $online_time,
                           'update_time' => time()
                        ]);
                    // 充值表
                    $recharge = Db::table('game_user_recharge')
                        ->where('uid', $uid)
                        ->where('app_id', $app_id)
                        ->find();
                    if (is_array($recharge) && count($recharge)>0) {
                        Db::table('game_user_recharge')
                            ->where('uid', $uid)
                            ->where('app_id', $app_id)
                            ->update([
                                'pay_monthly' => $pay_monthly
                            ]);
                    } else {
                        Db::table('game_user_recharge')
                            ->insert([
                                'app_id' => $app_id,
                                'uid' => $uid,
                                'update_time' => time(),
                                'pay_monthly' => $pay_monthly
                            ]);
                    }
                    // 提交事务
                    Db::commit();
                    $this->success("保存成功！", url('admin_user/userIndex'));
                } catch (\think\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    $this->error("保存失败！". $e->getMessage());
                }
            }
        }
    }

    /**
     * 删除游客设备
     * @adminMenu(
     *     'name'   => '删除游客设备',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除游客设备',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function guestDeviceDelete()
    {
        $req = $this->request->param();
        $device_id = $req['device_id'];
        $app_id = $req['app_id'];
        $count = Db::table('game_guest_device')
            ->where('app_id', $app_id)
            ->where('device_id', $device_id)
            ->delete();
        if ($count > 0) {
            $this->success("删除成功！", url('admin_user/guestIndex'));
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 删除实名用户
     * @adminMenu(
     *     'name'   => '删除实名用户',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除实名用户',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function userDelete()
    {
        $req = $this->request->param();
        $uid = $req['uid'];
        $app_id = $req['app_id'];
        $count = Db::table('game_user')
            ->where('app_id', $app_id)
            ->where('uid', $uid)
            ->where('user_type', 1)
            ->delete();
        if ($count > 0) {
            $this->success("删除成功！", url('admin_user/userIndex'));
        } else {
            $this->error("删除失败！");
        }
    }

}

