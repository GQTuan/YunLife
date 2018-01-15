<?php

namespace frontend\controllers;

use Yii;
use frontend\models\User;
use frontend\models\Shop;
use frontend\models\Prize;
use frontend\models\Address;
use frontend\models\UserCharge;
use frontend\models\ShopOrder;
use frontend\models\UserAccount;
use frontend\models\Retail;
use frontend\models\AdminUser;
use frontend\models\UserWithdraw;

class ShopController extends \frontend\components\Controller
{
    public function beforeAction($action)
    {
        $this->layout = 'shop';
        $actions = ['login', 'register', 'ajax-pay'];
        if (user()->isGuest && !in_array($this->action->id, $actions)) {
            $this->redirect(['shop/login']);
            return false;
            // $wx = session('wechat_userinfo');
            // if (!empty($wx)) {
            //     $user = User::find()->where(['open_id' => $wx['openid']])->one();
            //     $user->login(false);
            // } else {
            //     $code = get('code');
            //     if (empty($code)) {
            //         $this->redirect(['/wechart.php']);
            //         return false;
            //     } else {
            //         User::registerUser($code);
            //     }
            // }
        }
        if (!parent::beforeAction($action)) {
            return false;
        } else {
            return true;
        }
    }
    //商城首页
    public function actionIndex()
    {
        $this->view->title = '商城首页';
        $recommend = Shop::find()->where(['is_show'=>'1'])->orderBy('hot ASC')->all();
        return $this->render('index', compact('recommend'));
    }
    //商品详情
    public function actionShopDetails()
    {
        $this->view->title = '商品详情';
        $shop = shop::find()->where(['is_show'=>'1', 'id'=>get('id')])->one();
        $addressArr = Address::find()->where(['user_id' => u()->id])->orderBy('default ASC')->map('id', 'addr');
        $count = ShopOrder::find()->where(['shop_id' => $shop->id])->count();
        // $addressArr = [];
        return $this->render('shopDetails', compact('shop', 'addressArr', 'count'));
    }
    //商品支付
    public function actionAjaxPay()
    {
        $data = get('data');
        $user = User::findModel(u()->id);
        if($user->state == User::STATE_INVALID){
            return error('您的账户已冻结，请联系管理员！');
        }
        if ($user->account < 0 || $user->blocked_account < 0) {
            return error('您的账户异常暂时不能返利，请联系管理员！');
        }
        $shop = Shop::findOne($data['id']);
        if (!isset($data['addressId'])) {
            return error('地址不能为空！');
        }
        $address = Address::findOne($data['addressId']);
        if (empty($address)) {
            return error('非法参数!');
        }
        $data['num'] = ceil($data['num']);
        if ($data['num'] < 1 || empty($shop)) {
            return error('非法参数！');
        }
        $shopOrder = new ShopOrder();
        // $shopOrder->order   = u()->id . date("YmdHis") . rand(1000, 9999);
        $shopOrder->num  = $data['num'];
        $shopOrder->amount  = $shopOrder->num * $shop->sell_cost;
        if ($shopOrder->amount < 0 || $shopOrder->amount > ($user->account - $user->blocked_account)) {
            return success('您的账户余额不足，请充值！', -1);
        }
        $shopOrder->addr_id = $address->id;
        $shopOrder->shop_id = $shop->id;
        $shopOrder->user_id = $user->id;
        $shopOrder->status = ShopOrder::STATUS_WAIT;
        if ($shopOrder->insert(false)){
            $user->account -= $shopOrder->amount;
            $user->save(false);
            return success('购买成功', 1);
        }else{
            return error($shopOrder);
        }
    }
    // //商品支付
    // public function actionRecharge()
    // {
    //     $this->view->title = 'Ö§¸¶';
    //     $this->layout = 'shop';
    //     return $this->render('recharge');
    // }
    // //商品支付
    // public function actionPay()
    // {
    //     $this->layout = 'empty';
    //     $this->view->title = '商品支付';
    //     $amount = YII_DEBUG ? 0.01 : post('amount', '0.01');
    //     // $amount = 0.01;
    //     switch (post('type', 2)) {
    //         case UserCharge::CHARGE_TYPE_BANK:
    //             $html = ShopOrder::payShop($amount, 'SPDB', 'Gopaywap');//Î¢ÐÅ¹«ÖÚºÅÖ§¸¶
    //             if (!$html) {
    //                 return $this->redirect(['site/wrong']);
    //             }
    //             return $this->render('gzh', compact('html'));
    //             break;

    //         case UserCharge::CHARGE_TYPE_ZFWECHART:
    //             $html = ShopOrder::payShop($amount);//Î¢ÐÅÉ¨ÂëÖ§¸¶
    //             if (!$html) {
    //                 return $this->redirect(['site/wrong']);
    //             }
    //             return $this->render('wechat', compact('html', 'amount'));
    //             break;

    //         case UserCharge::CHARGE_TYPE_ALIPAY:
    //             $html = ShopOrder::payShop($amount, 'alipay', 'WftZfb');//½»Ò×ËùÖ§¸¶±¦Ö§¸¶
    //             if (!$html) {
    //                 return $this->redirect(['site/wrong']);
    //             }
    //             return $this->render('alipay', compact('html', 'amount'));
    //             break;

    //         default:
    //             return $this->render('zfpay', compact('info'));
    //             break;
    //     }
    // }
    // //购物车
    // public function actionShopcar()
    // {
    //     $this->view->title = '购物车';
    //     return $this->render('shopcar');
    // }
  
    //钱货返利
    public function actionCashback()
    {
        $this->view->title = '钱货返利';
        $prizes = Prize::find()->where(['is_show' => Prize::IS_SHOW_YES, 'type' => Prize::TYPE_FL])->orderBy('hot ASC')->all();

        return $this->render('cashback', compact('prizes'));
    }

    //积分兑换商品
    public function actionInitback()
    {
        $this->view->title = '积分';
        $price = get('price');
        $integral = get('integral');
        $orderBy = 'price ASC';
        if (!empty($price)) {
            $orderBy = $price == 'up'?'price ASC':'price DESC';
        }
        if (!empty($integral)) {
            $orderBy = $integral == 'up'?'integral ASC':'integral DESC';
        }
        $prizes = (new Prize)->search()->andWhere(['is_show' => Prize::IS_SHOW_YES, 'type' => Prize::TYPE_JF])->orderBy($orderBy)->all();

        return $this->render('initback', compact('prizes'));
    }
    
    //保存返利记录
    public function actionAjaxSaveWithdraw()
    {
        $data = get('data');
        $user = User::findModel(u()->id);
        if ($user->state == User::STATE_INVALID) {
            return error('您的账户暂时不能返利，请联系管理员！');
        }
        if ($user->account < 0 || $user->blocked_account < 0) {
            return error('您的账户暂时不能返利，请联系管理员！');
        }
        if(date('w') == 0 || date('w') == 6 || date('G') < 9 || date('G') > 16) {
            return error('不在规定提现时间内');
        }
        if (!empty($data['type'])) {
            $prize = Prize::find()->where(['id' => $data['id'], 'type' => $data['type']])->one();
            $data['num'] = 1;
        } else {
            $data['type'] = Prize::TYPE_FL;
            $prize = Prize::find()->where(['id' => $data['id'], 'type' => $data['type']])->one();
        }
        if (empty($prize)) {
            return error('非法数据提交！');
        }
        if ($data['num'] < 1 && !is_int($data['num'])) {
            return error('返利数量非法！');
        }
        $userWithdraw = new UserWithdraw();
        $userWithdraw->user_id = $user->id;
        $userWithdraw->out_sn = u()->id . date("YmdHis") . rand(1000, 9999);
        $userWithdraw->account_id = $prize->id;
        $userWithdraw->type = $prize->type;

        if ($data['type'] == Prize::TYPE_FL) {
            $userWithdraw->amount = $data['num'] * $prize->price;
            $fee = 2;
            if ($userWithdraw->amount < 0 || $userWithdraw->amount + $fee > ($user->account - $user->blocked_account)) {
                return success('您的可用余额不够!', -1);
            }
            $userAccount = UserAccount::find()->where(['user_id' => u()->id])->one();
            if (empty($userAccount)) {
                return error(['code' => -1, 'infos' => '未绑定银行卡信息！']);
            }
            if ($userWithdraw->insert()) {
                //扣除取现金额
                $user->account -= $userWithdraw->amount + $fee;
                $user->save(false);
                return success('返利申请成功！', 1);
            } else {
                return error($userWithdraw);
            }
        } else {
            $userWithdraw->amount = $data['num'] * $prize->integral;
            if ($userWithdraw->amount < 0 || $userWithdraw->amount > $user->integral) {
                return success('您的可用积分不够!', -1);
            }
            $address = Address::find()->where(['user_id' => u()->id])->orderBy('default ASC')->one();
            if (empty($address)) {
                return success('未填写邮寄地址！', 2);
            }
            if ($userWithdraw->insert()) {
                //扣除取现金额
                $user->integral -= $userWithdraw->amount;
                $user->save(false);
                return success('积分兑换申请成功！', 1);
            } else {
                return error($userWithdraw);
            }
        }
    }
    
    //个人中心
    public function actionPersonal()
    {
        $this->view->title = '个人中心';
        return $this->render('personal');
    }
    //返利订单
    public function actionAllOrder()
    {
        $this->view->title = '返利订单';

        $query = UserWithdraw::find()->with('prize')->where(['user_id' => u()->id, 'type' => Prize::TYPE_FL])->orderBy('created_at DESC');
        // 每页显示几条
        $data = $query->paginate();
        // 一共多少页
        $pageCount = $query->totalCount / PAGE_SIZE;
        if (!is_int($pageCount)) {
            $pageCount = (int)$pageCount + 1;
        }
        if (get('p') > 1) {
            return $this->renderPartial('_allOrder', compact('data'));
        }
        return $this->render('allOrder', compact('pageCount', 'data'));
    }
    //添加银行卡
    public function actionAddBank()
    {
        $this->view->title = '添加银行卡';
        return $this->render('addBank');
    }
    //商品订单
    public function actionPendingOrder()
    {
        $this->view->title = '商品订单';

        $query = ShopOrder::find()->with('shop')->where(['user_id' => u()->id])->andWhere(['>', 'status', ShopOrder::STATUS_PAY])->orderBy('created_at DESC');
        // 每页显示几条
        $data = $query->paginate();
        // 一共多少页
        $pageCount = $query->totalCount / PAGE_SIZE;
        if (!is_int($pageCount)) {
            $pageCount = (int)$pageCount + 1;
        }
        if (get('p') > 1) {
            return $this->renderPartial('_pendingOrder', compact('data'));
        }
        return $this->render('pendingOrder', compact('pageCount', 'data'));
    }
    //兑换订单
    public function actionRecieveOrder()
    {
        $this->view->title = '兑换订单';

        $query = UserWithdraw::find()->with('prize')->where(['user_id' => u()->id, 'type' => Prize::TYPE_JF])->orderBy('created_at DESC');
        // 每页显示几条
        $data = $query->paginate();
        // 一共多少页
        $pageCount = $query->totalCount / PAGE_SIZE;
        if (!is_int($pageCount)) {
            $pageCount = (int)$pageCount + 1;
        }
        if (get('p') > 1) {
            return $this->renderPartial('_recieveOrder', compact('data'));
        }
        return $this->render('recieveOrder', compact('pageCount', 'data'));
    }
    //设置
    public function actionConf()
    {
        $this->view->title = '设置';
        return $this->render('conf');
    }
    //购物车
     public function actionShopcar()
    {
        $this->view->title = '购物车';
        return $this->render('shopcar');
    }
    //收获地址
    public function actionAddress()
    {
        $this->view->title = '收货地址';
        $address = Address::find()->joinWith(['user'])->where(['user_id'=>u()->id])->orderBy('id DESC')->all();
        // test($address->user->id);
        // test($address->name);
        return $this->render('address', compact('address'));
    }
    //添加收货地址
    public function actionAddAddress()
    {
        if(post())
        {
            $data             = post('Address');
            $address          = new Address();
            $address->user_id = u()->id;
            $address->phone   = $data['phone'];
            $address->addr    = $data['addr'];
            $address->default = $data['default'] = "on" ? 1 : 0;
            $back             = $address->save();
            if($back == 1){
                return error('添加成功');
            }else{
                return error('添加失败');
            }
        }else{
            $this->layout = 'shop';
            $this->view->title = '添加收货地址';
            $model = new Address(['scenario' => 'addaddress']);
            return $this->render('add-address', compact('model')); 
        }
    }
    //编辑收货地址
    public function actionEditAddress()
    {
        if(post()){
            $data  = post('Address');
            $address          = Address::findOne(post('id'));
            $address->user_id = u()->id;
            $address->phone   = $data['phone'];
            $address->addr    = $data['addr'];
            $address->default = $data['default'] = "on" ? 1 : 0;
            if($address->save()){
                return $this->error('修改成功');
            }else{
                return $this->error('修改失败');
            }

        }else {
            $this->layout = 'shop';
            $this->view->title = '编辑收货地址';
            $model = new Address(['scenario' => 'editaddress']);
            $arr   = Address::find()->where(['id'=>get('id')])->one();
            return $this->render('edit-address', compact('model', 'arr'));
        }
    }
    //删除收货地址
    public function actionDelAddress()
    {
        if (get('id')) {
            $back = Address::findOne(get('id'))->delete();
            if($back == 1){
                return $this->redirect('address');
            }else{
                return error('删除失败');
            }
        }
    }
    //登陆
    public function actionLogin()
    {
        $this->view->title = '登陆';
        $this->layout = 'empty';
        if (!user()->isGuest) {
            return $this->redirect(['shop/index']);
        }
        $model = new User(['scenario' => 'login']);
        if ($model->load(post())) {
            $user = User::find()->where(['mobile' => $model->username])->one();
            if (!empty($user)) {
                if ($user->state == User::STATE_INVALID) {
                    return error('您的账号已经冻结！');
                }
            }
            if ($model->login()) {
                return success(url(['shop/index']));
                // return $this->goBack();
            } else {
                return error($model);
            }
        }
        return $this->render('login', compact('model'));
    }
    //注册
    public function actionRegister()
    {
        if (!user()->isGuest) {
            return $this->redirect(['site/index']);
        }
        $this->view->title = '注册';
        $this->layout = 'empty';
        $model = new User(['scenario' => 'register']);

        if ($model->load(post())) {
            $model->username = $model->mobile;
            $wx = session('wechat_userinfo');
            if (!empty($wx)) {
                $model->face = $wx['headimgurl'];
                $model->open_id = $wx['openid'];
                $model->nickname = $wx['nickname'];
            }
            if ($model->validate()) {
                $retail = Retail::find()->joinWith(['adminUser'])->where(['retail.code' => $model->code])->one();
                if (!empty($retail)) {                                                                              
                    $model->admin_id = $retail->adminUser->id;
                } else {
                    return error('请填写正确的邀请码！');
                }
                $user_phone = User::find()->joinWith(['admin'])->where(['user.username' => $model->username])->one();
                if(!empty($user_phone)) {
                    return error('已经注册了');
                }
                if (!empty($model->open_id)) {
                    $user = User::find()->where(['open_id' => $model->open_id])->one();
                    if (!empty($user)) {
                        $user->mobile = $model->mobile;
                        $user->username = $model->mobile;
                        $user->nickname = $model->nickname;
                        $user->password = $model->password;
                        $user->admin_id = $model->admin_id;
                        $user->face = $model->face;
                        $user->hashPassword()->update(false);
                        $user->login(false);
                        return success(url(['site/index']));
                    }
                }
                $model->hashPassword()->insert(false);
                $model->login(false);
                return success(url(['site/index']));
                // return $this->goBack();
            } else {
                return error($model);
            }
        }
        //session微信数据
        User::getWeChatUser(get('code'));
        $wx = session('wechat_userinfo');
        $user = User::find()->where(['open_id' => $wx['openid'], 'username' => 0])->one();
        $model->code = '';
        if (!empty($user)) {
            $retail = Retail::find()->joinWith(['adminUser'])->where(['adminUser.id' => $user->admin_id])->one();
            $model->code = isset($retail)?$retail->code:'';
        }

        return $this->render('register', compact('model', 'user'));
    }

}