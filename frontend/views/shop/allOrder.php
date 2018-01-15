<style type="text/css">
    .order-nav li{
        width: calc(100% / 3);
    }
    .order-panel span.rt{
        color: #999999;
    }
    .order-panel span.lf{
        color: #FF606B;
        font-size: .26rem;
    }
    .contact-container{
        margin-top: .9rem;
        text-align: center;
        font-size: .22rem;
        color: #868686;
    }
    .contact-container a{
        display: inline-block;
        width: 2rem;
        height: .4rem;
        line-height: .4rem;
        border:1px solid #CFCFCF;
        font-size: .2rem;
        color: #666666;
        border-radius: 4px;
        margin-top: .2rem;
    }
</style>
<ul class="recieve-order-list">
<!--     <li>
        <div class="clear-fl order-info">
            <div class="lf pho-container">
                <img src="/images/homepage_commodity.png">
            </div>
            <div class="lf shopping-car-info">
                <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
                <p class="clear-fl car-price">
                    <span class="fl">￥340</span>
                </p>
            </div>
        </div>
        <div class="order-panel clear-fl">
            <span class="lf">等待平台发货</span>
            <span class="rt">创建时间:2017-6-24</span>
        </div>
    </li>  -->
<?= $this->render('_allOrder', compact('data')) ?>
</ul>
<?php if ($pageCount < 2): ?>
    <div class="deta_more" id="deta_more_div">没有更多了</div>
<?php else: ?>
    <div class="addMany" style="text-align: center;margin-top: 60px;">
        <a style="" type="button" value="加载更多" id="loadMore" data-count="<?= $pageCount ?>" data-page="1">加载更多</a>
    </div>
<?php endif ?>

<div class="contact-container">
    <p>对订单有任何疑问请添加客服QQ</p>
    <a><?= config('web_qq', '40099998888') ?></a>
</div>

<script type="text/javascript">
$(".addMany").on('click', '#loadMore', function() {
    var $this = $(this),
        page = parseInt($this.data('page')) + 1;

    $.get('', {p:page}, function(msg) {
        $(".recieve-order-list").append(msg);
        $this.data('page', page);
        if (page >= parseInt($this.data('count'))) {
            $('.addMany').hide();
        }
    });
});
</script>