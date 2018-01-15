    <style type="text/css">
    .recommand-list{
        padding: 0 10px;
    }
    </style>
    <div class="banner">
        <div id="myCarousel" data-ride="carousel" data-interval="" class="carousel slide">

            <!-- <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol> -->
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active flex-nowrap">
                    <img src="/images/homepage_banner.png">
                </div>
                <div class="item flex-nowrap">
                    <img src="/images/homepage_banner.png">
                </div>
                <div class="item flex-nowrap">
                    <img src="/images/homepage_banner.png">
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a id="left" class="carousel-control left" href="#myCarousel"
               data-slide="prev"></a>
            <a id="right" class="carousel-control right" href="#myCarousel"
               data-slide="next"></a>
        </div> 
    </div>
    <div class="mall-nav">
        <ul class="clear-fl">
            <li class="active home ">
                <a href="<?= url(['shop/initback']) ?>">
                    <img src="/images/homepage_icon_jifen.png">
                    <p>积分兑换</p>
                </a>
            </li>
            <li class="active home ">
                <a href="<?= url(['shop/cashback']) ?>">
                    <img src="/images/homepage_icon_qianhuo.png">
                    <p>返利</p>
                </a>
            </li>
            <li class="active home ">
                <a href="<?php echo url('site/index') ?>">
                    <img src="/images/homepage_icon_hui.png">
                    <p>交易</p>
                </a>
            </li>
        </ul>
    </div>
    <section class="main">
        <p class="recommand-title">精品推荐</p>
        <ul class="recommand-list clear-fl">
        <?php foreach ($recommend as  $vo):?>
            
            <li>
                <a href="<?php echo url(['shop/shop-details','id'=>$vo->id])?>">
                    <img src="<?= $vo->images?>">
                    <p class="product-info"><?= $vo->shop_name?></p>
                    <p class="product-price">￥<?= $vo->sell_cost?></p>
                </a>    
            </li>
            
        <?php endforeach ?>
        </ul>
    </section>