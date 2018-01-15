  <style type="text/css">
    .form-control {
      display: inline-block;
      width: 75%;
      vertical-align: middle;
    }
    #addressId{
      border:0;
      outline: 0;
      box-shadow: none;
    }
    
    .thick {
      width: 100%;
    }
  </style>

  
   <div class="detail-content">
       <p class="detail-pro-name"><?= $shop->shop_name?></p>
       <p class="detail-price">￥<?= $shop->sell_cost?> <!-- <s>￥</s> --></p>
       <p class="detail-info clear-fl">
           <span class="lf">包邮</span>
           <span class="rt">已售<?= 35 + $count ?>笔</span>
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
          <a href="<?= url(['shop/add-address'])?>" class="modify-pwd clear-fl add-address-link">配送至 
          <?php if (!empty($addressArr)): ?>
          <select class="form-control addressId" id="addressId">
                <?php foreach ($addressArr as $key => $val): ?>
                <option value="<?= $key ?>" data-name="<?= $val ?>"><?= $val ?></option> 
                <?php endforeach ?>
          </select>
          <?php else : ?>
            <span class="rt" id="addr">未设置收货地址</span>
          <?php endif ?>
          </a>
        </p>
    </div>
    <p class="product-detail-top">产品详情</p>
    <div class="cust-detail">
       <?= $shop->contents ?>
    </div>
    <div class="detail-nav clear-fl">
        <a href="<?= url(['shop/recharge', 'amount' => $shop->sell_cost, 'shop_id' => $shop->id]);?>" class="thick lf last buy-btn">立即购买</a>
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
            <p class="money">扣除账户余额:<span class="qian" data-val="<?= $shop->sell_cost?>"><?= -$shop->sell_cost?></span></p>
            <p class="bottom-btn-group clear-fl">
                <a class="cancel">取消</a>
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
      data.addressId = $("#addressId").val();
      data.id = $('#shop_id').val();
      data.num = $('.buy-mask .add-panel .count').html();
      $.get("<?= url(['shop/ajaxPay']) ?>", {data: data}, function(msg) {
          if (msg.state) {
              if (msg.data == 1) {
                  $.alert(msg.info); 
                  window.location.href = '<?= url(['shop/pendingOrder']) ?>';
              } else {
                  $.alert('余额不够！');  
              }
          } else {
              $.alert(msg.info);
          }
      }, 'json');
    })


    $(".add-address-link").click(function(e){
      if( $(this).find("select#addressId").length >= 1 ){
        e.preventDefault();
      }
    })

    $(".cancel").click(function(){
      $(".buy-mask").hide();
    })
    </script>