<?php

namespace admin\models;

use Yii;

class Prize extends \common\models\Prize
{
    public $file;

    public function rules()
    {
        return array_merge(parent::rules(), [
            [['file'], 'file', 'extensions' => 'jpg, png', 'skipOnEmpty' => true, 'maxSize' => 1024 * 2 * 1000],
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
            'file' => '商品图片',
        ]);
    }

    public function listPrizeQuery()
    {
        return $this->search()
                ->andWhere(['prize.type' => self::TYPE_FL])
                ->orderBy('prize.hot ASC');
    }
    
    public function listInteQuery()
    {
        return $this->search()
                ->andWhere(['prize.type' => self::TYPE_JF])
                ->orderBy('prize.hot ASC');
    }
}
