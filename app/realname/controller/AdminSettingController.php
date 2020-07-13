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

/**
 * Class SettingController
 * @package app\realname\controller
 * @adminMenuRoot(
 *     'name'   =>'防沉迷管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 0,
 *     'icon'   =>'cogs',
 *     'remark' =>'防沉迷系统入口'
 * )
 */
class AdminSettingController extends AdminBaseController
{

    /**
     * 防沉迷设置
     * @adminMenu(
     *     'name'   => '防沉迷设置',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '防沉迷设置',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $content = hook_one('realname_setting_index_view');

        if (!empty($content)) {
            return $content;
        }

        $this->assign('realname_settings', cmf_get_option('realname_settings'));

        return $this->fetch();
    }

    /**
     * 防沉迷设置提交
     * @adminMenu(
     *     'name'   => '防沉迷设置提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '防沉迷设置提交',
     *     'param'  => ''
     * )
     */
    public function indexPost()
    {
        if ($this->request->isPost()) {
            $result = $this->validate($this->request->param(), 'Setting');
            if ($result !== true) {
                $this->error($result);
            }

            $options = $this->request->param('options/a');
            cmf_set_option('realname_settings', $options);

            $this->success("保存成功！", '');

        }
    }

}