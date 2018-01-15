<ul class="car-item-list">
    <li class="clear-fl"> 
        <span class="select-btn active"></span>
        <div class="lf pho-container">
            <img src="/images/homepage_commodity.png">
        </div>
        <div class="lf shopping-car-info">
            <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
            <p class="clear-fl car-price">
                <span class="fl">￥340</span>
                <s>￥679</s>
                <span class="rt">250g</span>
            </p>
            <div class="clear-fl">
                <p class="control-panel clear-fl lf">
                    <span class="minus">-</span>
                    <span class="count">1</span>
                    <span class="plus">+</span>
                </p>
                <span class="rt delete-btn"></span>
            </div>
        </div>
    </li>

    <li class="clear-fl"> 
        <span class="select-btn"></span>
        <div class="lf pho-container">
            <img src="/images/homepage_commodity.png">
        </div>
        <div class="lf shopping-car-info">
            <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
            <p class="clear-fl car-price">
                <span class="fl">￥340</span>
                <s>￥679</s>
                <span class="rt">250g</span>
            </p>
            <div class="clear-fl">
                <p class="control-panel clear-fl lf">
                    <span class="minus">-</span>
                    <span class="count">1</span>
                    <span class="plus">+</span>
                </p>
                <span class="rt delete-btn"></span>
            </div>
        </div>
    </li>

    <li class="clear-fl"> 
        <span class="select-btn"></span>
        <div class="lf pho-container">
            <img src="/images/homepage_commodity.png">
        </div>
        <div class="lf shopping-car-info">
            <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
            <p class="clear-fl car-price">
                <span class="fl">￥340</span>
                <s>￥679</s>
                <span class="rt">250g</span>
            </p>
            <div class="clear-fl">
                <p class="control-panel clear-fl lf">
                    <span class="minus">-</span>
                    <span class="count">1</span>
                    <span class="plus">+</span>
                </p>
                <span class="rt delete-btn"></span>
            </div>
        </div>
    </li>

    <li class="clear-fl"> 
        <span class="select-btn"></span>
        <div class="lf pho-container">
            <img src="/images/homepage_commodity.png">
        </div>
        <div class="lf shopping-car-info">
            <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
            <p class="clear-fl car-price">
                <span class="fl">￥340</span>
                <s>￥679</s>
                <span class="rt">250g</span>
            </p>
            <div class="clear-fl">
                <p class="control-panel clear-fl lf">
                    <span class="minus">-</span>
                    <span class="count">1</span>
                    <span class="plus">+</span>
                </p>
                <span class="rt delete-btn"></span>
            </div>
        </div>
    </li>

    <li class="clear-fl"> 
        <span class="select-btn"></span>
        <div class="lf pho-container">
            <img src="/images/homepage_commodity.png">
        </div>
        <div class="lf shopping-car-info">
            <p>陶渊明茶叶/乌龙茶/乌龙茶王老吉/清香型武夷岩</p>
            <p class="clear-fl car-price">
                <span class="fl">￥340</span>
                <s>￥679</s>
                <span class="rt">250g</span>
            </p>
            <div class="clear-fl">
                <p class="control-panel clear-fl lf">
                    <span class="minus">-</span>
                    <span class="count">1</span>
                    <span class="plus">+</span>
                </p>
                <span class="rt delete-btn"></span>
            </div>
        </div>
    </li>
</ul>


<script type="text/javascript">
$(function(){
    $(".car-item-list").on('click', '.select-btn', function(event) {
        event.preventDefault();
        $(".select-btn").not(this).removeClass("active");
        $(this).toggleClass('active');
        
    });

    $(".control-panel").click(function(e) {
        var target = e.target;
        var account = $(this).find(".count").html();
        if( $(target).hasClass("minus") ){
            //减
            if(account <= 0){return false;}
            $(this).find(".count").html(--account );
            
        }else if( $(target).hasClass("plus") ){
            //加
           $(this).find(".count").html( ++account);
        }
    });
    $(".car-item-list").on("click" , ".delete-btn" , function(){
        $(this).parents("li").remove();
        //发送ajax，提交删除项id
    })
})
</script>