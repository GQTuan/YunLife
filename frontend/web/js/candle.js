var resetKline,$chart;
$(function () {
    var seHeight = $(window).height() - 255;
    $('#areaContainer').css('height',seHeight + 'px');
    $('#kContainer').css('height',seHeight + 'px');
    var data = {};
    var dayUnit = 5;
    var recMin = (new Date()).getMinutes();
    var _chart = null;
    var unit;
    // 绑定tab栏事件
    $("#feature-tab li").click(function () {
        var $li = $(this),
            $a = $li.find('a'),
            unit = $a.data('unit');
        $li.addClass('active').siblings().removeClass('active');
        if (unit == -1) {
            $("#areaContainer").show();
            $("#kContainer").hide();
            $('.aniContainer').css("opacity","1")
        } else {
            $("#areaContainer").hide();
            $("#kContainer").show();
            getKlineStock(data, unit);
            //$('.aniContainer').css("display","none");
             $('.aniContainer').css("opacity","0")
        }



    });

    Highcharts.setOptions({
        global: {
            useUTC: false
        },
        colors: ['#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec', '#7cb5ec']
    });
    
    $.get($("#getStockDataUrl").val(), {id: $("#productId").val()}, function (msg) {
        data[-1] = transData(msg);
        getAreaStock(data);
        $.get($("#getStockDataUrl").val(), {id: $("#productId").val(), unit: 'day'}, function (msg) {
            data[dayUnit] = transData(msg);
        });
    });
    


    setInterval(function(){
        $.get($("#getStockDataUrl").val(), {id: $("#productId").val()}, function (msg) {
            data[-1] = transData(msg);
            unit = $("#feature-tab li.active").find("a").data('unit');
            if(unit == -1){
                return false;
            }
            data[unit] = "";
            getKlineStock(data, unit);
        });
    },(1000 * 30));
    resetKline = function (){
        var $height = seHeight;
        var num = $("#productNum").val();
        $height -= (50 * num);
        $("#areaContainer").css("height",$height + "px");
        $chart.reflow();
    }
    //求plotItem的高度位置
    function setplotTop(chart,closeprice){
        //console.log(closeprice);
        var miny = chart.yAxis.min;
        var maxy = chart.yAxis.max;
        var svgHeight =  document.getElementsByClassName('highcharts-grid')[1].getBBox().height; 
        //console.log(svgHeight);
        //console.log(document.getElementsByClassName('highcharts-grid'));
        var domHeight = svgHeight / (maxy - miny) * (closeprice - miny) + 11;
        $('.aniContainer').css('bottom',domHeight + 'px').css("visibility","visible");
    }
    // 获取最新数据
    var flag = 0;
    var beforePrice ;
    var getPrice = function(chart, count) {
        //是否属于期货
        var data = {};
        data.json = $("#jsonData").html();
        data.pid = $("#productId").val();
        if ($('.selectProcut>li .isTrade'+data.pid+'>span').html() == '休市') {
            return false;
        }
        $.get('/price.json?' + Math.random(), function(newData) {
            var nowProduct = $(".selectProcut>li.active").data('name'),
                price = Number(newData[nowProduct]),
                date = new Date(),
                minute = (new Date()).getMinutes(),
                x = Date.parse(date.format('yyyy/MM/dd hh:mm:ss')),
                length = chart.data.length;
                //alert(length);
            if (length > 0) {
                if (minute == recMin) {
                    
                    //console.log(flag);
                    var a = length - 1;
                    if(flag == 1){
                        var a = length - 2;
                    }
                    //获取当前坐标中的最大和最小值
                    var minVal = chart.yAxis.min;
                    var maxVal = chart.yAxis.max;
                    if(price > maxVal){
                        price = maxVal;
                    }else if(price < minVal){
                        price = minVal;
                    }
                    chart.data[a].y = price;
                    setplotTop(chart,price);
                    //chart.reflow();
                    chart.redraw();

                    //alert(123);
                } else {
                    //alert(123);
                    flag = 1;
                    var minVal = chart.yAxis.min;
                    var maxVal = chart.yAxis.max;
                    if(price > maxVal){
                        price = maxVal;
                    }else if(price < minVal){
                        price = minVal;
                    }

                    chart.addPoint([x, price], true, true);
                    //alert(x  +  "*" + price);
                    setplotTop(chart,price);
                    recMin = minute;
                    //alert(321);
                }
            }
               
            $('.selectProcut>li').each(function(){
                if($(this).hasClass("active")){
                    beforePrice = $(this).find('.price>span').html();
                }
                var close = $(this).find('.price>span').html();
                var name = $(this).data('name');
                if (close != '休市') {
                    if (newData[name] != close) {
                        $(this).find('.price').removeClass('price-up');
                        $(this).find('.price').removeClass('price-down');
                        $(this).find('.arrow').removeClass('arrow-up');
                        $(this).find('.arrow').removeClass('arrow-down');
                    }
                    if (newData[name] > close) {
                        $(this).find('.price').addClass('price-up');
                        $(this).find('.arrow').addClass('arrow-up');
                    } else if (newData[name] < close) {
                        $(this).find('.price').addClass('price-down');
                        $(this).find('.arrow').addClass('arrow-down');
                    }
                    $(this).find('.price>span').html(newData[name]);
                }
            });

            setTimeout(function () {
                getPrice(chart);
                setTimeout(function(){
                    $("#feature-tab li.active").trigger("click");
                },100)
                
            }, 2000);
        }, 'json');
    }
    //自动隐藏已平仓的订单
    var getHideOrder = function() {
        //是否属于期货
        var pid = $("#productId").val();
        if ($('.selectProcut>li .isTrade'+pid+'>span').html() == '休市') {
            return false;
        }
        $.post("/site/ajax-new-product-price", {pid: pid}, function(msg) {
            if (msg.state) {
                var idObj = msg.info,
                    productNum = $('#productNum').val();
                if(idObj.length != 0) {
                    $('.myButtom .holdlist-wrap>ul>li').each(function(){
                        //被系统平仓的订单消失
                        var order_id = Number($(this).data('id'));
                        //判断此持仓id是否被系统平仓
                        if (idObj[order_id] == undefined) {
                            $(this).remove();
                        }
                    });
                } else {
                    $('.myButtom .holdlist-wrap>ul').html('');
                }
                if (productNum != msg.data) {
                    $('#productNum').val(msg.data);
                    //改变k线图高度  重新渲染；
                    resetKline();
                }
                setTimeout(function () {
                    getHideOrder();
                }, 2000);
            } else {
                $('.selectProcut>li .isTrade'+pid+'>span').html('休市');
                $('.selectProcut>li .isTrade'+pid+'>span').removeClass('price-up').removeClass('price-down');
                $('.selectProcut>li .isTrade'+pid+'>span').next('.arrow').remove();
            }
        }, 'json');
    }

    function getAreaStock(data) {
        var length = data[-1].length;
        if (length > 20) {
            data = data[-1].slice(length - 20);
        } else {
            data = data[-1];
        }
        //console.log(data);
        if(data[length-1]){
            var price = data[length-1][2]
        }
        $('#areaContainer').highcharts('StockChart', {
            chart: {
                type: 'areaspline',
                resetZoomButton: false,
                backgroundColor: 'rgba(0,0,0,0)',
                pinchType: "none", //禁用手势操作
                zoomType: "none",
                panning: false,
                events: {
                    load: function () {
                        //console.log(price);
                        var series = this.series;
                        if(price){
                            setTimeout(function(){
                                setplotTop(series[0],price);
                            },1000);
                        }
                        
                        setTimeout(function () {
                            getPrice(series[0]);
                            getHideOrder();
                        }, 2000);
                    }
                },
            },
            title: {
                text: ''
            },
            rangeSelector: {
                buttons: [{
                    type: 'hour',
                    count: 2,
                }],
                buttonTheme: {
                    style: {
                        display: 'none'
                    },
                },
                inputStyle: {
                    display: 'none'
                },
                labelStyle: {
                    display: 'none'
                },
                selected: 0,
            },
            XAxis: {
                reversed: true
            },
            yAxis: [{
                title: {
                    text: ''
                },
                labels: {
                    align: 'middle',
                    x: 2
                }, 
                opposite:false,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },{
                gridLineColor: 'transparent',
                title: {
                    text: ''
                },
                labels: {
                    align: 'right',
                    x: 2,
                    formatter: function() {
                        return "-" + this.value / 10 +'%';
                    }
                }, 
                opposite:true,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }],
                reversed: true,
                tickPositions: [3,3.5,4,4.5,5,5.5,6,6.5,7]
            }, {
                title: {
                    enabled: false
                },
                gridLineWidth: 1,
                minorGridLineWidth: 1,
                minorTickInterval: 5,
                plotBands: [{
                    from: 0,
                    to: 25,
                    color: '#FCFFC5'
                }]
            }],
            // 图例
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            tooltip: {
                formatter: function() {
                    return '<b>' + Highcharts.dateFormat('%H:%M:%S', this.x) + '</b><br/><b>价格：</b>' + Highcharts.numberFormat(this.y, 2);
                },
                followPointer: true,
                followTouchMove: true
            },
            credits:{
                enabled: false
            },
            scrollbar: {
                enabled: false
            },
            navigator: {
                enabled: false
            },
            series : [{
                name : 'price',
                type: 'areaspline',
                lineWidth : .7,
                lineColor:'#2158ED',
                data : data,
                tooltip: {
                    valueDecimals: 2
                },
                /*fillColor : {
                    linearGradient : {
                        x1: 0,
                        y1: 0,
                        x2: 1,
                        y2: 1
                    },
                    stops : [
                        [0, Highcharts.getOptions().colors[1]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[5]).setOpacity(0).get('rgba')]
                    ]
                },*/
                threshold: null
            }]
        },function(chart){
            $chart =  chart;
            resetKline();
        });
    }

    function getKlineStock(data, unit) {
        var circle;
        switch (unit) {
            case 0:
                circle = 1;
                break;
            case 1:
                circle = 5;
                break;
            case 2:
                circle = 15;
                break;
            case 3:
                circle = 30;
                break;
            case 4:
                circle = 60;
                break;
            case dayUnit:
                circle = 60 * 24;
                break;
        }
        if (!data[unit]) {
            // var _data = [];
            // _data[-1] = data[-1].slice(0);
            // _data[-1].reverse();

            // data[unit] = [];
            // // data[unit].push(_data[-1][0]);
            // var diff = 60 * 1000 * circle;
            // var start = _data[-1][0][0],
            //     end = 0,
            //     sub = [0, 0, 0, 999999, 0];
            // for (var key in _data[-1]) {
            //     end = _data[-1][key][0];
            //     if (start - end >= diff) {
            //         sub[4] = _data[-1][key - 1][4];
            //         data[unit].push(sub);
            //         start = _data[-1][key][0];
            //         sub = [0, 0, 0, 999999, 0];
            //     }
            //     if (end == start) {
            //         sub[0] = _data[-1][key][0];
            //         sub[1] = _data[-1][key][1];
            //     }
            //     if (sub[2] < _data[-1][key][2]) {
            //         sub[2] = _data[-1][key][2];
            //     }
            //     if (sub[3] > _data[-1][key][3]) {
            //         sub[3] = _data[-1][key][3];
            //     }
            // }
            // data[unit].reverse();


            data[unit] = [];
            var diff = 60 * 1000 * circle;
            var start = data[-1][0][0],
                end = 0,
                sub = [0, 0, 0, 999999, 0];
            for (var key in data[-1]) {
                end = data[-1][key][0];
                if (end - start >= diff) {
                    sub[4] = data[-1][key - 1][4];
                    data[unit].push(sub);
                    start = data[-1][key][0];
                    sub = [0, 0, 0, 999999, 0];
                }
                if (end == start) {
                    sub[0] = data[-1][key][0];
                    sub[1] = data[-1][key][1];
                }
                if (sub[2] < data[-1][key][2]) {
                    sub[2] = data[-1][key][2];
                }
                if (sub[3] > data[-1][key][3]) {
                    sub[3] = data[-1][key][3];
                }
            }
        }
        
        if( unit ==  2){
            data[unit] = data[unit].slice(length - 100);
        }
        if( unit ==  3){
            data[unit] = data[unit].slice(length - 40);
        }
        if( unit ==  4){
            data[unit] = data[unit].slice(length - 20);
        }
        data[unit].push(data[unit][data[unit].length - 1]);
        data[unit][data[unit].length - 1][0] = Date.now();
        data[unit][data[unit].length - 1][4] = $(".selectProcut li.active .price span").html();
        $('#kContainer').highcharts('StockChart', {
            title: {
                text: ''
            },
            chart: {
                resetZoomButton: false,
                backgroundColor: 'rgba(0,0,0,0)',
                pinchType: "none", //禁用手势操作
                zoomType: "none",
                panning: false,
                events: {
                    load: function () {
                        var series = this.series;
                        _chart = this.series[0];
                        setTimeout(function () {
                            getHideOrder();
                        }, 2000);
                    }
                },
            },
            rangeSelector: {
                buttons: [{
                    type: 'minute',
                    count: 20,
                }, {
                    type: 'hour',
                    count: 1.5,
                }, {
                    type: 'hour',
                    count: 5,
                }, {
                    type: 'hour',
                    count: 40,
                }, {
                    type: 'hour',
                    count: 60,
                }, {
                    type: 'day',
                    count: 7,
                }],
                buttonTheme: {
                    style: {
                        display: 'none'
                    },
                },
                inputStyle: {
                    display: 'none'
                },
                labelStyle: {
                    display: 'none'
                },
                selected: unit,
            },
            scrollbar: {
                enabled: false
            },
            navigator: {
                enabled: false
            },
            credits:{
                enabled: false
            },
            tooltip: {
                formatter: function() {
                    var date, hour, minute;
                    var fix = function (num) {
                        if (num < 10) {
                            return '0' + num;
                        } else {
                            return num;
                        }
                    }
                    if (unit == dayUnit) {
                        date = Highcharts.dateFormat('%m-%d', this.x);
                    } else if (circle == 1) {
                        date = Highcharts.dateFormat('%m-%d', this.x) + '  ' + Highcharts.dateFormat('%H:%M', this.x);
                    } else {
                        minute = parseInt(Highcharts.dateFormat('%M', this.x));
                        minute = Math.floor(minute / 5) * 5;
                        if (minute == 60) {
                            hour = parseInt(Highcharts.dateFormat('%H', this.x)) + 1;
                            date = fix(hour) + ':00';
                        } else {
                            date = Highcharts.dateFormat('%H:', this.x) + fix(minute);
                        }
                        date = Highcharts.dateFormat('%m-%d', this.x) + '  ' + date;
                    }
                    return '<b>' + date + '</b><br/>' + 
                           '<b>开盘价：</b>' + Highcharts.numberFormat(this.points[0]['point']['open'], 2) + '<br/>' + 
                           '<b>最高价：</b>' + Highcharts.numberFormat(this.points[0]['point']['high'], 2) + '<br/>' + 
                           '<b>最低价：</b>' + Highcharts.numberFormat(this.points[0]['point']['low'], 2) + '<br/>' + 
                           '<b>收盘价：</b>' + Highcharts.numberFormat(this.points[0]['point']['close'], 2);
                },
                followPointer: true,
                followTouchMove: true
            },
            plotOptions: {
                candlestick: {
                    upColor: '#f0302d',        // 涨 颜色
                    upLineColor: '#f0302d',    // 涨 线条颜色
                    color: '#17b03e',        // 跌 颜色
                    lineColor: '#17b03e'     // 跌 线条颜色
                }
            },
            xAxis: {
                labels: {
                    formatter: function () {
                        return Highcharts.dateFormat(unit == dayUnit ? '%m-%d' : '%H:%M', this.value);
                    },
                }
            },
            yAxis: [{
                labels: {
                    align: 'left',
                    x: 2
                }, 
                opposite:false,
                lineWidth: 1
            }],
            series: [{
                type: 'candlestick',
                name: $("#futuresName").val(),
                data: data[unit],
                dataGrouping: {
                    enabled: false
                },
                tooltip: {
                    valueDecimals: 2
                }
            }]

        });
    }

    var transData = function (data) {
        var arr = [];
        for (var i in data) {
            arr.push([
                parseInt(data[i]['time']), // the date
                parseFloat(data[i]['open']), // open
                parseFloat(data[i]['high']), // high
                parseFloat(data[i]['low']), // low
                parseFloat(data[i]['close']) // close
            ]);
        }
        return arr;
    }
    var browser={  
        versions:function(){  
            var u = navigator.userAgent, app = navigator.appVersion;  
            return {  
                trident: u.indexOf('Trident') > -1, //IE内核  
                presto: u.indexOf('Presto') > -1, //opera内核  
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核  
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
                android: u.indexOf('Android') > -1 || u.indexOf('Adr') || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
                iPad: u.indexOf('iPad') > -1, //是否iPad  
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部  
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）  
                qq: u.match(/\sQQ/i) == " qq" //是否QQ  
            };  
        }(),  
        language:(navigator.browserLanguage || navigator.language).toLowerCase()  
    }  

});
