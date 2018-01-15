    <div class="center-banner">
        <p class="account">账户:<?php echo u()->mobile ?></p>
        <?php if(u()->face == null){ ?>
            <img src="/images/user_image_head.png?>"\>
        <?php }else{ ?>
            <img src="<?= u()->face?>">
        <?php };?>
    </div>
    <ul class="center-nav clear-fl">
        <li>
            <a href="<?= url(['shop/allOrder']) ?>">返利订单</a>
        </li>
        <li>
            <a href="<?= url(['shop/pendingOrder']) ?>">商品订单</a>
        </li>
        <li>
            <a href="<?= url(['shop/recieveOrder']) ?>">兑换订单</a>
        </li>
    </ul>
    <ul class="center-link-list">
        <li class="address-conf">
            <a href="<?php echo url('shop/address'); ?>">
                收货地址
            </a>
        </li>
        <li class="personal-conf">
            <a href="<?= url(['site/logout']);?>">
                退出
            </a>
        </li>
    </ul>