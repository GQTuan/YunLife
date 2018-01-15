<style type="text/css">
    .my-form-group>.form-group {
        width: calc(100%  - 2rem);
    }
</style>
<?php $form = self::beginForm(['showLabel' => false, 'id' => 'addAddressForm', 'action' => url('shop/edit-address'),]) ?>
    <div class="my-form-group clear-fl">
        <label>收货人</label>
        <div class="form-group field-bankcard-bank_card required">
            <input type="text" id="bankcard-bank_card" class="form-control" value="<?= u()->nickname; ?>" disabled="disabled" />
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>联系电话</label>
        <div class="form-group field-bankcard-bank_card required">
            <?= $form->field($model, 'phone')->textInput(['class'=>'form-control ','placeholder' => '请输入联系电话', 'id' => 'bankcard-bank_card', 'value' => $arr->phone]);?>
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>收货地址</label>
        <div class="form-group field-bankcard-bank_card required">
            <?= $form->field($model, 'addr')->textInput(['class'=>'form-control ','placeholder' => '请输入收货地址', 'id' => 'bankcard-bank_card', 'value' => $arr->addr]);?>
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>设置为默认地址</label>
        <span class="checkboxFour rt">
            <input name="Address[default]" type="checkbox" id="checkboxFourInput2" class="checkboxFourInput">
            <label for="checkboxFourInput2"></label>
        </span>
    </div>
    <input type="hidden" name="id" value="<?= get('id')?>">
    <button style="z-index:10000" href="" class="add-address-btn">保存</button>
<?php self::endForm() ?>

<script type="text/javascript">
    $(".add-address-btn").click(function () {
        $("form").ajaxSubmit($.config('ajaxSubmit', {
            success: function (msg) {
                if (!msg.state) {
                    $.alert(msg.info, function () {
                        $("#loginform-captcha").parents('.row').show();
                        window.location.href = '<?= url('shop/address') ?>';
                    });
                }
            }
        }));
        return false;
    });
</script>