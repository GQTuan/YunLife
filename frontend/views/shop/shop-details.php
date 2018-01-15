   <style type="text/css">
    .form-control {
      display: inline-block;
      width: 75%;
      vertical-align: middle;
  }
   </style>
   <div class="detail-banner">
       <p class="product-title">
           商品 <span>详情</span>
           <span class="bag-cion"></span>
       </p>
       <img src="<?= $shop->images;?>">
   </div>
   <div class="detail-content">
       <p class="detail-pro-name"><?= $shop->shop_name?></p>
       <p class="detail-price">￥<?= $shop->stock_show2;?> <s>￥<?= $shop->stock_show;?></s></p>
       <p class="detail-info clear-fl">
           <span class="lf">包邮</span>
           <span class="rt">已售0笔</span>
       </p>
       <p class="bibi clear-fl">
           <span class="lf">24小时内发货</span>
           <span class="lf">正品保障</span>
           <span class="lf">七天退货</span>
       </p>
    </div>
    <div class="link-container">
        <p>
            <a href="" class="modify-pwd clear-fl">已选 <span class="rt"><?= $shop->unit;?>g</span></a>
        </p>
        <p>
          <a href="<?= url(['shop/add-address'])?>" class="modify-pwd clear-fl">配送至 <span class="rt" id="addr"><?= isset($address->addr) ? $address->addr :'未设置收货地址';?></span></a>
        </p>
    </div>
    <p class="product-detail-top">产品详情</p>
    <div class="cust-detail">
       <img src="/images/detail-photo.png">
    </div>
    <div class="detail-nav clear-fl">
        <a href="" class="thin lf">客服</a>
        <a href="<?= url(['shop/recharge', 'amount' => $shop->stock_show2, 'shop_id' => $shop->id]);?>" class="thick lf last buy-btn">立即购买</a>
    </div>

    <div class="buy-mask" style="display: none;">
        <div class="buy-content">
            <p class="buy-title">我的账单余额：<span>￥<?= u()->account<0?'异常':u()->account - u()->blocked_account?></span></p>
            <p class="buy-count">选择购买商品数量</p>

            <p class="add-panel clear-fl">
                <span class="minus">-</span>
                <span class="count">1</span>
                <span class="plus">+</span>
            </p>
            <p class="money">扣除账户余额:<span class="qian" data-val="<?= $shop->stock_show2?>"><?= $shop->stock_show2?></span></p>
            <p class="bottom-btn-group clear-fl">
                <a href="">取消</a>
                <button class="active confirm-buy-btn">确认购买</button>
            </p>
        </div>
    </div>
    <input type="hidden" name="id" id="shop_id" value="<?= get('id')?>">

    <script type="text/javascript">
    $(".buy-btn").click(function(e) {
      e.preventDefault();
      $(".buy-mask").show();
    });

    $(".buy-content").click(function(e){
      e.stopPropagation();
    })
    $(".buy-mask").click(function(event) {
      $(this).hide();
    });
    </script>

    <script type="text/javascript">
    $(".add-panel").click(function(e) {
        var target = e.target;
        var account = $(this).find(".count").html();
        if( $(target).hasClass("minus") ){
            //减
            if(account <= 0){ return false; }
            $(this).find(".count").html( --account);
           
            var price = $(".qian").data("val");
            $(".qian").html(-account * price );
        }else if( $(target).hasClass("plus") ){
            //加
            $(this).find(".count").html( ++account);
            var price = $(".qian").data("val");
            $(".qian").html(-account * price);
        }
    });
    $('.confirm-buy-btn').click(function(){
      var data = {};
      data.qian = $(".qian").text();
      data.addr = $("#addr").text();
      data.shop_id = $('#shop_id').val();
      // console.log(data); return;
      $.get("<?= url('shop/ajax-pay')?>", {data: data}, function(msg) {
          if (!msg.state) {
              // alert(1);
            $.alert(msg.info);
          } else {
              // alert(2);
            $.alert(msg.info);
          }
      },'json');
    })
    </script>