<style type="text/css">
    .get-code{
        background: #fff;
        margin-bottom: 15px;
    }
    .get-code .form-group {
        margin-bottom: 0;
    }

    .get-code .get-btn {
        margin-right: 10px;
    }
    #user-code{
        background: url(../images/login_icon_yqm.png) no-repeat .4rem center;
        background-size: .48rem .48rem;
    }
    body{
        padding-top: 15px;
    }
    .back-login-btn{
        border:1px solid #FF5A66;
        color: #FF5A66;
        background: transparent;
    }
    .get-code .get-btn {
        float: right;
        width: 1.6rem;
        height: .6rem;
        border: 1px solid #FF5965;
        line-height: .6rem;
        text-align: center;
        font-size: .24rem;
        color: #FF5A66;
        border-radius: 3px;
        margin-top: .2rem;
    }
</style>
<?php $form = self::beginForm(['showLabel' => false,'id'=>'loginForm']); ?>
        <div class="phone-input">
            <div class="form-group field-bankcard-bank_card required">
                <?= $form->field($model, 'mobile')->textInput(['class'=>'form-control ','placeholder' => '请输入手机号', 'id' => 'user-mobile']);?>
                <div class="help-block"></div>
            </div>
        </div>
        <div class="get-code clear-fl">
            <div class="form-group field-bankcard-bank_card required">
<!--                 <input type="password" id="bankcard-bank_card" class="form-control" name="BankCard[verifyCode]" placeholder="请输入验证码"> -->
                <!-- <input type="text" placeholder="输入短信验证码" class="shortCode"> -->
                <?= $form->field($model, 'verifyCode')->textInput(['class'=>'shortCode','placeholder' => '请输入验证码']);?>
                <div class="help-block"></div>
            </div>
                <a  class="get-btn" data-action="<?= url(['site/verifyCode'])?>">获取</a>

        </div>
        <div class="pwd-input">
            <div class="form-group field-bankcard-bank_card required">
               <!--  <input type="password" id="bankcard-bank_card" class="form-control" name="BankCard[bank_card]" placeholder="请设置密码"> -->
                <?= $form->field($model, 'password')->passwordInput(['class'=>'form-control','placeholder' => '请设置密码']); ?>
                <div class="help-block"></div>
            </div>
        </div>
        <div class="pwd-input">
            <div class="form-group field-bankcard-bank_card required">
               <!--  <input type="password" id="bankcard-bank_card" class="form-control" name="BankCard[bank_card]" placeholder="请设置密码"> -->
                <?= $form->field($model, 'cfmPassword')->passwordInput(['class'=>'form-control','placeholder' => '请确认密码']); ?>
                <div class="help-block"></div>
            </div>
        </div>
        <div class="pwd-input">
            <div class="form-group field-bankcard-bank_card required">
               <!--  <input type="password" id="bankcard-bank_card" class="form-control" name="BankCard[bank_card]" placeholder="请设置密码"> -->
                <?= $form->field($model, 'code')->textInput(['class'=>'form-control','placeholder' => '请输入邀请码']); ?>
                <div class="help-block"></div>
            </div>
        </div>

        <a type="submit" id="submitBtn" class="submit">注册</a>
        <a type="submit" href="<?= url(['shop/login'])?>" class="submit back-login-btn">返回登录</a>
<?php   self::endForm(); ?>

<script>

$(function () {
    //倒计时
    var wait = 60;
    var time_data = 1;
    function time(obj) {
        if (wait == 0) {
            obj.removeClass('disabled');
            obj.html('重新发送');
            time_data = 1;
            wait = 60;
        } else {
            obj.addClass('disabled');
            obj.html(wait);
            wait--;
            setTimeout(function() {
                time(obj);
            },
            1000)
        }
    }
    $("#submitBtn").click(function () {
        if (!$("#user-mobile").val().match(/^(((1[0|3|4|5|7|8][0-9]{1}))+\d{8})$/)) {
            $.alert('手机号不正确', 3000);
            return false;
        }
        $("form").ajaxSubmit($.config('ajaxSubmit', {
            success: function (msg) {
                if (!msg.state && msg.info != 1) {
                    $.alert(msg.info);
                    tes(1);
                } else {
                    window.location.href = msg.info;
                }
            }
        }));
        return false;
    });
    // 验证码
    $(".get-btn").on("click",function () {
        if(time_data == 1){
            var mobile = $('#user-mobile').val();
            var url = $(this).data('action');
            if ($(this).hasClass('disabled')) {
                return false;
            }
            $.post(url, {mobile: mobile}, function(msg) {
                if (msg.state) {
                    $.alert(msg.info);
                } else {
                    $.alert(msg.info);
                }
            }, 'json');
            time_data = 0;
            time($(this))
        }
    });

});
</script>