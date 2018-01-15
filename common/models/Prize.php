<?php

namespace common\models;

use Yii;

/**
 * 这是表 `prize` 的模型
 */
class Prize extends \common\components\ARModel
{
    const IS_SHOW_YES = 1; //上架下架
    const IS_SHOW_NO = 2;

    const TYPE_FL = 1; //返利商品
    const TYPE_JF = 2; //积分商品

    public function rules()
    {
        return [
            [['price', 'hot', 'type', 'is_show'], 'integer'],
            [['integral'], 'number'],
            [['prize_name'], 'string', 'max' => 255],
            [['url', 'gram'], 'string', 'max' => 100]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'prize_name' => '奖品名称',
            'price' => '单价',
            'integral' => '积分',
            'url' => '图片地址',
            'gram' => '质量（克）',
            'hot' => '排序',
            'type' => '类型',
            'is_show' => '是否展现',
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
                'prize.id' => $this->id,
                'prize.price' => $this->price,
                'prize.integral' => $this->integral,
                'prize.hot' => $this->hot,
                'prize.type' => $this->type,
                'prize.is_show' => $this->is_show,
            ])
            ->andFilterWhere(['like', 'prize.prize_name', $this->prize_name])
            ->andFilterWhere(['like', 'prize.url', $this->url])
            ->andFilterWhere(['like', 'prize.gram', $this->gram])
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
