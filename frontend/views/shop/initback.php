<style type="text/css">
    .sort-list{
        margin-top: .12rem;
        padding:0 10px;
    }
</style>
<?php use frontend\models\Prize;?>
    <a href="<?= url(['site/index']) ?>" class="earn-int-btn"></a>
    <div class="sort-panel clear-fl">
        <span>您拥有<span><?= floatval(u()->integral) ?></span>积分</span>
        <p class="rt">
            <span class="price-sort sort price">价值排序</span>
            <span class="integral-sort sort integral">积分排序</span>
        </p>
    </div>
    <ul class="sort-list">
        <?php foreach ($prizes as $prize):?>
        <li class="clear-fl">
            <div class="lf photo-container">
                <img  src="<?= $prize->url?>">
            </div>
            <div class="lf">
                <p class="sort-product-title"><?= $prize->prize_name?></p>
                <p class="clear-fl inter-count">
                    <span class="lf"><span><?= $prize->integral?></span>积分</span>
                    <span class="rt"><?= $prize->gram ?>g &times; 1</span>
                </p>
               <!--  <s>￥<?= $prize->price?></s> -->
                <p class="now-exchange prizeId" data-id="<?= $prize->id ?>">
                    <a>立即兑换</a>
                </p>
            </div>
        </li>
        <?php endforeach ?>
<!--         <li class="clear-fl">
            <div class="lf photo-container">
                <img  src="/images/homepage_commodity.png">
            </div>
            <div class="lf">
                <p class="sort-product-title">2017春茶上市，路真好绿茶/老茶树西湖龙井</p>
                <p class="clear-fl inter-count">
                    <span class="lf"><span>340</span>积分</span>
                    <span class="rt">250g &times; 1</span>
                </p>
                <s>￥495</s>
                <p class="now-exchange">
                    <a href="">立即兑换</a>
                </p>
            </div>
        </li> -->
    </ul>

<script type="text/javascript">
    $(function(){
        var url=window.location.href;     //获取当前页面的url
        var len=url.length;   //获取url的长度值
        var a=url.indexOf("?");   //获取第一次出现？的位置下标
        var b=url.substr(a+1,len);   //截取问号之后的内容
        var c=b.split("&");   //从指定的地方将字符串分割成字符串数组
        var arr=new Array();  //新建一个数组
        arr = c[0].split("=");
        $("." + arr[0]).addClass(arr[1]);
    });
</script>
<script type="text/javascript">
$(".sort").click(function(){
    $(this).siblings().removeClass("up down");
    var obj= {};
    if($(this).hasClass("up")){
        $(this).removeClass("up").addClass("down");
        if( $(this).hasClass("price-sort") ){
            //价格 v
            obj.ruleName = "price";
            obj.sortDirection = "down";
        }else{
            //积分 v
            obj.ruleName = "integral";
            obj.sortDirection = "down";
        }
    }else{
        $(this).removeClass("down").addClass("up");
        if( $(this).hasClass("price-sort") ){
            //价格 ^
            obj.ruleName = "price";
            obj.sortDirection = "up";
        }else{
            //积分 ^
            obj.ruleName = "integral";
            obj.sortDirection = "up";
        }
    }
    var url = "<?= url(['shop/initback?']) ?>" + obj.ruleName + '=' + obj.sortDirection + '&';
    window.location.href = url;
})

$('.prizeId').click(function(){
    var data = {};
    data.id = $(this).data('id');
    data.num = 1;
    data.type = <?= Prize::TYPE_JF ?>;
    $.get("<?= url(['shop/ajaxSaveWithdraw']) ?>", {data: data}, function(msg) {
        if (msg.state) {
            if (msg.data == 1) {
                $.alert(msg.info, function () {
                    window.location.href = '<?= url(['shop/recieveOrder']) ?>';
                });
            } else if (msg.data == 2) {
                $.alert(msg.info, function () {
                    window.location.href = '<?= url(['shop/addAddress']) ?>';
                });
            } else {
                $.alert('积分不够！');  
            }
        } else {
            $.alert(msg.info);
        }
    }, 'json');
})
</script>
