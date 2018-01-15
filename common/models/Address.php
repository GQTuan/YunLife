<?php

namespace common\models;

use Yii;

/**
 * 这是表 `address` 的模型
 */
class Address extends \common\components\ARModel
{
    public function rules()
    {
        return [
            [['user_id', 'addr', 'default'], 'required'],
            [['user_id', 'default'], 'integer'],
            [['addr'], 'string', 'max' => 60]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => '用户id',
            'addr' => '地址',
            'default' => '是否默认;1:默认;2;备用',
        ];
    }

    /****************************** 以下为设置关联模型的方法 ******************************/

    // public function getRelation()
    // {
    //     return $this->hasOne(Class::className(), ['foreign_key' => 'primary_key']);
    // }
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /****************************** 以下为公共显示条件的方法 ******************************/

    public function search()
    {
        $this->setSearchParams();

        return self::find()
            ->filterWhere([
                'address.id' => $this->id,
                'address.user_id' => $this->user_id,
                'address.default' => $this->default,
            ])
            ->andFilterWhere(['like', 'address.addr', $this->addr])
            ->andTableSearch()
        ;
    }

    /****************************** 以下为公共操作的方法 ******************************/

    

    /****************************** 以下为字段的映射方法和格式化方法 ******************************/
}
