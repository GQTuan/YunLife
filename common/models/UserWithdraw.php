<?php

namespace common\models;

use Yii;

/**
 * 这是表 `user_withdraw` 的模型
 */
class UserWithdraw extends \common\components\ARModel
{
    const OP_STATE_WAIT = 1;
    const OP_STATE_PASS = 2;
    const OP_STATE_DENY = -1;

    const TYPE_FL = 1;
    const TYPE_JF = 2;

    public function rules()
    {
        return [
            [['user_id', 'amount', 'account_id'], 'required'],
            [['user_id', 'account_id', 'type', 'op_state'], 'integer'],
            [['amount'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['out_sn'], 'string', 'max' => 25]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => '用户ID',
            'amount' => '出金金额',
            'account_id' => '出金账号ID',
            'out_sn' => '订单号',
            'type' => '类型',
            'op_state' => '操作状态：1待审核，2已操作，-1不通过',
            'created_at' => '申请时间',
            'updated_at' => '审核时间',
        ];
    }

    /****************************** 以下为设置关联模型的方法 ******************************/

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getPrize()
    {
        return $this->hasOne(Prize::className(), ['id' => 'account_id']);
    }


    public function getAddress()
    {
        return $this->hasOne(Address::className(), ['user_id' => 'user_id']);
    }

    /****************************** 以下为公共显示条件的方法 ******************************/

    public function search()
    {
        $this->setSearchParams();

        return self::find()
            ->filterWhere([
                'userWithdraw.id' => $this->id,
                'userWithdraw.user_id' => $this->user_id,
                'userWithdraw.amount' => $this->amount,
                'userWithdraw.account_id' => $this->account_id,
                'userWithdraw.type' => $this->type,
                'userWithdraw.op_state' => $this->op_state,
            ])
            ->andFilterWhere(['like', 'userWithdraw.out_sn', $this->out_sn])
            ->andFilterWhere(['like', 'userWithdraw.created_at', $this->created_at])
            ->andFilterWhere(['like', 'userWithdraw.updated_at', $this->updated_at])
            ->andTableSearch()
        ;
    }

    /****************************** 以下为公共操作的方法 ******************************/
    public function getIntegralState($value = null)
    {
        $map = [
            self::OP_STATE_WAIT => '等待发货',
            self::OP_STATE_PASS => '已发货',
            self::OP_STATE_DENY => '不通过',
        ];

        return $map[$value];
    }

    public function getMoneyState($out_sn)
    {
        $package = [];
        $reqTime = date('YmdHis');
        $package['service'] = 'v2_liquidation_query';
        $package['version'] = '2.0';
        $package['charset'] = 'UTF-8';
        $package['req_time'] = $reqTime;
        if (empty($out_sn)) {
            return []; 
        }
        $package['nonce_str'] = $out_sn;
        $package['merchant_no'] = BXCHANGE_ID;
        $package['out_trade_no'] = $package['nonce_str'];
        ksort($package, SORT_STRING);
        $string1 = '';
        foreach($package as $key => $v) {
            $string1 .= "{$key}={$v}&";
        }
        $string1 = trim($string1, '&') . BXCHANGE_MDKEY;
        $package['sign'] = md5($string1);
        $package['sign_type'] = 'MD5';
        $url = 'http://liquidation.shopping98.com/v2/liquidation/gateway.shtml?'.http_build_query($package);
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);//curl连接的url
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);//有返回值
        curl_setopt($curl, CURLOPT_HEADER, 0);
        $result = curl_exec($curl);//执行curl
        curl_close($curl);//关闭
        return json_decode($result, true);                 
    }

    /****************************** 以下为字段的映射方法和格式化方法 ******************************/

    // Map method of field `op_state`
    public static function getOpStateMap($prepend = false)
    {
        $map = [
            self::OP_STATE_WAIT => '待审核',
            self::OP_STATE_PASS => '已通过',
            self::OP_STATE_DENY => '不通过',
        ];

        return self::resetMap($map, $prepend);
    }

    // Format method of field `op_state`
    public function getOpStateValue($value = null)
    {
        return $this->resetValue($value);
    }

    // Map method of field `IS_SHOW`
    public static function getTypeMap($prepend = false)
    {
        $map = [
            self::TYPE_FL => '返利',
            self::TYPE_JF => '积分',
        ];

        return self::resetMap($map, $prepend);
    }

    // Format method of field `on_sale`
    public function getTypeValue($value = null)
    {
        return $this->resetValue($value);
    }
}
