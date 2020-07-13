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
use app\realname\model\GameHolidayModel;
use think\Db;
use think\facade\Cache;

class AdminHolidayController extends AdminBaseController
{

    /**
     * 节日管理列表
     * @adminMenu(
     *     'name'   => '节日管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '节日管理',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('realname_holiday_index_view');

        if (!empty($content)) {
            return $content;
        }

        $data = Db::table('game_holiday')->order('dt', 'DESC')->paginate(10);
        $page = $data->render();
        $this->assign("holidays", $data);
        $this->assign('page', $page);
        return $this->fetch();
    }

    /**
     * 添加节日
     * @adminMenu(
     *     'name'   => '添加节日',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加节日',
     *     'param'  => ''
     * )
     * @return mixed
     */
    public function holidayAdd()
    {
        $content = hook_one('realname_holiday_add_view');

        if (!empty($content)) {
            return $content;
        }

        return $this->fetch();
    }

    /**
     * 添加节日提交
     * @adminMenu(
     *     'name'   => '添加节日提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加节日提交',
     *     'param'  => ''
     * )
     */
    public function holidayAddPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'holiday');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);
            } else {
                $result = GameHolidayModel::create([
                    'dt'                        => strtotime($data['dt']),
                    'date_status'               => $data['date_status'],
                ]);
                if ($result) {
                    $this->success("添加节日成功", url("admin_holiday/index"));
                } else {
                    $this->error("添加节日失败");
                }

            }
        }
    }

    /**
     * 编辑节日
     * @adminMenu(
     *     'name'   => '编辑节日',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑节日',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function holidayEdit()
    {
        $content = hook_one('realname_holiday_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param("dt", 0, 'intval');
        $data = GameHolidayModel::get($id);
        if (!$data) {
            $this->error("该节日不存在！");
        }
        $this->assign("data", $data);
        return $this->fetch();
    }

    /**
     * 编辑节日提交
     * @adminMenu(
     *     'name'   => '编辑节日提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑节日提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function holidayEditPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $result = $this->validate($data, 'holiday');
            if ($result !== true) {
                // 验证失败 输出错误信息
                $this->error($result);

            } else {
                $id = strtotime($data['dt']);
                $holiday = GameHolidayModel::get($id);
                if (!$holiday) {
                    $this->error("该节日不存在！");
                }
                $holiday->date_status            = $data['date_status'];
                if ($holiday->save() !== false) {
                    $this->success("保存成功！", url('admin_holiday/index'));
                } else {
                    $this->error("保存失败！");
                }
            }
        }
    }

    /**
     * 删除节日
     * @adminMenu(
     *     'name'   => '删除节日',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除节日',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function holidayDelete()
    {
        $id = $this->request->param("dt", 0, 'intval');
        $holiday = GameHolidayModel::get($id);
        if (!$holiday) {
            $this->error("删除失败，该节日不存在！");
        }
        $status = GameHolidayModel::destroy(['dt' => $id]);
        if (!empty($status)) {
            $this->success("删除成功！", url('admin_holiday/index'));
        } else {
            $this->error("删除失败！");
        }
    }

}

