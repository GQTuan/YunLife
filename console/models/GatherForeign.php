<?php

namespace console\models;

use Yii;
use common\models\Order;
use common\models\Product;
use common\helpers\StringHelper;

class GatherForeign extends Gather
{
    public $urlPrefix = 'http://hq.sinajs.cn/list=';
    // 交易产品列表，格式为["表名" => "抓取链接参数名"]
    public $productList = [
        // 'eurjpy' => 'EURJPY', //欧元日元
        'gbpjpy' => 'GBPJPY', //英镑日元
        // 'usdjpy' => 'USDJPY', //美元日元
        // 'gbpusd' => 'GBPUSD', //英镑美元
        // 'usdcad' => 'USDCAD', //美元加元
        // 'eurcny' => 'EURCNY', //欧元人民币
    ];
    protected function G_EURJPY($html, $name)
    {
        $this->G_GC($html, $name, 'eurjpy');
    }

    protected function G_USDJPY($html, $name)
    {
        $this->G_GC($html, $name, 'usdjpy');
    }

    protected function G_EURCNY($html, $name)
    {
        $this->G_GC($html, $name, 'eurcny');
    }

    protected function G_USDCAD($html, $name)
    {
        $this->G_GC($html, $name, 'usdcad');
    }

    protected function G_GBPJPY($html, $name)
    {
        $this->G_GC($html, $name, 'gbpjpy');
    }

    protected function G_GBPUSD($html, $name)
    {
        $this->G_GC($html, $name, 'gbpusd');
    }

    protected function G_GC($html, $name, $title = '美黄金')
    {
        $arr = explode(',', $html);
        $data = [];
        $price = sprintf('%.4f', $arr[1]);

        $diff = $arr[4] / 10000;
        $diffRate = $diff * 100 / $arr[3];
        if (in_array($name, ['gbpjpy'])) {
            $price = $price * 1000;
            $open = $arr[5] * 1000;
            $high = $arr[6] * 1000;
            $low = $arr[7] * 1000;
            $close = $arr[3] * 1000;
            $diff = $diff * 1000;
        } 
            //名称-最新价-涨跌-涨跌幅-开盘价-最高-最低-昨收-更新时间
            $data = ['name' => $title, 'price' => floatval($price), 'diff' => sprintf('%.4f', $diff), 'diff_rate' => round($diffRate, 4) . '%', 'open' => floatval($open), 'close' => floatval($close), 'low' => floatval($low), 'high' => floatval($high), 'time' => $arr[17] . ' ' . $arr[0]];
        // }
        $this->insert($name, $data);
    }

    public function run()
    {
        $this->switchMap = option('risk_product') ?: [];
        $params = $d = '';
        $products = Product::find()->andWhere(['product.state' => Product::STATE_VALID])->asArray()->map('id', 'table_name');
        foreach ($this->productList as $name => $url) {
            if (!in_array($name, $products)) {
                continue;
            }
            $params .= $d . 'fx_s' . strtolower($url);
            $d = ',';
        }
        $html = $this->getHtml($this->urlPrefix . $params);

        $pieces = StringHelper::explode("\n", $html);
        foreach ($pieces as $value) {
            preg_match('/var hq_str_(.*)="(.*)";/U', $value, $match);
            $link = $match[1];
            $html = $match[2];
            $link = substr($link, 4);
            $method = 'G_' . strtoupper($link);
            $this->$method($html, $link);
        }

        // 监听是否有人应该平仓
        $this->listen();
    }
}
