<style type="text/css">
body{
    background: #f2f2f2;
}
.cashback-title {
    height: 1.3rem;
    background: #fff url(../images/image_title.png) no-repeat center center;
    background-size: 6.4rem 1.3rem;
    position: relative;
    top: -.5rem;
}
.cashback-list{
    padding: 0 10px;
    background: #f2f2f2;
    position: relative;
    top: -27px;
}
</style>
<div class="banner">
    <div id="myCarousel" data-ride="carousel" data-interval="2500" class="carousel slide">
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
<section class="main">
    <p class="cashback-title"></p>
    <ul class="cashback-list clear-fl">
<!--         <li>
            <a href="">
                <span class="back-icon">返</span>
                <img src="/images/homepage_commodity.png">
                <p class="cashback-info">老茶树西湖龙井</p>
                <p class="cashback-price">￥19</p>
            </a>
        </li> -->

        <?php foreach ($prizes as $prize):?>
        <li class="list" data-id="<?= $prize->id ?>">
            <a>
                <span class="back-icon">返</span>
                <img src="<?= $prize->url?>">
                <p class="cashback-info"><?= $prize->prize_name?></p>
                <p class="cashback-price"><?= $prize->price?></p>
            </a>
        </li>
        <?php endforeach ?>
    </ul>
    <?php if (!empty($prizes)): ?>
    <div class="buy-mask" style="display: none;">
        <div class="buy-content">
            <p class="buy-title">我的账单余额：<span>￥<?= u()->account<0?'异常':u()->account - u()->blocked_account?></span></p>
            <p class="buy-count">选择返利商品数量</p>

            <p class="add-panel clear-fl">
                <span class="minus">-</span>
                <span class="count">1</span>
                <span class="plus">+</span>
            </p>
            <p class="money">扣除账户余额:<span class="qian" data-val="<?= $prizes[0]->price ?>">￥</span></p>
            <p class="bottom-btn-group clear-fl">
                <a class="cancel">取消</a>
                <a class="active">确定</a>
                <input type="hidden" value="<?= $prizes[0]->id ?>" class="prizeId">
            </p>
        </div>
    </div>
    <?php endif ?>
</section>



<script type="text/javascript">
$('.bottom-btn-group .cancel').click(function(){
    $('.buy-mask .add-panel .count').html(1);
    $('.buy-mask').hide();
})
$('.list').click(function(){
    // var price = $(this).find('.cashback-price').html();
    $('.prizeId').val($(this).data('id'));
    var price = $(this).find('.cashback-price').html();
    $('.buy-mask .qian').data('val', price);
    $('.buy-mask .qian').html('￥-'+price);
    $('.buy-mask').show();
})

$('.bottom-btn-group .active').click(function() {
    var data = {};
    data.id = $('.prizeId').val();;
    data.num = $('.buy-mask .add-panel .count').html();
    $.get("<?= url(['shop/ajaxSaveWithdraw']) ?>", {data: data}, function(msg) {
        if (msg.state) {
            if (msg.data == 1) {
                $.alert(msg.info); 
                window.location.href = '<?= url(['shop/allOrder']) ?>';
                // $('.buy-mask').hide();
            } else {
                $.alert('余额不够！');  
            }
        } else {
            if(msg.info.code == -1) {
                $.alert(msg.info.infos, function(){
                    window.location.href="<?= url(['user/userAccount']) ?>";
                });
            }
            $.alert(msg.info);
        }
    }, 'json');
})

$(".add-panel").click(function(e) {
    var target = e.target;
    var account = $(this).find(".count").html();
    if( $(target).hasClass("minus") ){
        //减
        if(account <= 0){ return false; }
        $(this).find(".count").html( --account);
        var price = $(".qian").data("val");
        $(".qian").html(-account * price );
    }else if( $(target).hasClass("plus") ){
        //加
        $(this).find(".count").html( ++account);
        var price = $(".qian").data("val");
        $(".qian").html(-account * price);
    }
});

$(".buy-content").click(function(e){
    e.stopPropagation();
})
$(".buy-mask").click(function(){
    $('.buy-mask .add-panel .count').html(1);
    $(this).hide();
})
</script>