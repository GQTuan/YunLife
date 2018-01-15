<?php

namespace frontend\components;

use Yii;
use frontend\models\User;

/**
 * frontend 控制器的基类
 */
class Controller extends \common\components\WebController
{
    public function init()
    {
        parent::init();
    }

    public function beforeAction($action)
    {
        // if (!strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') && YII_DEBUG) {
        //     $user = User::findModel('100001');
        //     $user->login(false);
        // }
        // $allowActions = ['notify', 'index', 'ajax-update-status', 'wxtoken', 'wxcode', 'card', 'test', 'hx-weixin', 'zynotify', 'tynotify'];
        // if (user()->isGuest && !in_array($action->id, $allowActions)) {
        //     // $code = get('code');
        //     // if (empty($code)) {
        //     //     return $this->redirect(['site/register']);
        //     // } else {
        //     //     $url = User::registerUser($code);
        //     //     return $this->redirect($url);
        //     // }
        // }
        if (!parent::beforeAction($action)) {
            return false;
        } else {
            return true;
        }
    }
}
