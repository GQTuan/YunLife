<?php

namespace common\models;

use Yii;

/**
 * 这是表 `shop` 的模型
 */
class Shop extends \common\components\ARModel
{
    const IS_SHOW_YES = 1; //上架下架
    const IS_SHOW_NO = 2;

    public function rules()
    {
        return [
            [['stock_cost', 'sell_cost'], 'number'],
            [['stock_ture', 'stock_show', 'hot', 'created_by', 'updated_by', 'is_show'], 'integer'],
            [['contents'], 'default', 'value' => ''],
            [['created_at', 'created_by', 'updated_at', 'updated_by'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['shop_name'], 'string', 'max' => 30],
            [['images'], 'string', 'max' => 60],
            [['unit'], 'string', 'max' => 15]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shop_name' => '商品名称',
            'stock_cost' => '进货价格',
            'sell_cost' => '卖出价格',
            'stock_ture' => '真实库存',
            'stock_show' => '显示库存',
            'contents' => '内容',
            'images' => '图片',
            'unit' => '单位',
            'hot' => '是否热门;1:热门;2:冷门',
            'created_at' => '创建时间',
            'created_by' => '创建人id',
            'updated_at' => '更新时间',
            'updated_by' => '更新人id',
            'is_show' => '是否上架;1:上架;2:下架',
        ];
    }

    /****************************** 以下为设置关联模型的方法 ******************************/

    // public function getRelation()
    // {
    //     return $this->hasOne(Class::className(), ['foreign_key' => 'primary_key']);
    // }

    /****************************** 以下为公共显示条件的方法 ******************************/

    public function search()
    {
        $this->setSearchParams();

        return self::find()
            ->filterWhere([
                'shop.id' => $this->id,
                'shop.stock_cost' => $this->stock_cost,
                'shop.sell_cost' => $this->sell_cost,
                'shop.stock_ture' => $this->stock_ture,
                'shop.stock_show' => $this->stock_show,
                'shop.hot' => $this->hot,
                'shop.created_by' => $this->created_by,
                'shop.updated_by' => $this->updated_by,
                'shop.is_show' => $this->is_show,
            ])
            ->andFilterWhere(['like', 'shop.shop_name', $this->shop_name])
            ->andFilterWhere(['like', 'shop.contents', $this->contents])
            ->andFilterWhere(['like', 'shop.images', $this->images])
            ->andFilterWhere(['like', 'shop.unit', $this->unit])
            ->andFilterWhere(['like', 'shop.created_at', $this->created_at])
            ->andFilterWhere(['like', 'shop.updated_at', $this->updated_at])
            ->andTableSearch()
        ;
    }

    /****************************** 以下为公共操作的方法 ******************************/

    

    /****************************** 以下为字段的映射方法和格式化方法 ******************************/

    // Map method of field `IS_SHOW`
    public static function getIsShowMap($prepend = false)
    {
        $map = [
            self::IS_SHOW_YES => '上架',
            self::IS_SHOW_NO => '下架',
        ];

        return self::resetMap($map, $prepend);
    }

    // Format method of field `on_sale`
    public function getIsShowValue($value = null)
    {
        return $this->resetValue($value);
    }
}
