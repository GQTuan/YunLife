<?php $form = self::beginForm() ?>
<?= $model->title('商城商品') ?>
<?= $form->field($model, 'shop_name') ?>
<?= $form->field($model, 'stock_ture') ?>
<?= $form->field($model, 'sell_cost') ?>
<?= $form->field($model, 'unit') ?>
<?= $form->field($model, 'is_show')->dropDownlist() ?>
<?= $form->field($model, 'file')->upload() ?>
<?= $form->field($model, 'contents')->editor() ?>
<?= $form->submit($model) ?>
<?php self::endForm() ?>
<script>
$(function () {
    $("#submitBtn").click(function () {
        $("form").ajaxSubmit($.config('ajaxSubmit', {
            success: function (msg) {
                if (msg.state) {
                    $.alert(msg.info || '操作成功', function () {
                        window.parent.location.reload();
                    });
                } else {
                    $.alert(msg.info);
                }
            }
        }));
        return false;
    });
})
</script>