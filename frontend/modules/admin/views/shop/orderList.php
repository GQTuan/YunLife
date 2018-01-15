<?php use common\helpers\Hui; ?>
<?php use common\helpers\Html; ?>

<?= $html ?>

<p class="cl pd-5 mt-20">
    <span>已发货总额：<?= Html::redSpan($count, ['class' => 'count']) ?></span>
</p>

<script>
$(function () {
    // 查看照片
    $(".list-container").on('click', '.viewFace', function () {
        $(this).parent().find('.img-fancybox:eq(0)').trigger('click');
    });

    $(".list-container").on('click', '.btn-danger-outline', function () {
        var $this = $(this);
        var id = $(this).data('id');
        $.get('<?= url(['shop/successOrder']) ?>', {id:id}, function (msg) {
            if (msg.state) {
                $.alert(msg.info || '更新状态已成功！', function () {
                    location.reload();
                });
            } else {
                $.alert(msg.info);
            }
        });
        return false;
    });
    // $(".userExcel").on('click', function () {
    //     var str = '';
    //     $('.search-form ul>li').each(function(){
    //         var $this = $(this).find('.input-text');
    //         if ($this.attr('name') != undefined) {
    //             var value = $this.val();
    //             if (value.length > 0) {          
    //                 str += $this.attr('name') + '=' + value + '&';
    //             }
    //         }
    //     });
    //     var url = "<?= url(['order/orderExcel?']) ?>" + str;
    //     window.location.href = url;
    // });
});
</script>