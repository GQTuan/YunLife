<style type="text/css">
    body{
        padding-top: .6rem;
    }
</style>
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
        <a type="submit" class="submit">登录</a>
        <p class="regi-btn">
            <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=<?= WX_APPID ?>&redirect_uri=http%3a%2f%2f<?= $_SERVER['HTTP_HOST'] ?>/shop/register&response_type=code&scope=snsapi_userinfo&state=index#wechat_redirect">注册新账号</a>
        </p>
    <?php self::endForm() ?>
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