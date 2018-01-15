<?php foreach ($data as $userWithdraw) :?>
    <li>
        <div class="clear-fl order-info">
            <div class="lf pho-container">
                <img src="<?= $userWithdraw->prize->url ?>">
            </div>
            <div class="lf shopping-car-info">
                <p><?= $userWithdraw->prize->prize_name ?></p>
                <p class="clear-fl car-price">
                    <span class="fl">￥<?= floatval($userWithdraw->amount) ?></span>
                </p>
            </div>
        </div>
        <div class="order-panel clear-fl">
            <span class="lf">状态：<?= $userWithdraw->getOpStateValue($userWithdraw->op_state) ?></span>
            <span class="rt">创建时间:<?= $userWithdraw->created_at ?></span>
        </div>
    </li>
<?php endforeach ?>