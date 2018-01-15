<?php $form = self::beginForm(['showLabel' => false, 'id' => 'addAddressForm', 'action' => url('shop/add-address'),]) ?>
<?php $this->regCss('shop-common') ?>
<?php $this->regCss('shop-index') ?>
<style type="text/css">
    .my-form-group>.form-group {
        width: calc(100%  - 2rem);
    }
</style>
    <div class="my-form-group clear-fl">
        <label>收货人</label>
        <div class="form-group field-bankcard-bank_card required">
            <input type="text" id="bankcard-bank_card" class="form-control" value="<?= u()->nickname; ?>"  />
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>联系电话</label>
        <div class="form-group field-bankcard-bank_card required">
            <?= $form->field($model, 'phone')->textInput(['class'=>'form-control ','placeholder' => '请输入联系电话', 'id' => 'bankcard-bank_card']);?>
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>收货地址</label>
        <div class="form-group field-bankcard-bank_card required">
            <?= $form->field($model, 'addr')->textInput(['class'=>'form-control ','placeholder' => '请输入收货地址', 'id' => 'bankcard-bank_card']);?>
            <div class="help-block"></div>
        </div>
    </div>

    <div class="my-form-group clear-fl">
        <label>设置为默认地址</label>
        <span class="checkboxFour rt">
            <input name="Address[default]" type="checkbox" id="checkboxFourInput2" class="checkboxFourInput" name="">
            <label for="checkboxFourInput2"></label>
        </span>
    </div>
    <button href="" class="add-address-btn">保存</button>
<?php self::endForm() ?>

<script type="text/javascript">
    $(".add-address-btn").click(function () {
        $("form").ajaxSubmit($.config('ajaxSubmit', {
            success: function (msg) {
                if (!msg.state) {
                    $.alert(msg.info, function () {
                        // $("#loginform-captcha").parents('.row').show();
                        // window.location.href = '<?= url('shop/address') ?>';
                        window.history.back();
                        location.reload();
                    });
                }
            }
        }));
        return false;
    });
</script>