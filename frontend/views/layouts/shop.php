<?php use common\helpers\Html; ?>
<?php frontend\assets\AppAsset::register($this) ?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="utf-8"/>
    <meta name="HandheldFriendly" content="true">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="/js/rem.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/animate.css">
    <link rel="stylesheet" type="text/css" href="/css/common1.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
    <?= $content ?>
    <footer class="foot-nav">
        <ul>
            <li class="<?php if ($this->context->module->requestedRoute == 'shop/index') {echo 'active';} ?> home"><a href="<?= url('shop/index') ?>">首页</a></li>
            <li class="<?php if ($this->context->module->requestedRoute == 'shop/personal') {echo 'active';} ?> my"><a href="<?= url('shop/personal')?>">我的</a></li>
        </ul>
    </footer>
<input type="hidden" value="<?= url(['site/getData']) ?>" id="getStockDataUrl">
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>