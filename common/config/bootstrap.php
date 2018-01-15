<?php
/**
 * 公共常量定义
 */
const AGENTNO = '132610159694751';
const BUY_ORDER_TIME = 10;

const MERNO = '132610159694751';//商户号
const TERMNO = '94350001';// 终端号
const KEY = '58681a14f3dffdd455c49c316166b3b8';

const PAGE_SIZE = 10;
const THEME_NAME = 'basic';
const SECRET_KEY = 'ChisWill';

const WEB_DOMAIN = 'http://www.77el.cn';

const WX_APPID = 'wx038986b8be2d6d51';
const WX_MCHID = '1337714901';
const WX_KEY = 'VKcJg2LUnnRPjmYtPX3Tfm8vqradppF9';
const WX_APPSECRET = '56d87f6c0effa1c9969dad4f4b2bb7f5';
const WX_TOKEN = 'jgZBoGWXMKzwixhJ';

// 海马付APPID 
const HM_APPID = '2017092698923518';
const HM_APPSECRET = 'wrh7SOTRdfiVXCIL35KDWc6U21kz4PHe';

const HX_PAY_DOMAIN = 'http://pay.mantingfen.cn';


const ATTR_CREATED_AT = 'created_at';
const ATTR_CREATED_BY = 'created_by';
const ATTR_UPDATED_AT = 'updated_at';
const ATTR_UPDATED_BY = 'updated_by';

//98 快捷支付 new
const BXCHANGE_ID = '680606480062279680';
const BXCHANGE_MDKEY = '359c9ae3e139459ba83483f335d9fe2e';
const EXCHANGE_URL = 'http://payment.shopping98.com/scan/pay/gateway';


/**
 * 路径别名定义
 */
Yii::setAlias('common', dirname(__DIR__));
Yii::setAlias('frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('api', dirname(dirname(__DIR__)) . '/api');
/**
 * 引入自定义函数
 */
$files = common\helpers\FileHelper::findFiles(Yii::getAlias('@common/functions'), ['only' => ['suffix' => '*.php']]);
array_walk($files, function ($file) {
    require $file;
});
/**
 * 公共变量定义
 */
common\traits\ChisWill::$date = date('Y-m-d');
common\traits\ChisWill::$time = date('Y-m-d H:i:s');
/**
 * 绑定验证前事件，为每个使用`file`验证规则的字段自动绑定上传组件
 */
common\components\Event::on('common\components\ARModel', common\components\ARModel::EVENT_BEFORE_VALIDATE, function ($event) {
    foreach ($event->sender->rules() as $rule) {
        if ($rule[1] === 'file') {
            $fieldArr = (array) $rule[0];
            foreach ($fieldArr as $field) {
                $event->sender->setUploadedFile($field);
            }
        }
    }
});
/**
 * 日志组件的全局默认配置
 */
Yii::$container->set('yii\log\FileTarget', [
    'logVars' => [],
    'maxLogFiles' => 5,
    'maxFileSize' => 1024 * 5,
    'prefix' => ['common\models\Log', 'formatPrefix']
]);
Yii::$container->set('yii\log\DbTarget', [
    'logVars' => [],
    'prefix' => ['common\models\Log', 'formatPrefix']
]);
