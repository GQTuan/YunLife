<?php

namespace frontend\controllers;

use Yii;
use frontend\models\User;
use frontend\models\Product;
use frontend\models\Order;
use frontend\models\ProductPrice;
use frontend\models\Coupon;
use frontend\models\UserCoupon;
use frontend\models\UserMedal;
use frontend\models\DataAll;

class WxController extends \frontend\components\Controller
{

    /**
     * @authname 微信菜单添加
     */
    public function actionIndex()
    {
        $menu = '
                {
                    "button": [
                        {
                            "type": "view",
                            "name": "在线商城",
                            "url": "http://' . $_SERVER['HTTP_HOST'] . '/shop/login"
                        },
                        {
                            "name": "经纪人",
                            "sub_button": [
                                {
                                    "type": "view",
                                    "name": "经纪人",
                                    "url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx038986b8be2d6d51&redirect_uri=http%3a%2f%2f' . $_SERVER['HTTP_HOST'] . '/manager/register&response_type=code&scope=snsapi_userinfo&state=index#wechat_redirect"
                                }
                            ]
                        },
                        {   
                            "type":"click",
                            "name":"在线客服",
                            "key":"XX_Nanqe_001" 
                        }
                    ]
                }
                ';
        require Yii::getAlias('@vendor/wx/WxTemplate.php');
        $wxTemplate = new \WxTemplate();
        $access_token = $wxTemplate->getAccessToken();
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token=' . $access_token;
        if(get('add') == 'rh') {
            $result = httpRequest($url, $menu);
            test($result);
        }
    }

    /**
     * @authname 微信菜单删除
     */
    public function actionDelete()
    {
        $menu = '';
        require Yii::getAlias('@vendor/wx/WxTemplate.php');
        $wxTemplate = new \WxTemplate();
        $access_token = $wxTemplate->getAccessToken();
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=' . $access_token;
        if(get('delete') == 'rh') {
            $result = httpRequest($url, $menu);
            test($result);
        }
    }
}
