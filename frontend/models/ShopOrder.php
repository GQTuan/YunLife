<?php

namespace frontend\models;

use Yii;

class ShopOrder extends \common\models\ShopOrder
{
    public function rules()
    {
        return array_merge(parent::rules(), [
            // [['field1', 'field2'], 'required', 'message' => '{attribute} is required'],
        ]);
    }

    public function scenarios()
    {
        return array_merge(parent::scenarios(), [
            // 'scenario' => ['field1', 'field2'],
        ]);
    }

    public function attributeLabels()
    {
        return array_merge(parent::attributeLabels(), [
            // 'field1' => 'description1',
            // 'field2' => 'description2',
        ]);
    }

    //中云第三方支付 商品支付
    public static function payShop($amount,$acquirer_type = 'WXZF', $tongdao = 'WftWx')
    {
        //保存充值记录
        $shopOrder = new ShopOrder();
        $shopOrder->created_by = u()->id;
        $shopOrder->shop_id    = post('shop_id');
        $shopOrder->order = u()->id . date("YmdHis") . rand(1000, 9999);
        $shopOrder->amount = $amount;
        $shopOrder->charge_state = self::CHARGE_STATE_WAIT;
        if ($acquirer_type == 'alipay') {
            $shopOrder->charge_type = self::CHARGE_TYPE_ALIPAY;
        }

        if (!$shopOrder->save(false)) {
            return error($shopOrder);
        }
        // 微信、支付宝交易
        $url = 'http://zy.cnzypay.com/Pay_Index.html';

        $data['pay_memberid'] = ZYPAY_ID; //商户id
        $data['pay_orderid'] = $shopOrder->order;
        $data['pay_amount'] = $amount;
        $data['pay_applydate'] = self::$time; //请求时间
        $data['pay_bankcode'] = $acquirer_type; //银行编号
        $data['pay_notifyurl'] = url(['site/shopnotify'], true); //异步回调地址  融智付异步商户url
        $data['pay_callbackurl'] = url(['site/index'], true); //页面返回地址
        // 商户id、应用id、商户订单号、订单金额、加密key
        $string = '';
        ksort($data);
        reset($data);
        foreach($data as $key => $v) {
            $string .= "{$key}=>{$v}&";
        }
        $string .= "key=" . ZYPAY_KEY;
        $data['tongdao'] = $tongdao;
        $data['pay_md5sign'] = strtoupper(md5($string));
        if ($tongdao == 'Gopaywap') {
            $str = '<form id="Form1" name="Form1" method="post" action="' . $url . '">';
            foreach ($data as $key => $val) {
                $str = $str . '<input type="hidden" name="' . $key . '" value="' . $val . '">';
            }
            $str = $str . '<input type="hidden" value="提交">';
            $str = $str . '</form>';
            $str = $str . '<script>';
            $str = $str . 'document.Form1.submit();';
            $str = $str . '</script>';
            return $str;
        }
        $result = httpRequest($url, $data);
        preg_match('/<\s*img\s+[^>]*?src\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i', $result, $match);
        if (isset($match[2])) {
            return 'http://zy.cnzypay.com/' . $match[2];
        }
        return false;
    }
}
