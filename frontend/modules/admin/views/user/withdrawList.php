<?php use common\helpers\Html; ?>
<?php use common\helpers\Hui; ?>
<div class="cl pd-5 bg-1 bk-gray mt-20">
    <span>出金状态查询：</span>
    <div class="select-box inline">
        <?= Hui::input('text', 'number', '', ['placeholder' => '出金订单号', 'style' => 'width:250px']) ?>
    </div>
    <?= Hui::primaryBtn('查询', null, ['class' => 'size-M', 'id' => 'submitBtn']) ?>
</div>
<?= $html ?>

<p class="cl pd-5 mt-20">
    <span>当前总共出金了<span class="count" style="color:#E31;"><?= $count ?></span>元</span>
</p>
<?php if (u()->isSuper()): ?>
<a class="userExcel btn btn-success radius r">导出出金记录</a>
<?php endif ?>
<script>
$(function () {
    $(".userExcel").on('click', function () {
        var str = '';
        $('.search-form ul>li').each(function(){
            var $this = $(this).find('.input-text');
            if ($this.attr('name') != undefined) {
                var value = $this.val();
                if (value.length > 0) {          
                    str += $this.attr('name') + '=' + value + '&';
                }
            }
        });
        var url = "<?= url(['user/withdrawExcel?']) ?>" + str;
        window.location.href = url;
    });
    $("#submitBtn").click(function () {

            $.post('<?= url(["user/searchMoney"]) ?>', {out_sn: $('.size-S').val()}, function (msg) {
                $.alert(msg.info);
            }, 'json');
    });
});
</script>