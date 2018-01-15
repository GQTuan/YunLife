<?php $this->regCss('iconfont/iconfont.css') ?>
<?php $this->regCss('mine.css') ?>
<?php $this->regCss('common.css') ?>
<style type="text/css">
    body{background:#fff;}
    .option-container .btn_re{
        width: calc((100% - 60px)/3);
        margin-left: 30px;
        height: 32px;
        line-height: 25px;
        margin-bottom: 20px;
    }
    .option-container .btn_re a{
        color: #fca237;
        font-size: 15px;
        border:1px solid #FDC27C;
    }
    .option-container .btn_re a.on{
        color: #fff;
        font-size: 15px;
        border:0;
        background: #FCA237;
    }
    .option-container .btn_re:nth-child(3n + 1){
        margin-left: 0;
    }
    .boxflex1.paystyle.checkImg3{
        border:0;
        background: #fff;
        /*height: 60px;
        line-height: 60px;*/
    }
    .recharge-btn{
        /*position: absolute;*/
        width: 100%;
        left:5%;
        /*margin-top: 30px;*/
        background: #FCA237;
        margin: 0;
        left: 0;
       /* margin-bottom: 15px;*/
    }
    .custom{
        width: 50%;
    }
    .boxflex1.paystyle{
        padding:10px 15px;
        font-size: 16px;
    }
    .boxflex1.paystyle img{
        /*width: 22px!important;*/
    }
    .my-pay-container{
       /* padding: 15px;*/
        margin-bottom: 30px;
    }
    .my-pay-container>div{
        
        padding: 0!important;
        border:0!important;
        width: 65%;
        margin: 0 auto;
        margin-bottom: 12px;
        
    }
    .group_btn {
        margin-bottom: 8px;
    }
    .my-pay-container:after{
        content: "";
        display: block;
        clear: both;
    }
    .my-pay-container img{
        width: 100%!important;
    }
    .my-pay-container .img2{
        display: none;
    }
    .my-pay-container .active .img2{
        display: block;
    }
    .my-pay-container .active .img1{
        display: none;
    }
    .custom{
        width: 100%;
        height: 50px;
        border-radius: 4px;
        border:1px solid #D2D2D2;
        background: #EDEDED;
        font-size: 16px;
        color: #FDA237;
        padding: 0 23px;
        box-sizing: border-box;
    }
    .custom::-webkit-input-placeholder{
        font-size: 16px;
        color: #FDA237;
    }
    .recharge-btn-cotnainer{
        background: #fff;
        margin-top: 15px;
    }
    .checkImg3 .img2{
        border:1px solid #9F9F9F;
        border-radius: 4px;
    }
    .padding20{
        padding:  0 20px;
    }
    .boxflex1.paystyle {
        border:0;
    }
    html {
        overflow: hidden;
    }
</style>

<div class="container " style="padding:0;">
    <div class="row pad_10 ">
        <div class="col-xs-3">
            
        </div>
        <div class="col-xs-6 back-head" style="color:#333;font-weight:bold;">充值</div>
        <div class="col-xs-3"></div>
    </div>
    <?php $form = self::beginForm(['showLabel' => false, 'action' => url(['user/pay']), 'id' => 'payform']) ?>
    <div class="boxflex1 paystyle" style="padding: 10px 15px 0;">
        <div class="group_btn clearfloat option-container">
            <div class="btn_re">
                <a class="btn_money on">4800</a>
            </div>
            <div class="btn_re btn_center">
                <a class="btn_money">3200</a>
            </div>
            <div class="btn_re btn_center">
                <a class="btn_money">2400</a>
            </div>
            <div class="btn_re">
                <a class="btn_money">1600</a>
            </div>
            <div class="btn_re">
                <a class="btn_money">1100</a>
            </div>
            <div class="btn_re">
                <a class="btn_money">520</a>
            </div>
            <div class="btn_re btn_center">
                <a class="btn_money">380</a>
            </div>
            <div class="btn_re btn_center">
                <a class="btn_money">260</a>
            </div>
            <div class="btn_re">
                <a class="btn_money">200</a>
            </div>
        </div>
        <input type="hidden" id="amount" name="amount" value="4800">
        <input type="hidden" id="type" name="type" value="6">
        <input type="hidden" id="type" name="code" value="<?= $code ?>">
    </div>
    <div class="boxflex1">
        <!-- <span style="font-size:12px;color:#828284;margin-right: 50px;">自定义金额</span> -->
        <input class="custom" style="border:0;font-size: 15px;color:#fca237;outline:0;margin:0 0 20px 0 ;" placeholder="自定义充值金额"/>
    </div> 
    <!-- <div class="boxflex1">
        <div class="moneyhead">充值方式</div>
    </div> -->
    <div class="my-pay-container">
        <div class="boxflex1 paystyle checkImg5   active">
            <img class="img1" src="../images/weipay2.png">
            <img class="img2" src="../images/weipay1.png">
        </div>
        <div class="boxflex1 paystyle checkImg1">
            <img class="img1" src="../images/weipay2.png">
            <img class="img2" src="../images/weipay1.png">
        </div>
        <div class="boxflex1 paystyle checkImg2" style="border-top:0;">
            <img class="img1" src="../images/alipay1.png">
            <img class="img2" src="../images/alipay2.png">
        </div>
    <div class="boxflex1 paystyle checkImg4">
        <img class="img1" src="../images/qqipay_default.png">
        <img class="img2" src="../images/qqipay_selected.png">
        <!-- <img class="img1" src="../images/alipay1.png"> -->
        <!-- <img class="img2" src="../images/alipay2.png"> -->
<!--         <img src="/images/pay.png" style="width: 20px;">
        <span>银联支付</span>
        <img src="/images/notseleted.png" alt="" style="float:right;" class="check-paythree" > -->
    </div>
    </div>
    <div class="padding20">
        <div class="recharge-btn" id="payBtn">立即充值</div>
    </div>
    

    <?php self::endForm() ?>
    <div class="row">
        <!-- <div class="col-xs-12 text-center font_14 remain">跳转至微信安全支付网页，微信转账说明</div> -->
<!--         <div class="col-xs-12 text-center font_12">
            <font>注1：暂时只能使用借记卡充值</font>
            <br>
            <font>注2：为了管控资金风险，单日充值限额20000元</font>
        </div> -->
    </div>
</div>
<script>
$(function() {
    $(".custom").blur(function(event) {
        if( $(this).val() < 100 ){
            alert("最低充值金额为100！");
        }
        var val = $(this).val();
        $('#amount').val(val);
    });
    $('#type').val(6);
    $(".btn_money").click(function() {
        $(".on").removeClass("on");
        $(this).addClass("on");
        $('#amount').val($(this).html());
        $(".custom").val($(this).html());
    });

    $('#payBtn').on('click', function(){
        var amount = $('#amount').val();
        if(!amount || isNaN(amount) || amount < 200){
            alert('金额输入不合法!');
            return false;
        }
        $("#payform").submit();
    });

    $(".checkImg1").click(function(){
        $('#type').val(2);
        $(this).siblings(".active").removeClass("active");
        $(this).addClass('active')
    })

    $(".checkImg2").click(function(){
        $(this).siblings(".active").removeClass("active");
        $(this).addClass('active')
        $('#type').val(4);
    })
    
    $(".checkImg3").click(function(){
        $(this).siblings(".active").removeClass("active");
        $(this).addClass('active')
        $('#type').val(3);
    })

    $(".checkImg4").click(function(){
        $(this).siblings(".active").removeClass("active");
        $(this).addClass('active')
        $('#type').val(5);
    })
    $(".checkImg5").click(function(){
        $(this).siblings(".active").removeClass("active");
        $(this).addClass('active')
        $('#type').val(6);
    })
})
</script>
