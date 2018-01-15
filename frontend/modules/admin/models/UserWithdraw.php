<?php

namespace admin\models;

use Yii;

class UserWithdraw extends \common\models\UserWithdraw
{
    public $start_time;
    public $end_time;

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
            'op_state' => '申请状态',
            // 'field2' => 'description2',
        ]);
    }

    public function listQuery()
    {
        return $this->search()
            ->manager()
            ->andWhere(['user.state' => self::STATE_VALID])
            ->andWhere(['userWithdraw.type' => self::TYPE_FL])
            ->andFilterWhere(['>=', 'userWithdraw.updated_at', $this->start_time])
            ->andFilterWhere(['<=', 'userWithdraw.updated_at', $this->end_time]);
    }

    public function listInitQuery()
    {
        return $this->search()
            ->manager()
            ->andWhere(['user.state' => self::STATE_VALID])
            ->andWhere(['userWithdraw.type' => self::TYPE_JF])
            ->andFilterWhere(['>=', 'userWithdraw.updated_at', $this->start_time])
            ->andFilterWhere(['<=', 'userWithdraw.updated_at', $this->end_time]);
    }

     public function newoutUserMoney()
    {
        $package = [];
        $reqTime = date('YmdHis');
        $package['service'] = 'v1_liquidation_pay';
        $package['version'] = '1.0';
        $package['merchant_no'] = BXCHANGE_ID;
        $package['charset'] = 'UTF-8';
        $package['req_time'] = $reqTime;
        $package['nonce_str'] = rand(10000, 99999);
        if (empty($this->out_sn)) {
            return []; 
        }
        $package['out_trade_no'] = $this->out_sn;
        $package['amount'] = $this->amount * 100;
        $package['account_no'] = $this->user->userAccount->bank_card; //银行卡或存折号码
        $package['account_name'] = $this->user->userAccount->bank_user; //银行卡或存在上的所有人姓名
        $package['account_type'] = '00'; //账号类型
        $package['client_ip'] = Yii::$app->request->userIP;;//订单备注
        $package['id_type'] = '0';
        $package['id'] = $this->user->userAccount->id_card;
        $package['bank_code'] = $this->user->userAccount->bank_code; //银行编码
        ksort($package, SORT_STRING);
        $string1 = '';
        foreach($package as $key => $v) {
            $string1 .= "{$key}={$v}&";
        }
        $string1 = trim($string1, '&') . BXCHANGE_MDKEY;
        $package['sign'] = md5($string1);
        $package['sign_type'] = 'MD5';
        $url = 'http://scpay.shopping98.com/v1/gateway.shtml';
        $request = httpRequest($url, $package);
        return json_decode($request, true);                 
    }
}
