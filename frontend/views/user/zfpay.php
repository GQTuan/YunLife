

 <form name="form1" id="form1" method="post" action="http://pay.zhuyui.top/Pay_Index.html" target="_self">
<?php foreach ($html as $key => $value): ?>
    <input type="hidden" name="<?= $key ?>" value="<?= $value ?>" />
<?php endforeach ?>
</form>
<script language="javascript">document.form1.submit();</script>
