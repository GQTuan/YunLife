<?php

namespace admin\models;

use Yii;

class Shop extends \common\models\Shop
{
    public $file;

    public function rules()
    {
        return array_merge(parent::rules(), [
            [['file'], 'file', 'extensions' => 'jpg, png', 'skipOnEmpty' => true, 'maxSize' => 1024 * 2 * 1000],
            [['shop_name', 'stock_ture', 'sell_cost', 'is_show', 'file', 'contents', 'unit'], 'required', 'on' => 'add'],
            
        ]);
    }

    public function scenarios()
    {
        return array_merge(parent::scenarios(), [
            'add' => ['shop_name', 'stock_ture', 'sell_cost', 'is_show', 'file', 'contents' ,'unit'],
            
        ]);
    }

    public function attributeLabels()
    {
        return array_merge(parent::attributeLabels(), [
            'file' => '商品图片',
        ]);
    }

    public function listShopQuery()
    {
        return $this->search()
                ->orderBy('hot ASC');
    }
}
