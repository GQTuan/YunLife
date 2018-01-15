<?php use common\helpers\Html; ?>

<?= $html ?>

<p class="cl pd-5 mt-20">
    <span>当前总共兑换了<span class="count" style="color:#E31;"><?= $count ?></span>积分</span>
</p>

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
});
</script>