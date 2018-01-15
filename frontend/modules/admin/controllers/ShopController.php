<?php

namespace admin\controllers;

use Yii;
use admin\models\User;
use admin\models\Product;
use admin\models\ProductPrice;
use admin\models\AdminUser;
use admin\models\Shop;
use admin\models\ShopOrder;
use admin\models\Prize;
use common\models\DataAll;
use common\helpers\Hui;
use common\helpers\Html;
use common\helpers\ArrayHelper;

class ShopController extends \admin\components\Controller
{
    /**
     * @authname 商城订单列表
     */
    public function actionOrderList()
    {
        $query = (new ShopOrder)->listShopQuery()->joinWith(['user', 'address', 'shop'])->orderBy('shopOrder.created_at DESC');
        $countQuery = (new ShopOrder)->listShopQuery()->joinWith(['user'])->andWhere(['status' => ShopOrder::STATUS_END]);
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id' => ['search' => true],
            'user.nickname',
            'user.mobile',
            'shop.shop_name',
            'shop.sell_cost' => '单价',
            'shop.images' => function ($row) {
                if (!$row->shop->images) {
                    return '';
                }
                return Hui::primaryBtn('查看', null, ['class' => 'viewFace']) .
                       Html::a('', $row->shop->images, ['class' => 'img-fancybox hidden', 'title' => $row->shop->label('images'), 'rel' => 'images' . $row->shop->id]);
            },
            'num',
            'amount' => '支付总额',
            'status' => ['search' => 'select'],
            'created_at',
            ['header' => '操作', 'width' => '70px', 'value' => function ($row) {
                if ($row->status == ShopOrder::STATUS_WAIT) {
                    return Hui::primaryBtn('是否发货', ['updateOrder', 'id' => $row->id], ['class' => 'layer.iframe']);
                } elseif ($row->status == ShopOrder::STATUS_START) {
                    return Hui::submitInput('确认收货', ['class' => 'btn-danger-outline', 'data-id' => $row->id]);
                } else {
                    return Html::successSpan('已审核');
                }
            }]
        ], [
            'searchColumns' => [
                'user.nickname',
                'user.mobile',
                'time' => ['header' => '审核时间', 'type' => 'dateRange']
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);
        

        return $this->render('orderList', compact('html', 'count'));
    }

    /**
     * @authname 商品订单操作
     */
    public function actionUpdateOrder($id)
    {
        $model = ShopOrder::find()->with(['user', 'address', 'shop'])->where(['id' => $id])->andWhere(['>', 'status', ShopOrder::STATUS_FAIL])->one();

        if (req()->isPost) {
            $model->status = post('state');
            if ($model->update()) {
                if ($model->status == ShopOrder::STATUS_FAIL) {
                    $model->user->account += $model->amount;
                    $model->user->update();    
                }
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('updateOrder', compact('model'));
    }

    /**
     * @authname 商品订单确认收货
     */
    public function actionSuccessOrder($id)
    {
        $model = ShopOrder::find()->with(['user', 'address', 'shop'])->where(['id' => $id, 'status' => ShopOrder::STATUS_START])->one();
        if (empty($model)) {
            return error('找不到此订单！');
        }
        $model->status = ShopOrder::STATUS_END;
        if ($model->update()) {
            return success();
        } else {
            return error($model);
        }
    }

    /**
     * @authname 商城商品列表
     */
    public function actionList()
    {
        $query = (new Shop)->listShopQuery();

        $html = $query->getTable([
            'id' => ['header' => '商品id', 'search' => true],
            'shop_name' => ['type' => 'text', 'search' => true],
            'hot' => ['type' => 'text', 'header' => '排序'],
            'stock_ture' => ['type' => 'text'],
            'sell_cost' => ['type' => 'text'],
            'unit',
            'images' => function ($row) {
                if (!$row->images) {
                    return '';
                }
                return Hui::primaryBtn('查看', null, ['class' => 'viewFace']) .
                       Html::a('', $row->images, ['class' => 'img-fancybox hidden', 'title' => $row->label('images'), 'rel' => 'images' . $row->id]);
            },
            'is_show' => ['type' => 'select', 'search' => 'select'],
            'created_at',
            ['type' => ['edit' => 'editShop']],
        ], [
            'paging' => 20,
            'addBtn' => ['editShop' => '添加商城商品']
        ]);

        return $this->render('list', compact('html'));
    }

    /**
     * @authname 添加商城商品
     */
    public function actionEditShop($id = 0)
    {
        $model = Shop::findModel($id);
        $model->scenario = 'add';
        if ($model->load()) {
            if ($model->validate()) {
                if ($model->file) {
                    $model->file->move();
                    $model->images = $model->file->filePath;
                }
                // test($model->attributes);
                $model->save(false);
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('editShop', compact('model'));
    }

    /**
     * @authname 返利商品列表
     */
    public function actionPrizeList()
    {
        $query = (new Prize)->listPrizeQuery();

        $html = $query->getTable([
            'id' => ['header' => '商品id', 'search' => true],
            'prize_name' => ['type' => 'text', 'search' => true],
            'price',
            'gram' => ['type' => 'text'],
            'hot' => ['type' => 'text'],
            'url' => function ($row) {
                if (!$row->url) {
                    return '';
                }
                return Hui::primaryBtn('查看', null, ['class' => 'viewFace']) .
                       Html::a('', $row->url, ['class' => 'img-fancybox hidden', 'title' => $row->label('url'), 'rel' => 'url' . $row->id]);
            },
            'is_show' => ['type' => 'select', 'search' => 'select'],
            ['type' => ['edit' => 'editPrize']],
        ], [
            'paging' => 20,
            'addBtn' => ['editPrize' => '添加返利商品']
        ]);

        return $this->render('list', compact('html'));
    }

    /**
     * @authname 添加返利商品
     */
    public function actionEditPrize($id = 0)
    {
        $model = Prize::findModel($id);

        if ($model->load()) {
            if ($model->validate()) {
                if ($model->file) {
                    $model->file->move();
                    $model->url = $model->file->filePath;
                }
                $model->save(false);
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('editPrize', compact('model'));
    }

    /**
     * @authname 积分商品列表
     */
    public function actionInteList()
    {
        $query = (new Prize)->listInteQuery();

        $html = $query->getTable([
            'id' => ['header' => '商品id', 'search' => true],
            'prize_name' => ['type' => 'text', 'search' => true, 'header' => '积分商品名称'],
            'integral' => ['type' => 'text'],
            'price',
            'gram' => ['type' => 'text'],
            'hot' => ['type' => 'text'],
            'url' => function ($row) {
                if (!$row->url) {
                    return '';
                }
                return Hui::primaryBtn('查看', null, ['class' => 'viewFace']) .
                       Html::a('', $row->url, ['class' => 'img-fancybox hidden', 'title' => $row->label('url'), 'rel' => 'url' . $row->id]);
            },
            'is_show' => ['type' => 'select', 'search' => 'select'],
            ['type' => ['edit' => 'editPrize']],
        ], [
            'paging' => 20,
            'addBtn' => ['editInte' => '添加积分商品']
        ]);

        return $this->render('list', compact('html'));
    }

    /**
     * @authname 添加积分商品
     */
    public function actionEditInte($id = 0)
    {
        $model = Prize::findModel($id);

        if ($model->load()) {
            if ($model->validate()) {
                $model->type = Prize::TYPE_JF;
                if ($model->file) {
                    $model->file->move();
                    $model->url = $model->file->filePath;
                }
                $model->save(false);
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('editInte', compact('model'));
    }
}
