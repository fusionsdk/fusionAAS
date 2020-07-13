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

/**
 * 身份证工具类
 */
class IDCardMgr
{
    /**
     * 检查身份证号码是否正确的正则
     */
    const REGX = '#(^\d{15}$)|(^\d{17}(\d|X)$)#';

    /**
     * 省
     *
     * @var array
     */
    protected $provinces = [
        11 => "北京", 12 => "天津", 13 => "河北", 14 => "山西", 15 => "内蒙古",
        21 => "辽宁", 22 => "吉林", 23 => "黑龙江", 31 => "上海", 32 => "江苏",
        33 => "浙江", 34 => "安徽", 35 => "福建", 36 => "江西", 37 => "山东", 41 => "河南",
        42 => "湖北", 43 => "湖南", 44 => "广东", 45 => "广西", 46 => "海南", 50 => "重庆",
        51 => "四川", 52 => "贵州", 53 => "云南", 54 => "西藏", 61 => "陕西", 62 => "甘肃",
        63 => "青海", 64 => "宁夏", 65 => "新疆", 71 => "台湾", 81 => "香港", 82 => "澳门", 91 => "国外"
    ];

    /**
     * 身份证号码校验
     *
     * @param  string $idCard
     * @return boolean
     */
    public function valid($idCard)
    {
        // 基础的校验，校验身份证格式是否正确
        if (!$this->isCardNumber($idCard)) {
            return false;
        }

        // 将 15 位转换成 18 位
        $idCard = $this->fifteen2Eighteen($idCard);

        // 检查省是否存在
        if (!$this->checkProvince($idCard)) {
            return false;
        }

        // 检查生日是否正确
        if (!$this->checkBirthday($idCard)) {
            return false;
        }

        // 检查校验码
        return $this->checkCode($idCard);
    }

    /**
     * 检测是否是身份证号码
     *
     * @param  string $idCard
     * @return boolean
     */
    private function isCardNumber($idCard)
    {
        return preg_match(self::REGX, $idCard);
    }

    /**
     * 15位转18位
     *
     * @param  string $idCard
     * @return void
     */
    private function fifteen2Eighteen($idCard)
    {
        if (strlen($idCard) != 15) {
            return $idCard;
        }

        // 如果身份证顺序码是996 997 998 999，这些是为百岁以上老人的特殊编码
        // $code = array_search(substr($idCard, 12, 3), [996, 997, 998, 999]) !== false ? '18' : '19';
        // 一般 19 就行了
        $code = '19';
        $idCardBase = substr($idCard, 0, 6) . $code . substr($idCard, 6, 9);
        return $idCardBase . $this->genCode($idCardBase);
    }

    /**
     * 检查省份是否正确
     *
     * @param  string $idCard
     * @return void
     */
    private function checkProvince($idCard)
    {
        $provinceNumber = substr($idCard, 0, 2);
        return isset($this->provinces[$provinceNumber]);
    }

    /**
     * 检测生日是否正确
     *
     * @param  string $idCard
     * @return void
     */
    private function checkBirthday($idCard)
    {
        $regx = '#^\d{6}(\d{4})(\d{2})(\d{2})\d{3}[0-9X]$#';
        if (!preg_match($regx, $idCard, $matches)) {
            return false;
        }
        array_shift($matches);
        list($year, $month, $day) = $matches;
        return checkdate($month, $day, $year);
    }

    /**
     * 校验码比对
     *
     * @param  string $idCard
     * @return void
     */
    private function checkCode($idCard)
    {
        $idCardBase = substr($idCard, 0, 17);
        $code = $this->genCode($idCardBase);
        return $idCard == ($idCardBase . $code);
    }

    /**
     * 生成校验码
     *
     * @param  string $idCardBase
     * @return void
     */
    final protected function genCode($idCardBase)
    {
        $idCardLength = strlen($idCardBase);
        if ($idCardLength != 17) {
            return false;
        }
        $factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        $verifyNumbers = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
        $sum = 0;
        for ($i = 0; $i < $idCardLength; $i++) {
            $sum += substr($idCardBase, $i, 1) * $factor[$i];
        }
        $index = $sum % 11;
        return $verifyNumbers[$index];
    }

    /**
     * 获取生日
     *
     * @param  string $idCard
     * @return string
     */
    public function birthday($idCard)
    {
        return strlen($idCard)==15 ? ('19' . substr($idCard, 6, 6)) : substr($idCard, 6, 8);
    }

    /**
     * 获取性别
     *
     * @param  string $idCard
     * @return string 1为男 0为女
     */
    public function sex($idCard)
    {
        return (int)substr($idCard, 16, 1) % 2 === 0 ? '0' : '1';
    }

    /**
     * 获取年龄
     *
     * @param  string $idCard
     * @return string
     */
    public function age($idCard)
    {
        if ($this->valid($idCard) == false)
        {
            return 0;
        }
        $birthday = $this->birthday($idCard) . '000000';
        $birthday_ts = strtotime($birthday);
        $curr_ts = time();
        //得到两个日期相差的大体年数
        $diff = floor(($curr_ts - $birthday_ts) / 86400 / 365);
        $age = strtotime(substr($birthday,0,8).' +'.$diff.'years') > $curr_ts ? ($diff + 1) : $diff;
        return $age;
    }
}