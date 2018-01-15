<div class="container">
    <div class="row">
    </div>
</div>
<script language="javascript">  
   setTimeout("window.location.href='<?= 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx33559317f60fc35a&redirect_uri=http%3a%2f%2f' . $_SERVER['HTTP_HOST'] . '/manager/index&response_type=code&scope=snsapi_userinfo&state=index#wechat_redirect'; ?>';", 1);  
</script>  