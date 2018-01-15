<?php

namespace admin\models;

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

    public function listShopQuery()
    {
        $query = $this->search()
            ->andFilterWhere(['>=', 'shopOrder.created_at', $this->start_time])
            ->andFilterWhere(['<=', 'shopOrder.created_at', $this->end_time])
            ->andFilterWhere(['>', 'status', self::STATUS_PAY]);
        return $query;
    }
}
