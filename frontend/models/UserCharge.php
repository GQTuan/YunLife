<?php

namespace frontend\models;

use Yii;
use common\helpers\FileHelper;
class UserCharge extends \common\models\UserCharge
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

    //海马第三方支付（公众号新版）
    public static function payHmApchange($amount, $code)
    {
        //保存充值记录
        $userCharge = new UserCharge();
        $userCharge->user_id = u()->id;
        $userCharge->trade_no = u()->id . date("YmdHis") . rand(1000, 9999);
        $userCharge->amount = $amount;
        $userCharge->charge_type = self::CHARGE_TYPE_BANK;
        $userCharge->charge_state = self::CHARGE_STATE_WAIT;
        if (!$userCharge->save()) {
            return false;
        }
        require Yii::getAlias('@vendor/hm/HaimaPayment.php');
        require Yii::getAlias('@vendor/wx/WxTemplate.php');
        $haiMa = new \ApiClient();
        $haiMa->appId = HM_APPID;
        $haiMa->secret = HM_APPSECRET;
        $wx = new \WxTemplate();
        $tokenUrl = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . WX_APPID . '&secret=' . WX_APPSECRET . '&code=' . $code . '&grant_type=authorization_code';
        $info = $wx->getContents($tokenUrl);
        // test($info);
        if(isset($info['errcode'])) {
            test('指令失效，请回交易页面重新发起');
        }
        $method = 'weixin.mppay';
        $content = [
            'merchant_no' => '20170926141222023300',
            'out_trade_no' => $userCharge->trade_no,
            'order_name' => '用户充值',
            'total_amount' => $userCharge->amount,
            'sub_appid' => WX_APPID,
            'sub_openid' => $info['openid'],
            'spbill_create_ip' => Yii::$app->request->userIP,
            'notify_url' => url(['site/hm-alipaynotify'], true),
        ];
        // 组装内容 并发送
        $result = $haiMa->call($method, $content);
        // test($result);
        return $result;
    }

    //交易所第三方支付 98
    public static function quick($amount)
    {
        //保存充值记录
        $userCharge = new UserCharge();
        $userCharge->user_id = u()->id;
        $userCharge->trade_no = u()->id . date("YmdHis") . rand(1000, 9999);
        $userCharge->amount = $amount;
        $userCharge->charge_state = self::CHARGE_STATE_WAIT;
        $userCharge->charge_type = self::CHARGE_TYPE_BANK;
        if (!$userCharge->save()) {
            return false;
        }
        $package['merchant_no'] = BXCHANGE_ID;
        $package['service'] = 'api.sd.quickPay';
        $package['version'] = '2.0';
        $package['charset'] = 'UTF-8';
        $package['out_trade_no'] = $userCharge->trade_no;
        $package['total_fee'] = $amount * 100;
        $package['body'] = '我的余额';
        // $package['notify_url'] = url(['site/quick-notify'], true);
        $package['notify_url'] = url(['site/bxnotify'], true);
        $package['return_url'] = url(['site/index'], true); //前台页面通知地址ZF_BACK_URL
        $package['client_ip'] = Yii::$app->request->userIP;
        $package['time_expire'] = '30';
        $package['order_time'] = date("YmdHis");
        ksort($package, SORT_STRING);
        $string1 = '';
        foreach($package as $key => $v) {
            $string1 .= "{$key}={$v}&";
        }
        $string1 = trim($string1, '&') . BXCHANGE_MDKEY;
        $package['sign'] = md5($string1);
        $package['sign_type'] = 'MD5';
        $url = 'http://paytest.yunpuvip.com/pay/gateway.shtml';

        $result = httpRequest($url, $package);
        $arr = json_decode($result, true);

        if ($arr['resp_code'] == '000000' || $arr['resp_msg'] == '成功') {
            return $arr['credential']; 
        }
        return false;
    }


    //交易所第三方支付 钱通
    public static function payQtchange($amount, $acquirer_type = 'WeiXinScanOrder')
    {
        
        //保存充值记录
        $userCharge = new UserCharge();
        $userCharge->user_id = u()->id;
        $userCharge->trade_no = u()->id . date("YmdHis") . rand(1000, 9999);
        $userCharge->amount = $amount;
        $userCharge->charge_state = self::CHARGE_STATE_WAIT;
        $merchantId = '1007318';
        if ($acquirer_type == 'ZFBScanOrder') {
            $userCharge->charge_type = self::CHARGE_TYPE_ALIPAY;
            $merchantId = '1007320';
        } else if ($acquirer_type == 'CertPayOrderH5') {
            $userCharge->charge_type = self::CHARGE_TYPE_BANK;
            $merchantId = '1007320';
        }
        if (!$userCharge->save()) {
            return false;
        }
        $gateway_url="http://www.qtongpay.com/pay/pay.htm";

        $package['application'] = $acquirer_type;//微信
        $package['version'] = '1.0';
        $package['timestamp'] = date('ymdhis');
        $package['merchantId'] = $merchantId;
        $package['merchantOrderId'] = $userCharge->trade_no;
        $package['merchantOrderAmt'] = $amount * 100;
        $package['merchantOrderDesc'] = '账户充值';
        $package['merchantPayNotifyUrl'] = url(['site/yzchange-notify'], true);
        $str1 = "<?xml version='1.0' encoding='utf-8' standalone='no'?>";
        $str2 = '';
        ksort($package);
        foreach($package as $key => $v) {
            $str2 .= "{$key}='{$v}' ";
        }
        $str3 = '/>';
        $str = $str1 . "<message " . $str2 . $str3;
        $strMD5 =  MD5($str,true);  
        $strsign =  sign($strMD5);
        $base64_src=base64_encode($str);
        $msg = $base64_src."|".$strsign;
        if($acquirer_type == 'CertPayOrderH5') {
            return $msg;            
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $gateway_url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $msg);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        $tmp = explode("|", $result);
        $resp_xml = base64_decode($tmp[0]);
        $resp_sign = $tmp[1];
        if(verity(MD5($resp_xml,true),$resp_sign)){//验签
            $res2 = fromXml($resp_xml);
        } else {
            return false;
        }       
        //生成二维码
        require Yii::getAlias('@vendor/phpqrcode/phpqrcode.php');
        $value = $res2['@attributes']['codeUrl']; //二维码内容
        $errorCorrectionLevel = 'L';//容错级别   
        $matrixPointSize = 6;//生成图片大小   
        $filePath = Yii::getAlias('@webroot/' . config('uploadPath') . '/exchange/');
        FileHelper::mkdir($filePath);
        $src = $filePath . $acquirer_type . u()->id . '.png';
        //生成二维码图片   
        \QRcode::png($value, $src, $errorCorrectionLevel, $matrixPointSize, 2);
        return config('uploadPath') . '/exchange/' . $acquirer_type . u()->id . '.png';  
    }
    
    //交易所第三方支付 98 新
    public static function payExchange($amount, $acquirer_type = 'wechat')
    {
        // $amount = 0.01;
        //保存充值记录
        $userCharge = new UserCharge();
        $userCharge->user_id = u()->id;
        $userCharge->trade_no = u()->id . date("YmdHis") . rand(1000, 9999);
        $userCharge->amount = $amount;
        $userCharge->charge_state = self::CHARGE_STATE_WAIT;
        if ($acquirer_type == 'alipay') {
            $userCharge->charge_type = self::CHARGE_TYPE_ALIPAY;
        } else if ($acquirer_type == 'qq') {
            $userCharge->charge_type = self::CHARGE_TYPE_QQ;
        } else {
            $userCharge->charge_type = self::CHARGE_TYPE_ZFWECHART;
        }
        if (!$userCharge->save()) {
            return false;
        }

        $package['service'] = 'v1_scan_pay';
        $package['version'] = '1.0';
        $package['mch_no'] = BXCHANGE_ID;
        $package['charset'] = 'UTF-8';
        $package['req_time'] = date('YmdHis');
        $package['nonce_str'] = rand(10000, 99999);
        $package['out_trade_no'] = $userCharge->trade_no;
        $package['order_subject'] = '飞跃云商城';
        $package['acquirer_type'] = $acquirer_type;//微信
        $package['total_fee'] = $amount * 100;
        $package['notify_url'] = url(['site/new-bxnotify'], true);
        $package['client_ip'] = Yii::$app->request->userIP;
        $package['order_time'] = date('YmdHis');
        ksort($package, SORT_STRING);
        $string1 = '';
        foreach($package as $key => $v) {
            $string1 .= "{$key}={$v}&";
        }
        $string1 = trim($string1, '&') . BXCHANGE_MDKEY;
        $package['sign'] = md5($string1);
        $package['sign_type'] = 'MD5';

        $request = httpRequest(EXCHANGE_URL, $package);
        $res = json_decode($request, true);
        // test($res);
        if($res['resp_code'] == 0000 && isset($res['code_url'])) {
            if($acquirer_type == 'jd') {
                header("Location:" .$res['code_url']. ""); die;
            }
            //生成二维码
            require Yii::getAlias('@vendor/phpqrcode/phpqrcode.php');
            $value = $res['code_url']; //二维码内容
            $errorCorrectionLevel = 'L';//容错级别   
            $matrixPointSize = 6;//生成图片大小   
            $filePath = Yii::getAlias('@webroot/' . config('uploadPath') . '/images/');
            FileHelper::mkdir($filePath);
            $src = $filePath . $acquirer_type . u()->id . '.png';
            //生成二维码图片   
            \QRcode::png($value, $src, $errorCorrectionLevel, $matrixPointSize, 2);
            return config('uploadPath') . '/images/' . $acquirer_type . u()->id . '.png';  
        }
        return false;
    }

}
