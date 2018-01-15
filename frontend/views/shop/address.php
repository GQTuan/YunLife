    <ul class="address-list">
    <?php foreach ($address as $vo): ?>
        <li>
            <p class="address-title clear-fl">
                <span class="lf"><?= $vo->user->nickname ?></span>
                <span class="rt"><?= $vo->user->mobile ?></span>
            </p>
            <p class="address-detail"><?= $vo->addr?></p>
            <div class="handle-panel clear-fl">
<!--                 <span class="checkboxFour lf">
                    <input name="default" type="radio" id="checkboxFourInput<?= $vo->id?>" class="checkboxFourInput">
                    <label for="checkboxFourInput<?= $vo->id?>"></label>
                </span>
                <span class="lf">设置默认地址</span> -->
                <span class="rt">
                    <!-- <a class="del" data-id="<?= $vo->id ?>" href="<?= url(['shop/del-address', 'id' => $vo->id])?>">删除</a> -->
                    <a href="<?= url(['shop/edit-address', 'id' => $vo->id])?>">编辑</a>
                </span>
            </div>
        </li>
    <?php endforeach ?>
       
    </ul>
    <a href="<?php echo url('shop/add-address') ?>" class="add-address-btn">添加新地址</a>
<script type="text/javascript">
    $("#checkboxFourInput2").click(function(){
        var bian = $(this).is(":checked");
        console.log(bian);
        $.post(url, {id: id}, function(msg) {
            console.log(msg);
            return;
            $.alert(msg.info);
        }, 'json');
    });
</script>