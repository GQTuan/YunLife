<?php foreach ($data as $shopOrder) :?>
    <li>
        <div class="clear-fl order-info">
            <div class="lf pho-container">
                <img src="<?= $shopOrder->shop->images ?>">
            </div>
            <div class="lf shopping-car-info">
                <p><?= $shopOrder->shop->shop_name ?></p>
                <p class="clear-fl car-price">
                    <span class="fl">总计：￥<?= floatval($shopOrder->amount) ?></span>
                    <span class="rt"><?= $shopOrder->shop->unit ?>&times;<?= $shopOrder->num ?></span>
                </p>
            </div>
        </div>
        <div class="order-panel clear-fl">
            <span class="lf">状态：<?= $shopOrder->getStatusValue($shopOrder->status) ?></span>
            <span class="rt">创建时间:<?= $shopOrder->created_at ?></span>
        </div>
    </li>
            <!-- <span class="lf">快递单号：54654521545</span> -->
<?php endforeach ?>