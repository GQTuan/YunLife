<?php

namespace admin\controllers;

use Yii;
use admin\models\User;
use admin\models\Order;
use admin\models\Product;
use admin\models\AdminUser;
use admin\models\UserCoupon;
use admin\models\UserCharge;
use admin\models\UserRebate;
use admin\models\UserWithdraw;
use admin\models\AdminAccount;
use admin\models\Bank;
use admin\models\UserGive;
use admin\models\RetailWithdraw;
use admin\models\UserExtend;
use admin\models\Retail;
use common\helpers\Hui;
use common\helpers\Html;

class UserController extends \admin\components\Controller
{
    /**
     * @authname 会员列表
     */
    public function actionList()
    {
        $query = (new User)->listQuery()->manager();

        $html = $query->getTable([
            u()->power < AdminUser::POWER_ADMIN?'':['type' => 'checkbox'],
            'id',
            'nickname' => ['type' => 'text'],
            'mobile',
            'pid' => ['header' => '推荐人id'],
            'admin.username' => ['header' => '代理商账号'],
            'admin.pid' => ['header' => '综会账号', 'value' => function ($row) {
                return $row->getLeaderName($row->admin_id);
            }],
            'account',
            'integral' => '积分',
            'profit_account',
            'loss_account',
            'created_at',
            'login_time',
            'state' => ['search' => 'select'],
            ['header' => '操作', 'width' => '120px', 'value' => function ($row) {
                if ($row['state'] == User::STATE_VALID) {
                    $deleteBtn = Hui::dangerBtn('冻结', ['deleteUser', 'id' => $row->id], ['class' => 'deleteBtn']);
                } else {
                    $deleteBtn = Hui::successBtn('恢复', ['deleteUser', 'id' => $row->id], ['class' => 'deleteBtn']);
                }
                return implode(str_repeat('&nbsp;', 2), [
                    Hui::primaryBtn('修改密码', ['editUserPass', 'id' => $row->id], ['class' => 'editBtn']),
                    $deleteBtn
                ]);
            }]
        ], [
            'searchColumns' => [
                'id',
                'nickname',
                'mobile',
                'pid' => ['header' => '推荐人id'],
                'admin.username' => ['header' => '代理商账号'],
                'leader' => ['header' => '综会账号'],
                'start_time' => ['type' => 'datepicker']
            ]
        ]);

        // 会员总数，总手数，总余额,总盈利，总亏损
        $count = User::find()->manager()->count();
        $hand = Order::find()->joinWith(['user'])->manager()->select('SUM(hand) hand')->one()->hand ?: 0;
        $amount = User::find()->manager()->select('SUM(account) account')->one()->account ?: 0;
        // $profit_account = User::find()->manager()->select('SUM(account) account')->one()->profit_account ?: 0;
        // $loss_account = User::find()->manager()->select('SUM(account) account')->one()->loss_account ?: 0;

        return $this->render('list', compact('html', 'count', 'hand', 'amount', 'profit_account', 'loss_account'));
    }

    /**
     * @authname 用户信息导出
     */
    public function actionUserExcel()
    {
        ini_set("memory_limit", "10000M");
        set_time_limit(0);
        require Yii::getAlias('@vendor/PHPExcel/Classes/PHPExcel.php');
        //获取数据
        // $query = (new User)->listQuery()->manager()->andWhere('user.id > 102200');
        $query = (new User)->listQuery()->manager();
        $count = (new User)->listQuery()->manager()->count();
        $data = $query->all();

        $n = 3;
        //加载PHPExcel插件
        $Excel = new \PHPExcel();
        $Excel->setActiveSheetIndex(0);
        //编辑表格    标题
        $Excel->setActiveSheetIndex(0)->mergeCells('A1:G1');
        $Excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setSize(20);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setName('黑体');
        $Excel->getActiveSheet()->setCellValue('A1',config('web_name').'-用户信息统计表');
        //表头
        $Excel->getActiveSheet()->getStyle('E')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00);
        $Excel->setActiveSheetIndex(0)->getStyle('A2:D2')->getFont()->setBold(true);
        $Excel->setActiveSheetIndex(0)->setCellValue('A2','用户的ID');
        $Excel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $Excel->setActiveSheetIndex(0)->setCellValue('B2','昵称');
        $Excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('C2','手机号');
        $Excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('D2','余额');
        $Excel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        //内容
        foreach ($data as $val) {
            $Excel->setActiveSheetIndex(0)->setCellValue('A'.$n, $val->id);
            if (strpos($val->user->nickname, '=') === 0){
                $val->user->nickname = "nanqe" . $val->user->nickname;
            }
            $Excel->setActiveSheetIndex(0)->setCellValue('B'.$n, $val->nickname);
            $Excel->setActiveSheetIndex(0)->setCellValue('C'.$n, $val->mobile);
            $Excel->setActiveSheetIndex(0)->setCellValue('D'.$n, $val->account);
            $n++;
            $Excel->getActiveSheet()->getRowDimension($n+1)->setRowHeight(18);
        }
        //统计
        $Excel->setActiveSheetIndex(0)->mergeCells('A'.$n.':C'.$n);
        $Excel->getActiveSheet()->setCellValue('A'.$n,'统计'.$count.'人');
        $Excel->setActiveSheetIndex(0)->getStyle('A'.$n)->getFont()->setBold(true);
        //格式
        $Excel->getActiveSheet()->getStyle('A2:D'.$n)->getBorders()->getAllBorders()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        //导出表格
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition:attachment;filename="'.config('web_name').'-用户信息统计表.xls');
        header('Cache-Control: max-age=0');
        $objWriter= \PHPExcel_IOFactory::createWriter($Excel,'Excel5');
        $objWriter->save('php://output');
    }

    /**
     * @authname 修改会员密码
     */
    public function actionEditUserPass() 
    {
        $user = User::findModel(get('id'));
        $user->password = post('password');
        if ($user->validate()) {
            $user->hashPassword()->update(false);
            return success();
        } else {
            return error($user);
        }
    }

    /**
     * @authname 冻结/恢复用户
     */
    public function actionDeleteUser() 
    {
        $user = User::find()->where(['id' => get('id')])->one();

        if ($user->toggle('state')) {
            return success('冻结成功！');
        } else {
            return success('账号恢复成功！');
        }
    }

    /**
     * @authname 赠送优惠券
     */
    public function actionSendCoupon()
    {
        $ids = post('ids');

        // 送给所有人
        if (!$ids) {
            $ids = User::find()->map('id', 'id');
        }
        UserCoupon::sendCoupon($ids, post('coupon_id'), post('number') ?: 1);
        return success('赠送成功');
    }

    /**
     * @authname 会员持仓列表
     */
    public function actionPositionList()
    {
        $query = (new User)->listQuery()->andWhere(['user.state' => User::STATE_VALID])->manager();

        $order = [];
        $html = $query->getTable([
            'id',
            'nickname' => ['type' => 'text'],
            'mobile',
            ['header' => '盈亏', 'value' => function ($row) use (&$order) {
                $order = Order::find()->where(['user_id' => $row['id'], 'order_state' => Order::ORDER_POSITION])->select(['SUM(hand) hand', 'SUM(profit) profit'])->one();
                if ($order->profit == null) {
                    return '无持仓';
                } elseif ($order->profit >= 0) {
                    return Html::redSpan($order->profit);
                } else {
                    return Html::greenSpan($order->profit);
                }
            }],
            ['header' => '持仓手数', 'value' => function ($row) use (&$order) {
                if ($order->hand == null) {
                    return '无持仓';
                } else {
                    return $order->hand;
                }
            }],
            'account',
            'state'
        ], [
            'searchColumns' => [
                'nickname',
                'mobile',
                'created_at' => ['type' => 'date']
            ]
        ]);

        return $this->render('positionList', compact('html'));
    }


    /**
     * @authname 赠金记录
     */
    public function actionGiveMoneyList()
    {
        $query = (new UserGive)->giveListQuery()->andWhere(['user.state' => User::STATE_VALID]);
        $amount = (new UserGive)->giveListQuery()->andWhere(['user.state' => User::STATE_VALID])->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id',
            'user.nickname',
            'user.mobile',
            'amount',
            'created_at' => ['header' => '赠送时间'],
            // 'adminUser.username' => ['header' => '操作人账号'],
            'updated_by' => ['header' => '后台操作人id'],
        ], [
            'ajaxReturn' => [
                'countAmount' => $amount,
            ],
            'searchColumns' => [
                'user.id',
                'user.mobile',
                // 'adminUser.username' => ['header' => '操作人账号'],
                'updated_by' => ['header' => '后台操作人id'],
            ]
        ]);

        return $this->render('giveMoneyList', compact('html', 'amount'));
    }

    /**
     * @authname 会员赠金
     */
    public function actionGiveList()
    {
        if (req()->isPost) {
            $user = User::findModel(get('id'));
            if (!is_numeric(post('amount'))) {
                return error('非法参数！');
            }
            $user->account += post('amount');
            if ($user->update()) {
                $userGive = new UserGive();
                $userGive->user_id = $user->id;
                $userGive->amount = post('amount');
                $userGive->save();
                return success();
                return success();
            } else {
                return error($user);
            }
        }

        $query = (new User)->listQuery()->andWhere(['user.state' => User::STATE_VALID]);

        $html = $query->getTable([
            'id',
            'nickname',
            'mobile',
            'account',
            ['header' => '操作', 'width' => '40px', 'value' => function ($row) {
                return Hui::primaryBtn('赠金', ['', 'id' => $row['id']], ['class' => 'giveBtn']);
            }]
        ], [
            'searchColumns' => [
                'nickname',
                'mobile'
            ]
        ]);

        return $this->render('giveList', compact('html'));
    }

    /**
     * @authname 会员出金管理
     */
    public function actionWithdrawList()
    {
        $query = (new UserWithdraw)->listQuery()->joinWith(['user.parent'])->orderBy('userWithdraw.created_at DESC');
        $countQuery = (new UserWithdraw)->listQuery()->joinWith(['user'])->andWhere(['op_state' => UserWithdraw::OP_STATE_PASS]);
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id',
            'user.nickname',
            'user.mobile',
            'user.account',
            'out_sn',
            'amount' => '出金金额',
            'created_at',
            'op_state' => ['search' => 'select'],
            ['header' => '操作', 'width' => '70px', 'value' => function ($row) {
                $state =  Hui::primaryBtn('更改出金状态', ['user/stateWithdraw', 'id' => $row['id']], ['class' => 'layer.iframe']);

                if ($row['op_state'] == UserWithdraw::OP_STATE_WAIT) {
                    return Hui::primaryBtn('会员出金', ['user/verifyWithdraw', 'id' => $row['id']], ['class' => 'layer.iframe']) . $state;
                } else {
                    return Html::successSpan('已审核');
                }
            }]
        ], [
            'searchColumns' => [
                'out_sn',
                'user.nickname',
                'user.mobile',
                'time' => ['header' => '审核时间', 'type' => 'dateRange']
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);
        

        return $this->render('withdrawList', compact('html', 'count'));
    }

    /**
     * @authname 更改出金状态
     */
    public function actionStateWithdraw($id)
    {
        $model = UserWithdraw::find()->where(['id' => $id])->one();

        if (req()->isPost) {
            $model->op_state = post('UserWithdraw')['op_state'];
            if($model->update()) {
                return success();
            }else {
                return error($model);
            }
        }

        return $this->render('stateWithdraw', compact('model'));
    }

    /**
     * @authname 会员积分列表
     */
    public function actionUserIntelist()
    {
        $query = (new UserWithdraw)->listInitQuery()->joinWith(['user', 'prize'])->orderBy('userWithdraw.created_at DESC');
        $countQuery = (new UserWithdraw)->listInitQuery()->joinWith(['user'])->andWhere(['op_state' => UserWithdraw::OP_STATE_PASS]);
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id' => ['search' => true],
            'user.nickname',
            'user.mobile',
            'prize.prize_name' => '兑换商品',
            'amount' => '兑换积分',
            'user.integral' => '当前积分',
            'created_at',
            'op_state' => ['search' => 'select'],
            ['header' => '操作', 'width' => '70px', 'value' => function ($row) {
                if ($row['op_state'] == UserWithdraw::OP_STATE_WAIT) {
                    return Hui::primaryBtn('积分兑换', ['user/userInte', 'id' => $row['id']], ['class' => 'layer.iframe']);
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
        

        return $this->render('userIntelist', compact('html', 'count'));
    }

    /**
     * @authname 变更会员经纪人
     */
    public function actionUpdateManager()
    {
        if (req()->isPost) {
            $user = User::findOne(get('id'));
            if (empty($user)) {
                return error('找不到这个用户！');
            }
            $admin_id = post('admin_id');
            if (!empty($admin_id)) {
                $user->admin_id = $admin_id;
                $admin = AdminUser::find()->where(['id' => $user->admin_id, 'power' => AdminUser::POWER_RING])->one();
                if (empty($admin)) {
                    return error('找不到这个微圈用户ID！');
                }
            } else {
                $user->pid = post('pid');
                if (!is_numeric($user->pid)) {
                    return error('非法参数！');
                }
                $puser = User::find()->where(['id' => $user->pid, 'is_manager' => 1])->one();
                if (empty($puser)) {
                    return error('找不到这个经纪人！');
                }
            }
            if ($user->update()) {
                return success();
            } else {
                return error($user);
            }
        }

        $query = (new User)->listQuery()->andWhere(['user.state' => User::STATE_VALID]);

        $html = $query->getTable([
            'id',
            'nickname',
            'mobile',
            'pid' => ['header' => '经纪人ID'],
            'admin.username' => ['header' => '用户上级'],
            ['header' => '操作', 'width' => '40px', 'value' => function ($row) {
                return Hui::primaryBtn('变更经纪人', ['', 'id' => $row['id']], ['class' => 'giveBtn']);
            }]
        ], [
            'searchColumns' => [
                'nickname',
                'mobile',
                'pid' => ['header' => '经纪人ID'],
                'admin.username' => ['header' => '用户上级'],
            ]
        ]);

        return $this->render('updateManager', compact('html'));
    }

    /**
     * @authname 会员积分兑换操作
     */
    public function actionUserInte($id)
    {
        $model = UserWithdraw::find()->with(['user', 'address', 'prize'])->where(['id' => $id])->one();

        if (req()->isPost) {
            $model->op_state = post('state');
            if ($model->update()) {
                if ($model->op_state == UserWithdraw::OP_STATE_DENY) {
                    $model->user->integral += $model->amount;
                    $model->user->update();    
                }
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('userInte', compact('model'));
    }

    /**
     * @authname 用户出金信息导出
     */
    public function actionWithdrawExcel()
    {
        ini_set("memory_limit", "10000M");
        set_time_limit(0);
        require Yii::getAlias('@vendor/PHPExcel/Classes/PHPExcel.php');
        //获取数据
        $query = (new UserWithdraw)->listQuery()->joinWith(['user.parent'])->orderBy('userWithdraw.created_at DESC');
        $countQuery = (new UserWithdraw)->listQuery()->joinWith(['user'])->andWhere(['op_state' => UserWithdraw::OP_STATE_PASS]);
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;
        $data = $query->all();

        $n = 3;
        //加载PHPExcel插件
        $Excel = new \PHPExcel();
        $Excel->setActiveSheetIndex(0);
        //编辑表格    标题
        $Excel->setActiveSheetIndex(0)->mergeCells('A1:G1');
        $Excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setSize(20);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setName('黑体');
        $Excel->getActiveSheet()->setCellValue('A1',config('web_name').'-出金信息统计表');
        //表头
        $Excel->getActiveSheet()->getStyle('E')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00);
        $Excel->setActiveSheetIndex(0)->getStyle('A2:D2')->getFont()->setBold(true);
        $Excel->setActiveSheetIndex(0)->setCellValue('A2','用户的ID');
        $Excel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $Excel->setActiveSheetIndex(0)->setCellValue('B2','昵称');
        $Excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('C2','手机号');
        $Excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('D2','出金金额');
        $Excel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $Excel->setActiveSheetIndex(0)->setCellValue('E2','申请时间');
        $Excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('F2','审核状态');
        $Excel->getActiveSheet()->getColumnDimension('F')->setWidth(10);
        $opState = UserWithdraw::getOpStateMap();
        //内容
        foreach ($data as $val) {
            $Excel->setActiveSheetIndex(0)->setCellValue('A'.$n, $val->user->id);
            if (strpos($val->user->nickname, '=') === 0){
                $val->user->nickname = "nanqe" . $val->user->nickname;
            }
            $Excel->setActiveSheetIndex(0)->setCellValue('B'.$n, $val->user->nickname);
            $Excel->setActiveSheetIndex(0)->setCellValue('C'.$n, $val->user->mobile);
            $Excel->setActiveSheetIndex(0)->setCellValue('D'.$n, $val->amount);
            $Excel->setActiveSheetIndex(0)->setCellValue('E'.$n, $val->created_at);
            $Excel->setActiveSheetIndex(0)->setCellValue('F'.$n, $opState[$val->op_state]);
            $n++;
            $Excel->getActiveSheet()->getRowDimension($n+1)->setRowHeight(18);
        }
        //统计
        $Excel->setActiveSheetIndex(0)->mergeCells('A'.$n.':D'.$n);
        $Excel->getActiveSheet()->setCellValue('A'.$n,'总出金额度'.$count.'元');
        $Excel->setActiveSheetIndex(0)->getStyle('A'.$n)->getFont()->setBold(true);
        //格式
        $Excel->getActiveSheet()->getStyle('A2:F'.$n)->getBorders()->getAllBorders()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        //导出表格
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition:attachment;filename="'.config('web_name').'-出金信息统计表.xls');
        header('Cache-Control: max-age=0');
        $objWriter= \PHPExcel_IOFactory::createWriter($Excel,'Excel5');
        $objWriter->save('php://output');
    }

    /**
     * @authname 会员出金操作
     */
    public function actionVerifyWithdraw($id)
    {
        $model = UserWithdraw::find()->with('user.userAccount')->where(['id' => $id])->one();

        if (req()->isPost) {
            $model->op_state = post('state');
            if ($model->op_state == UserWithdraw::OP_STATE_PASS) {
                $info = $model->newoutUserMoney();
                if ($info['resp_code'] != '0000') {
                    return error($info['resp_msg']);
                }
            }
            if ($model->update()) {
                if ($model->op_state == UserWithdraw::OP_STATE_DENY) {
                    $model->user->account += $model->amount;
                    $model->user->update();    
                }
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('verifyWithdraw', compact('model'));
    }

    /**
     * @authname 会员充值记录
     */
    public function actionChargeRecordList()
    {
        $query = (new UserCharge)->listQuery()->joinWith(['user.parent', 'user.admin'])->manager()->orderBy('userCharge.id DESC');
        $countQuery = (new UserCharge)->listQuery()->joinWith(['user.admin'])->manager();
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id',
            'user.nickname' => '充值人',
            'user.mobile',
            'amount',
            ['header' => '推荐人', 'value' => function ($row) {
                return $row->user->getParentLink('user.id');
            }],
            'admin.username' => ['header' => '代理商账号'],
            'admin.pid' => ['header' => '综会账号', 'value' => function ($row) {
                return $row->user->getLeaderName($row->user->admin_id);
            }],
            'user.account',
            'charge_type',
            'created_at'
        ], [
            'searchColumns' => [
                'user.id',
                'user.nickname',
                'user.mobile',
                'user.pid' => ['header' => '推荐人id'],
                'admin.username' => ['header' => '代理商账号'],
                'leader' => ['header' => '综会账号'],
                'time' => ['header' => '充值时间', 'type' => 'dateRange'],
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);

        return $this->render('chargeRecordList', compact('html', 'count'));
    }

    /**
     * @authname 今日会员充值记录
     */
    public function actionChargeToday()
    {
        $today = date('Y-m-d 00:00:00');
        $query = (new UserCharge)->listQuery()->joinWith(['user.parent', 'user.admin'])->andWhere(['>', 'userCharge.created_at', $today])->manager()->orderBy('userCharge.id DESC');
        $countQuery = (new UserCharge)->listQuery()->joinWith(['user.admin'])->andWhere(['>', 'userCharge.created_at', $today])->manager();
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'user.id',
            'user.nickname' => '充值人',
            'user.mobile',
            'amount',
            ['header' => '推荐人', 'value' => function ($row) {
                return $row->user->getParentLink('user.id');
            }],
            'admin.username' => ['header' => '代理商账号'],
            'admin.pid' => ['header' => '综会账号', 'value' => function ($row) {
                return $row->user->getLeaderName($row->user->admin_id);
            }],
            'user.account',
            'charge_type',
            'created_at'
        ], [
            'searchColumns' => [
                'user.id',
                'user.nickname',
                'user.mobile',
                'admin.username' => ['header' => '代理商账号'],
                'leader' => ['header' => '综会账号'],
                'time' => ['header' => '充值时间', 'type' => 'dateRange'],
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);

        return $this->render('chargeRecordList', compact('html', 'count'));
    }

    /**
     * @authname 用户充值信息导出
     */
    public function actionChargeExcel()
    {
        ini_set("memory_limit", "10000M");
        set_time_limit(0);
        require Yii::getAlias('@vendor/PHPExcel/Classes/PHPExcel.php');
        //获取数据
        $query = (new UserCharge)->listQuery()->joinWith(['user.parent'])->manager()->orderBy('userCharge.id DESC');
        $countQuery = (new UserCharge)->listQuery()->joinWith(['user'])->manager();
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;
        $data = $query->all();

        $n = 3;
        //加载PHPExcel插件
        $Excel = new \PHPExcel();
        $Excel->setActiveSheetIndex(0);
        //编辑表格    标题
        $Excel->setActiveSheetIndex(0)->mergeCells('A1:G1');
        $Excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setSize(20);
        $Excel->setActiveSheetIndex(0)->getStyle('A1')->getFont()->setName('黑体');
        $Excel->getActiveSheet()->setCellValue('A1',config('web_name').'-出金信息统计表');
        //表头
        $Excel->getActiveSheet()->getStyle('E')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00);
        $Excel->setActiveSheetIndex(0)->getStyle('A2:D2')->getFont()->setBold(true);
        $Excel->setActiveSheetIndex(0)->setCellValue('A2','用户的ID');
        $Excel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $Excel->setActiveSheetIndex(0)->setCellValue('B2','昵称');
        $Excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('C2','手机号');
        $Excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $Excel->setActiveSheetIndex(0)->setCellValue('D2','充值金额');
        $Excel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $Excel->setActiveSheetIndex(0)->setCellValue('E2','充值方式');
        $Excel->getActiveSheet()->getColumnDimension('E')->setWidth(10);
        $Excel->setActiveSheetIndex(0)->setCellValue('F2','充值时间');
        $Excel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $chargeType = UserCharge::getChargeTypeMap();
        //内容
        foreach ($data as $val) {
            $Excel->setActiveSheetIndex(0)->setCellValue('A'.$n, $val->user->id);
            if (strpos($val->user->nickname, '=') === 0){
                $val->user->nickname = "nanqe" . $val->user->nickname;
            }
            $Excel->setActiveSheetIndex(0)->setCellValue('B'.$n, $val->user->nickname);
            $Excel->setActiveSheetIndex(0)->setCellValue('C'.$n, $val->user->mobile);
            $Excel->setActiveSheetIndex(0)->setCellValue('D'.$n, $val->amount);
            $Excel->setActiveSheetIndex(0)->setCellValue('E'.$n, $chargeType[$val->charge_type]);
            $Excel->setActiveSheetIndex(0)->setCellValue('F'.$n, $val->created_at);
            $n++;
            $Excel->getActiveSheet()->getRowDimension($n+1)->setRowHeight(18);
        }
        //统计
        $Excel->setActiveSheetIndex(0)->mergeCells('A'.$n.':D'.$n);
        $Excel->getActiveSheet()->setCellValue('A'.$n,'总共充值了'.$count.'元');
        $Excel->setActiveSheetIndex(0)->getStyle('A'.$n)->getFont()->setBold(true);
        //格式
        $Excel->getActiveSheet()->getStyle('A2:F'.$n)->getBorders()->getAllBorders()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        //导出表格
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition:attachment;filename="'.config('web_name').'-用户充值信息统计表.xls');
        header('Cache-Control: max-age=0');
        $objWriter= \PHPExcel_IOFactory::createWriter($Excel,'Excel5');
        $objWriter->save('php://output');
    }

    /**
     * @authname 后台用户申请出金列表
     */
    public function actionAdminWithdraw()
    {
        $query = Retail::find()->where(['admin_id' => u()->id]);
        $html = $query->getTable([
            'total_fee',
            ['header' => '操作', 'width' => '70px', 'value' => function ($row) {
                return $string = Hui::successBtn('提现', ['user/adminVerifyWithdraw'], ['class' => 'fancybox fancybox.iframe']);
            }]
        ]);
        

        return $this->render('adminWithdraw', compact('html'));
    }

    /**
     * @authname 后台用户出金申请操作
     */
    public function actionAdminVerifyWithdraw()
    {
        $adminAccount = AdminAccount::find()->where(['admin_id' => u()->id])->one();
        if(empty($adminAccount)) {
            $adminAccount = new AdminAccount;
        }
        $retailWithdraw = new RetailWithdraw;
        $adminAccount->scenario = 'with';
        $retailWithdraw->scenario = 'retailWith';
        if (req()->isPost) {
            if(date('w') == 0 || date('w') == 6 || date('G') < 9 || date('G') > 17) {
                // return error('不在规定提现时间内');
            }
            $retail = Retail::find()->where(['admin_id' => u()->id])->one();
            if($adminAccount->load(post()) && $retailWithdraw->load(post())) {
                if($retailWithdraw->amount > $retail->total_fee || $retailWithdraw->amount <= 0) {
                    return error('余额不足以出金');
                }
                $adminAccount->admin_id = u()->id;
                $bank = Bank::find()->where(['number' => $adminAccount->bank_name])->one();
                if (empty($bank)) {
                   return error('找不到这个银行名称！'); 
                }
                $adminAccount->bank_code = $bank->name;
                if($adminAccount->validate()) {
                    if($adminAccount->id) {
                        $adminAccount->update();
                    }else {
                        $adminAccount->insert(false);
                    }
                    if($retailWithdraw->validate()) {
                        $retailWithdraw->admin_id = u()->id;
                        $retailWithdraw->state = RetailWithdraw::STATE_WAIT;
                        $retailWithdraw->out_sn = u()->id . date("YmdHis") . rand(1000, 9999);;
                        if ($retailWithdraw->insert(false)) {
                                $retail->total_fee -= $retailWithdraw->amount;
                                $retail->update();    
                                return success();
                        } else {
                            return error($model);
                        }
                    }else {
                        return error($retailWithdraw);
                    }
                }else {
                    return error($adminAccount);
                }
            }
        }

        return $this->render('adminVerifyWithdraw', compact('adminAccount', 'retailWithdraw'));
    }
    /**
     * @authname 订单状态查询 后
     */
    public function actionSearchMoney()
    {
        if(empty(post('out_sn')) || !is_numeric(post('out_sn'))) {
            return success('订单号非法');
        }
        $userWithdraw = new UserWithdraw;
        $result = $userWithdraw->getMoneyState(post('out_sn'));
        return success($result['resp_msg']);
    }

    /**
     * @authname 超管审核出金管理 后
     */
    public function actionAdminsWithdrawList()
    {
        $query = (new RetailWithdraw)->listQuery()->orderBy('retailWithdraw.state DESC');
        $countQuery = (new RetailWithdraw)->listQuery()->joinWith(['adminUser'])->andWhere(['retailWithdraw.state' => RetailWithdraw::STATE_PASS]);
        $count = $countQuery->select('SUM(amount) amount')->one()->amount ?: 0;

        $html = $query->getTable([
            'out_sn',
            'retail.company_name',
            'amount' => '出金金额',
            'created_at',
            'state' => ['header' => '申请状态', 'search' => 'select'],
            ['header' => '操作', 'width' => '70px', 'value' => function ($row) {
                $state =  Hui::primaryBtn('更改出金状态', ['user/adminStateWithdraw', 'id' => $row['id']], ['class' => 'layer.iframe']);
                if ($row['state'] == RetailWithdraw::STATE_WAIT) {
                    return  Hui::primaryBtn('会员出金', ['user/adminsVerifyWithdraw', 'id' => $row['id']], ['class' => 'layer.iframe']) . $state;
                } else {
                    $string = Html::successSpan('已审核');
                }

                return $string .= Hui::primaryBtn('查看详细详细', ['user/adminsReadWithdraw', 'id' => $row['id']], ['class' => 'layer.iframe']);
            }]
        ], [
            'searchColumns' => [
                'retail.company_name',
                'time' => ['header' => '审核时间', 'type' => 'dateRange'],
                'out_sn'
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);

        return $this->render('adminsWithdrawList', compact('html', 'count'));
    }

    /**
     * @authname 超管审核出金操作
     */
    public function actionAdminsVerifyWithdraw($id)
    {
        $model = RetailWithdraw::find()->with('adminAccount', 'retail')->where(['id' => $id])->one();
        if (req()->isPost) {
            // test(1);
            $model->state = post('state');
            if ($model->state == RetailWithdraw::STATE_PASS) {
                $info = $model->newoutAdminMoney();
                if ($info['resp_code'] != '0000') {
                    return error($info['resp_msg']);
                }
            }
            if ($model->update()) {
                if ($model->state == RetailWithdraw::STATE_DENY) {
                    $model->retail->total_fee += $model->amount;
                    $model->retail->update();    
                }
                return success();
            } else {
                return error($model);
            }
        }

        return $this->render('adminsVerifyWithdraw', compact('model'));
    }

    /**
     * @authname 更改出金状态
     */
    public function actionAdminStateWithdraw($id)
    {
        $model = RetailWithdraw::find()->where(['id' => $id])->one();

        if (req()->isPost) {
            $model->state = post('RetailWithdraw')['state'];
            if($model->update()) {
                return success();
            }else {
                return error($model);
            }
        }

        return $this->render('adminStateWithdraw', compact('model'));
    }

    /**
     * @authname 审核经纪人
     */
    public function actionVerifyManager()
    {
        if (req()->isPost) {
            $model = User::findModel(get('id'));
            $model->apply_state = get('apply_state');
            if ($model->apply_state == User::APPLY_STATE_PASS) {
                $model->is_manager = User::IS_MANAGER_YES;
                $userExtend = UserExtend::findOne($model->id);
            }
            if ($model->update()) {
                return success();
            } else {
                return error($model);
            }
        }

        $query = (new User)->listQuery()->joinWith(['userAccount', 'userExtend'])->manager()->andWhere(['user.apply_state' => User::APPLY_STATE_WAIT, 'user.state' => User::STATE_VALID]);

        $html = $query->getTable([
            'id',
            'userExtend.realname' => ['header' => '申请真实姓名'],
            'userExtend.mobile' => ['header' => '申请手机号'],
            'userExtend.created_at' => ['header' => '申请时间'],
            'nickname',
            'mobile' => ['header' => '注册手机号'],

            'admin.username' => ['header' => '代理商账户'],
            'admin.pid' => ['header' => '综会账号', 'value' => function ($row) {
                return $row->getLeaderName($row->admin_id);
            }],
            'created_at',
            ['type' => [], 'value' => function ($row) {
                return implode(str_repeat('&nbsp;', 2), [
                    Hui::primaryBtn('审核通过', ['', 'id' => $row->id, 'apply_state' => User::APPLY_STATE_PASS], ['class' => 'verifyBtn']),
                    Hui::dangerBtn('不通过', ['', 'id' => $row->id, 'apply_state' => User::APPLY_STATE_DENY], ['class' => 'verifyBtn'])
                ]);
            }]
        ], [
            'searchColumns' => [
                'id',
                'nickname',
                'mobile',
                'admin.username' => ['header' => '代理商账户'],
                'leader' => ['header' => '综会账号'],
            ]
        ]);

        return $this->render('verifyManager', compact('html'));
    }

    /**
     * @authname 返点记录列表
     */
    public function actionRebateList()
    {
        $query = (new UserRebate)->listQuery()->orderBy('userRebate.created_at DESC')->manager();
        $count = $query->sum('amount') ?: 0;

        $html = $query->getTable([
            'id',
            'pid' => ['header' => '获得返点经纪人用户', 'value' => function ($row) {
                if (isset($row->parent)) {
                    return '经纪人：' . $row->parent->nickname . "({$row->parent->mobile})";
                } else {
                    return '管理员：' . $row->admin->username;
                }
            }],
            'user.nickname' => ['header' => '会员昵称（手机号）', 'value' => function ($row) {
                return Html::a($row->user->nickname . "({$row->user->mobile})", ['', 'search[user.id]' => $row->user->id], ['class' => 'parentLink']);
            }],
            'amount',
            'point' => function ($row) {
                return $row->point . '%';
            },
            'created_at' => '返点时间'
        ], [
            'searchColumns' => [
                // 'admin.username' => ['header' => '代理商账户'],
                'parent.mobile' => ['header' => '经纪人手机号'],
                'user.id' => ['header' => '会员ID'],
                'user.mobile' => ['header' => '会员手机'],
                'time' => 'timeRange'
            ],
            'ajaxReturn' => [
                'count' => $count
            ]
        ]);

        return $this->render('rebateList', compact('html', 'count'));
    }
}
