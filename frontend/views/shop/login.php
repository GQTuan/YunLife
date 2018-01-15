<style type="text/css">
    body{
        padding-top: .6rem;
        background: #F3F4F5;
    }
    .logo_img {
        width: 106px;
        height: 92px;
        margin: 55px auto;
    }
    .logo_img img{
        width: 100%;
        height: 100%;
        border-radius:50%;
    }
    .phone-input input {
        background: url(/images/user-icon.png) no-repeat .4rem center;
        background-size: .48rem .48rem;
        color: #a0a0a0;
        font-size: 14px;
    }
    .pwd-input input {
        background: url(/images/pwd-icon.png) no-repeat .4rem center;
        background-size: .48rem .48rem;
        color: #a0a0a0;
        font-size: 14px;
    }
    .form-group.field-user-username,.form-group.field-user-password{
        border: 1px solid #ccc;
        border-radius: .44rem;
        height: .88rem;
        line-height: .88rem;
        background: transparent;
    }
    #loginForm {
        width: 6.54rem;
    }
    .form-group input {
        height: .88rem;
    }
    .submit {
        background: url(/images/login-btn.png) no-repeat center center!important;
        background-size: 100% 100%!important;
        border: 0!important;
        outline: 0!important;
        height: .9rem;
    }
    .regi-btn a{
        color: #F15A5C;
        background: #F3F4F6;
        border: 1px solid #F15A5C;
        text-align: center;
        height: .9rem;
        line-height: .9rem;
        width: 100%;
        border-radius: .45rem;
        text-decoration: none;
    }
    .forget_btn{
        text-align: right;
        color: #f04447;
        font-size: 14px;
    }
    .load_app {
        padding: 0 7%;
        margin-top: 20px;
    }
    .load_app a {
        border: 2px solid #F15A5C;
        border-radius: 8px;
        padding: 8px 16px;
        font-size: 14px;
        color: #F15A5C;
    }
    .lf {
        float: left;
    }
    .rt {
        float: right;
    }
</style>
    <div class="logo_img">
        <img src="/images/205135642884.jpg">
    </div>
<?php $form = self::beginForm(['showLabel' => false]) ?>
        <div class="phone-input">
<!--             <div class="form-group field-bankcard-bank_card required"> -->
                <!-- <input type="text" id="bankcard-bank_card" class="form-control" name="BankCard[bank_card]" placeholder="请输入手机号"> -->
                <?= $form->field($model, 'username')->textInput(['placeholder' => '请输入手机号']) ?>
<!--                 <div class="help-block"></div>
            </div> -->
        </div>
        <div class="pwd-input">
            <!-- <div class="form-group field-bankcard-bank_card required"> -->
                <!-- <input type="password" id="bankcard-bank_card" class="form-control" name="BankCard[bank_card]" placeholder="请输入密码"> -->
                <?= $form->field($model, 'password')->passwordInput(['placeholder' => '请输入密码']) ?>
                <!-- <div class="help-block"></div>
            </div> -->
        </div>
        <div class="forget_btn">
            <a href="<?= url('site/forget') ?>">忘记密码</a>
        </div>
        <a type="submit" class="submit"></a>
        <p class="regi-btn">
            <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=<?= WX_APPID ?>&redirect_uri=http%3a%2f%2f<?= $_SERVER['HTTP_HOST'] ?>/shop/register&response_type=code&scope=snsapi_userinfo&state=index#wechat_redirect">注册新账号</a>
        </p>
    <?php self::endForm() ?>

    <div class="clear_fl load_app">
        <a href="/site/wxload?type=ios" class="lf">苹果app下载</a>
        <a href="/site/wxload?type=android" class="rt">安卓app下载</a>
    </div>
    <script>
        $(function () {
            $(".submit").click(function () {
                $("form").ajaxSubmit($.config('ajaxSubmit', {
                    success: function (msg) {
                        if (!msg.state) {
                            return $.alert(msg.info);
                        } else {
                            window.location.href = msg.info;
                        }
                    }
                }));
                return false;
            });
        });
    </script>