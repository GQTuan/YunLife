<?php $form = self::beginForm() ?>
<?= $model->title('返利商品') ?>
<?= $form->field($model, 'prize_name') ?>
<?= $form->field($model, 'price') ?>
<?= $form->field($model, 'gram') ?>
<?= $form->field($model, 'is_show')->dropDownlist() ?>
<?= $form->field($model, 'file')->upload() ?>
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