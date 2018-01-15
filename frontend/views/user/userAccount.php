<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="HandheldFriendly" content="true">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="js/rem.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/animate.css">
    <link rel="stylesheet" type="text/css" href="/css/shop-common.css">
    <link rel="stylesheet" type="text/css" href="/css/shop-index.css">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <title>添加收货地址</title>
    <style type="text/css">
        .my-form-group {
            margin-bottom: 2px;
        }
        *{
            font-family: "microsoft yaHei";
        }
    </style>
</head>
<body>
<script type="text/javascript">
    (function (doc, win) {
    var docEl = doc.documentElement, //html
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize', //事件名称
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
             if (clientWidth >= 750) {
                 docEl.style.fontSize = '100px';
             }
             else {
                 docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
             }
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    recalc();
})(document, window);
</script>
    <?php $form = self::beginForm(['showLabel' => false, 'id' => 'addAddressForm']) ?>
        <div class="my-form-group clear-fl">
            <label>开户银行</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[bank_name]" value="<?= $UserAccount->bank_name?>" placeholder="仅支持中，农，工，建">
                <div class="help-block"></div>
            </div>
        </div>

        <div class="my-form-group clear-fl">
            <label>银行卡号</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[bank_card]" value="<?= $UserAccount->bank_card?>" placeholder="请输入银行卡号">
                <div class="help-block"></div>
            </div>
        </div>

        <div class="my-form-group clear-fl">
            <label>开户行地址</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[bank_address]" value="<?= $UserAccount->bank_address?>" placeholder="请输入开户行地址">
                <div class="help-block"></div>
            </div>
        </div>

        <div class="my-form-group clear-fl">
            <label>持卡人姓名</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[bank_user]" value="<?= $UserAccount->bank_user?>" placeholder="请输入持卡人姓名">
                <div class="help-block"></div>
            </div>
        </div>

        <div class="my-form-group clear-fl">
            <label>身份证</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[id_card]" value="<?= $UserAccount->id_card?>" placeholder="请输入持卡人身份证">
                <div class="help-block"></div>
            </div>
        </div>

        <div class="my-form-group clear-fl">
            <label>预留手机号</label>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="bank_mobile" name="userAccount[bank_mobile]" value="<?= $UserAccount->bank_mobile?>" placeholder="请输入预留手机号">
                <div class="help-block"></div>
            </div>
        </div>
<!--         <div class="my-form-group clear-fl has-btn">
            <label>验证码</label>
            <a id="verifyCodeBtn" data-action="<?= url('site/verifyCode') ?>" class="get-btn rt">获取</a>
            <div class="form-group field-bankcard-bank_card required">
                <input type="text" id="bankcard-bank_card" class="form-control" name="userAccount[verifyCode]" placeholder="">
                <div class="help-block"></div>
            </div>

        </div>
        <div class="clear-fl down-count-container">
            <span class="down-count rt get-btn">60 s</span>
        </div> -->
        <button href="" class="sub-btn">提交</button>
    <?php self::endForm() ?>
    
</body>
</html>

<script type="text/javascript">
    $(".sub-btn").click(function () {
//        $(".addmask").css("display","block");
        $("form").ajaxSubmit($.config('ajaxSubmit', {
            success: function (msg) {
                // $(".addmask").css("display","none");
                if (!msg.state) {
                    $.alert(msg.info);
                } else {
                    $.alert(msg.info, function(){
                    window.location.href = '<?= url('user/index') ?>'
                    });
                }
            }
        }));
        return false;
    });
    // // 验证码
    // $("#verifyCodeBtn").click(function () {
    //     var mobile = $('.bank_mobile').val();
    //     var url = $(this).data('action');
    //     if (mobile.length != 11) {
    //         $.alert('您输入的不是一个手机号！');
    //         return false;
    //     }
    //     $.post(url, {mobile: mobile}, function(msg) {
    //           $.alert(msg.info);
    //     }, 'json');
    // })
</script>