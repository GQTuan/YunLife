<?php

namespace common\models;

use Yii;

/**
 * 这是表 `shop_order` 的模型
 */
class ShopOrder extends \common\components\ARModel
{
    const CHARGE_STATE_WAIT = 1;
    const CHARGE_STATE_PASS = 2;
    const CHARGE_STATE_FAIL = -1;

    const CHARGE_TYPE_ALIPAY = 1;   //支付宝支付   商品
    const CHARGE_TYPE_WECHAT = 2;   //微信支付   商品
    // const CHARGE_TYPE_HUAN = 3; //环迅支付

    const CHARGE_TYPE_BANKWECHART = 1;
    const CHARGE_TYPE_ZFWECHART = 2;
    const CHARGE_TYPE_BANK = 3;
    // const CHARGE_TYPE_ALIPAY = 4; //支付宝支付
    const CHARGE_TYPE_QQ = 5; //qq钱包支付
    const CHARGE_TYPE_HUAN = 6; //环迅支付
// '状态;1:待付款;2:待发货;3:发货中;4:已收货',
    const STATUS_FAIL = -1;
    const STATUS_PAY = 1;
    const STATUS_WAIT = 2;
    const STATUS_START = 3;
    const STATUS_END = 4;

    public $start_time;
    public $end_time;

    public function rules()
    {
        return [
            [['user_id', 'shop_id', 'addr_id', 'num', 'charge_type', 'charge_state', 'status', 'created_by', 'updated_by'], 'integer'],
            [['amount'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['order'], 'string', 'max' => 250]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order' => '快递单号',
            'user_id' => 'User ID',
            'shop_id' => '商品id',
            'addr_id' => '地址id',
            'num' => '数目',
            'amount' => '支付金额',
            'charge_type' => '充值方式：1支付宝2微信',
            'charge_state' => '充值状态：1代付款，2成功，-1 失败;',
            'status' => '状态',
            'created_at' => '创建时间',
            'created_by' => '创建人id',
            'updated_at' => '更新时间',
            'updated_by' => '更新人id',
        ];
    }

    /****************************** 以下为设置关联模型的方法 ******************************/

    public function getShop()
    {
        return $this->hasOne(Shop::className(), ['id' => 'shop_id']);
    }

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getAddress()
    {
        return $this->hasOne(Address::className(), ['id' => 'addr_id']);
    }

    /****************************** 以下为公共显示条件的方法 ******************************/

    public function search()
    {
        $this->setSearchParams();

        return self::find()
            ->filterWhere([
                'shopOrder.id' => $this->id,
                'shopOrder.user_id' => $this->user_id,
                'shopOrder.shop_id' => $this->shop_id,
                'shopOrder.addr_id' => $this->addr_id,
                'shopOrder.num' => $this->num,
                'shopOrder.amount' => $this->amount,
                'shopOrder.charge_type' => $this->charge_type,
                'shopOrder.charge_state' => $this->charge_state,
                'shopOrder.status' => $this->status,
                'shopOrder.created_by' => $this->created_by,
                'shopOrder.updated_by' => $this->updated_by,
            ])
            ->andFilterWhere(['like', 'shopOrder.order', $this->order])
            ->andFilterWhere(['like', 'shopOrder.created_at', $this->created_at])
            ->andFilterWhere(['like', 'shopOrder.updated_at', $this->updated_at])
            ->andTableSearch()
        ;
    }

    /****************************** 以下为公共操作的方法 ******************************/

    

    /****************************** 以下为字段的映射方法和格式化方法 ******************************/

    // Map method of field `IS_SHOW`
    public static function getStatusMap($prepend = false)
    {
        $map = [
            self::STATUS_FAIL => '失败',
            self::STATUS_PAY => '待付款',
            self::STATUS_WAIT => '待发货',
            self::STATUS_START => '发货中',
            self::STATUS_END => '已收货',
        ];

        return self::resetMap($map, $prepend);
    }

    // Format method of field `on_sale`
    public function getStatusValue($value = null)
    {
        return $this->resetValue($value);
    }
}
