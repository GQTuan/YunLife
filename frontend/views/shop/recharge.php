<?php $this->regCss('iconfont/iconfont.css') ?>
<?php $this->regCss('mine.css') ?>
<?php $this->regCss('common.css') ?>
<style type="text/css">body{background:#fff;}</style>

<div class="container " style="padding:0;">
    <p class="selecthe">充值面额（元）</p>
    <?php $form = self::beginForm(['showLabel' => false, 'action' => url(['shop/pay']), 'id' => 'payform']) ?>
    <div class="boxflex1 paystyle" style="padding: 10px 15px 0;">
        <div class="group_btn clearfloat">
            <div class="btn_re">
                <a class="btn_money on"><?= get('amount')?></a>
            </div>
        </div>
        <input type="hidden" id="amount" name="amount" value="<?= get('amount');?>">
        <input type="hidden" id="type" name="type" value="2">
        <input type="hidden" name="shop_id" value="<?= get('shop_id')?>">
    </div>
    <div class="boxflex1">
        <div class="moneyhead">充值方式</div>
    </div>
    <div class="boxflex1 paystyle checkImg2" style="border-top:0;">
        <img src="/images/icon-chat.png" style="width: 20px;">
        <span>微信支付</span>
        <img src="/images/seleted.png" alt="" style="float:right;" class="check-paytwo" >
    </div>
    <div class="boxflex1 paystyle checkImg1">
        <img src="/images/alipay.png" style="width: 20px;">
        <span>支付宝支付</span>
        <img src="/images/notseleted.png" alt="" style="float:right;" class="check-payone" >
    </div>
    <div class="boxflex1 paystyle checkImg3">
        <img src="/images/pay.png" style="width: 20px;">
        <span>银联支付</span>
        <img src="/images/notseleted.png" alt="" style="float:right;" class="check-paythree" >
    </div>
    <div class="recharge-btn" id="payBtn">立即充值</div>

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
    $('#type').val(2);

    $('#payBtn').on('click', function(){
        var amount = $('#amount').val();
        if(!amount || isNaN(amount) || amount <= 0){
            alert('金额输入不合法!');
            return false;
        }
        $("#payform").submit();
    });

    $(".checkImg1").click(function(){
        $('#type').val(4);
        $(this).find('.check-payone').attr({
            "src":"/images/seleted.png"
        })
        $(".check-paytwo").attr({
            "src":"/images/notseleted.png"
        }) 
        $(".check-paythree").attr({
            "src":"/images/notseleted.png"
        })      
    })

    $(".checkImg2").click(function(){
        $('#type').val(2);
        $(this).find('.check-paytwo').attr({
            "src":"/images/seleted.png"
        })
        $(".check-payone").attr({
            "src":"/images/notseleted.png"
        })
        $(".check-paythree").attr({
            "src":"/images/notseleted.png"
        })        
    })
    
    $(".checkImg3").click(function(){
        $('#type').val(3);
        $(this).find('.check-paythree').attr({
            "src":"/images/seleted.png"
        })
        $(".check-payone").attr({
            "src":"/images/notseleted.png"
        }) 
        $(".check-paytwo").attr({
            "src":"/images/notseleted.png"
        })     
    })
})
</script>
