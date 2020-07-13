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
use app\realname\model\GameUserProfileModel;
use think\Db;
use think\facade\Cache;

/**
 * Class AdminAppController
 * @package app\realname\controller
 * @adminMenuRoot(
 *     'name'   =>'应用管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 20,
 *     'icon'   =>'gamepad',
 *     'remark' =>'应用管理'
 * )
 */
class AdminAppController extends AdminBaseController
{

    /**
     * 应用列表
     * @adminMenu(
     *     'name'   => '应用列表',
     *     'parent' => 'realname/Adminapp/index',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '应用列表',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('realname_app_index_view');

        if (!empty($content)) {
            return $content;
        }

        $data = Db::table('game_app')->order('create_time', 'DESC')->paginate(10);
        $page = $data->render();
        $this->assign("apps", $data);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 添加应用
     * @adminMenu(
     *     'name'   => '添加应用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加应用',
     *     'param'  => ''
     * )
     * @return mixed
     */
    public function appAdd()
    {
        $content = hook_one('realname_app_add_view');

        if (!empty($content)) {
            return $content;
        }

        return $this->fetch();
    }

    /**
     * 添加应用提交
     * @adminMenu(
     *     'name'   => '添加应用提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加应用提交',
     *     'param'  => ''
     * )
     */
    public function appAddPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'app');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);
            } else {
                $result = GameAppModel::create([
                    'app_secret'            => $data['app_secret'],
                    'app_name'              => $data['app_name'],
                    'app_icon'              => $data['app_icon'],
                    'create_time'           => time(),
                    'realname_status'       => $data['realname_status'],
                    'fatigue_status'        => $data['fatigue_status'],
                    'recharge_status'       => $data['recharge_status'],
                    'recharge_query_url'    => $data['recharge_query_url']
                ]);
                if ($result) {
                    $this->success("添加应用成功", url("admin_app/index"));
                } else {
                    $this->error("添加应用失败");
                }

            }
        }
    }

    /**
     * 编辑应用
     * @adminMenu(
     *     'name'   => '编辑应用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑应用',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function appEdit()
    {
        $content = hook_one('realname_app_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param("app_id", 0, 'intval');
        $data = GameAppModel::get($id);
        if (!$data) {
            $this->error("该应用不存在！");
        }
        $this->assign("data", $data);
        return $this->fetch();
    }

    /**
     * 编辑应用提交
     * @adminMenu(
     *     'name'   => '编辑应用提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑应用提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function appEditPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'app');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);

            } else {
                $id = $this->request->param("app_id", 0, 'intval');
                $app = GameAppModel::get($id);
                if (!$app) {
                    $this->error("该应用不存在！");
                }
                $app->app_secret            = $data['app_secret'];
                $app->app_name              = $data['app_name'];
                $app->app_icon              = $data['app_icon'];
                $app->realname_status       = $data['realname_status'];
                $app->fatigue_status        = $data['fatigue_status'];
                $app->recharge_status       = $data['recharge_status'];
                $app->recharge_query_url    = $data['recharge_query_url'];
                if ($app->save() !== false) {
                    $this->success("保存成功！", url('admin_app/index'));
                } else {
                    $this->error("保存失败！");
                }
            }
        }
    }

    /**
     * 删除应用
     * @adminMenu(
     *     'name'   => '删除应用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除应用',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function appDelete()
    {
        $id = $this->request->param("app_id", 0, 'intval');
        $count = GameUserProfileModel::all(['app_id' => $id])->count();
        if ($count > 0) {
            $this->error("该应用已经有玩家数据，不能删除！");
        } else {
            $status = GameAppModel::destroy(['app_id' => $id]);
            if (!empty($status)) {
                $this->success("删除成功！", url('admin_app/index'));
            } else {
                $this->error("删除失败！");
            }
        }
    }

}

