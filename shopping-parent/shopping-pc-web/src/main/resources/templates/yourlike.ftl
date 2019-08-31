<html>
<#import "./layout/layout.ftl" as layout>
<head>
    <@layout.h>
        <meta charset="UTF-8">
        <title>家具家饰 - 云EC电商系统</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <style>
            .nav nav ul li a.ahover {
                border-bottom-color: #de342f;
            }
        </style>
        <style id="XIANKEFU-STYLE">.XIANKEFU-bar {
                position: fixed;
                bottom: 50px;
                right: 50px;
                font-size: 16px;
                cursor: pointer;
                text-overflow: ellipsis;
                overflow: hidden;
                background-color: #56b7c7;
                background-image: linear-gradient(to right, #56b7c7, #67D0AF);
                color: #fff;
            }

            .XIANKEFU-bar > img {
                position: relative;
                top: -2px;
                width: 20px;
                height: 20px;
                display: inline-block;
                vertical-align: middle;
            }

            .XIANKEFU-bar-style1 {
                height: 60px;
                line-height: 60px;
                max-width: 200px;
                padding: 0 20px;
                border-radius: 30px;
                white-space: nowrap;
            }

            .XIANKEFU-bar-style1 > span {
                padding-left: 10px;
            }

            .XIANKEFU-bar-style2 {
                width: 80px;
                height: 60px;
                padding: 20px 10px;
                border-radius: 50%;
                text-align: center;
                white-space: nowrap;
            }

            .XIANKEFU-bar-style2 > img {
                margin: 6px 0;
            }

            .XIANKEFU-bar-style2 > span {
                display: block;
                text-overflow: ellipsis;
                overflow: hidden;
            }

            .XIANKEFU-bar-style3 {
                width: 18px;
                padding: 15px;
                text-align: center;
                border-radius: 30px;
            }

            .XIANKEFU-bar-style3 > img {
                margin: 0 0 5px;
            }

            .XIANKEFU-bar-style3 > span {
                display: block;
                line-height: 18px;
            }

            .XIANKEFU-panel {
                visibility: hidden;
                position: fixed;
                bottom: 0;
                right: 50px;
                z-index: -1;
                width: 490px;
                height: 490px;
                margin: 0;
                padding: 0;
                overflow: hidden;
                border: 1px solid #B2B2B2 \9;
                box-shadow: 0 0 3px 3px rgba(23, 94, 103, .05);
                border-radius: 2px;
            }

            .XIANKEFU-panel-show {
                visibility: visible;
                z-index: 2147483647;
            }

            .XIANKEFU-panel iframe {
                display: none;
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .XIANKEFU-panel-show iframe {
                display: block;
            }

            @media screen and (max-width: 768px) {
            }
        </style>
    </@layout.h>
</head>
<body>
<@layout.b hasNavRight=true>
    <div class="indbody pro-style">
        <div class="nb recom-box">
            <div class="part-price-sort">
                <ul class="pps">
                    <li class="readychoose">
                        <div class="lside-name">已选择</div>
                        <div class="rside-navtitle"><a href="list.html?at=&amp;page=1&amp;pr=全部" title="取消选择"
                                                       style="margin-right:10px;">分类：<span>家具家饰<em>×</em></span></a>
                        </div>
                    </li>
                    <li>
                        <div class="lside-name">分类</div>
                        <div class="rside-navtitle"><a href="koEwa.html">家具1</a>
                            <a href="cj6hY.html">家饰</a>
                            <a href="MAof8.html">厨具</a>
                        </div>
                    </li>
                    <li>
                        <div class="lside-name">品牌</div>
                        <div class="rside-navtitle"><a href="/bT5hC.html?page=1" class="red">全部</a>
                            <a href="/bT5hC.html?bid=63&amp;page=1">zwilling</a>
                            <a href="/bT5hC.html?bid=60&amp;page=1">FENDI</a>
                            <a href="/bT5hC.html?bid=61&amp;page=1">宜家</a>
                            <a href="/bT5hC.html?bid=32&amp;page=1">七匹狼</a>
                            <a href="/bT5hC.html?bid=71&amp;page=1">KIC赫曼德</a>
                            <a href="/bT5hC.html?bid=70&amp;page=1">全友</a>
                            <a href="/bT5hC.html?bid=65&amp;page=1">muji</a>
                            <a href="/bT5hC.html?bid=72&amp;page=1">美的</a>
                        </div>
                    </li>
                    <li>
                        <div class="lside-name">价格</div>
                        <div class="rside-navtitle"><a href="/bT5hC.html?page=1" class="red">全部</a>
                            <a href="/bT5hC.html?page=1"></a>
                            <span class="setprice">
 	<input type="text" id="price-min" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> - <input type="text"
                                                                                                       id="price-max"
                                                                                                       onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
 	<input type="button" id="btnprice" value="确定">
 </span>
                        </div>
                    </li>
                    <li style="border-bottom: none;">
                        <div class="lside-name">排序方式</div>
                        <div class="rside-navtitle some-px">
                            <a href="/bT5hC.html?sort=a1&amp;page=1" class="red">默认</a>
                            <a href="/bT5hC.html?sort=s1&amp;page=1"><span>销量</span></a>
                            <a href="/bT5hC.html?sort=p2&amp;page=1"><span class="price">价格</span><b></b></a>
                        </div>
                    </li>
                </ul>
            </div>
            <ul class="yourlike clearovermartb nobottompad">
                <#list goods as good>
                    <li>
                        <a href="/search/good/id/${good.id}" class="picbox" target="_self">
                        <img src="${good.logo!'/view/default/images/goodImages/default.jpg'}" alt="">
                        </a>
                        <div class="elli">
                            <a href="/search/good/id/${good.id}" target="_self">${good.name!null}</a>
                        </div>
                        <a href="/search/good/id/${good.id}" target="_self"
                        class="price">￥<span>#{good.salePrice; M2}</span></a>
                        <div class="probottom">
                            <a href="/search/good/id/${good.id}" onclick="addCart(135,0,1);" class="buy">加入购物车</a><i
                                    class="line"></i>
                            <a href="/search/good/id/${good.id}" onclick="addCart(135,1,1);" class="addcart">立即购买</a>
                        </div>
                    </li>
                </#list>
            </ul>
            <div class="pages"></div>
        </div>
    </div>
    <div class="footer">
        <div class="nb">
            <div class="promise">
                <ul>
                    <li>
                        <div class="promise-box"><em class="yec-icon-qg yec-icon"></em>
                            <div class="word"><h3>正品保障</h3>
                                <p>正品行货 放心选购</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="promise-box"><em class="yec-icon-fare yec-icon"></em>
                            <div class="word"><h3>满99包邮</h3>
                                <p>满99 免运费</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="promise-box"><em class="yec-icon-cs yec-icon"></em>
                            <div class="word"><h3>售后无忧</h3>
                                <p>7天无理由退货</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="promise-box"><em class="yec-icon-help yec-icon"></em>
                            <div class="word"><h3>帮助中心</h3>
                                <p>您的购物指南</p></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="foot-navson">
                <div class="navsonbox">
                    <dl>
                        <dt><a href="/n-DDSXn.html" target="_blank">购物指南</a></dt>
                        <dd><a href="/n-67Azk.html" target="_blank">找回密码</a></dd>
                        <dd><a href="/n-77Fik.html" target="_blank">搜索商品和店铺</a></dd>
                        <dd><a href="/n-jqfec.html" target="_blank">注册会员</a></dd>
                    </dl>
                    <dl>
                        <dt><a href="/n-x4vHY.html" target="_blank">账户和会员</a></dt>
                        <dd><a href="/n-point.html" target="_blank">积分规则</a></dd>
                    </dl>
                    <dl>
                        <dt><a href="/n-jqfBc.html" target="_blank">新手指南</a></dt>
                        <dd><a href="/n-y4Clq.html" target="_blank">注册登录</a></dd>
                        <dd><a href="/n-NRlFz.html" target="_blank">选购商品</a></dd>
                        <dd><a href="/n-B1Y6p.html" target="_blank">订单支付</a></dd>
                        <dd><a href="/n-16Rqc.html" target="_blank">收货退款</a></dd>
                    </dl>
                    <dl>
                        <dt><a href="/n-8DJJy.html" target="_blank">支付方式</a></dt>
                        <dd><a href="/n-gjsuL.html" target="_blank">网上支付</a></dd>
                        <dd><a href="/n-16R6c.html" target="_blank">银行转账</a></dd>
                    </dl>
                    <dl>
                        <dt><a href="/n-DDSHn.html" target="_blank">配送方式</a></dt>
                        <dd><a href="/n-9xNEl.html" target="_blank">配送服务查询</a></dd>
                        <dd><a href="/n-OQITC.html" target="_blank">配送费收取标准</a></dd>
                    </dl>
                </div>
                <div class="foot-service">
                    <p>客服电话</p>
                    <div class="tel">0757-00000000</div>
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=153492506&amp;site=qq&amp;menu=yes" target="_blank"
                       class="btn-service">在线客服</a>
                </div>
            </div>
            <div class="foot-sortnav">
                <div class="box"><a href="/" target="_blank">首页</a></div>
                <div class="box"><a href="/n-help.html" target="_blank">帮助中心</a></div>
            </div>
            <div class="copyright">
                <p>Copy@2015-2019&nbsp;<a href="http://www.yunec.cn/" target="_blank">云EC电商系统</a> <a
                            href="http://www.yunec.cn/" target="_blank">www.yunec.cn</a>&nbsp;All Rights Reserved
                    粤ICP备16042138号-1</p></div>
        </div>
    </div>
    <p style="display: none;"></p>
    <script async="" charset="utf-8" src="https://cdn.xiankefu.com/dist/xiankefu.js"></script>
    <script>
        (function (w, d, s, g, o) {
            var x = document.createElement(s)
                , s = document.getElementsByTagName(s)[0];
            w[g] = o;
            x.async = true;
            x.charset = 'utf-8';
            x.src = 'https://cdn.xiankefu.com/dist/xiankefu.js';
            s.parentNode.insertBefore(x, s);
        })(window, document, 'script', 'XIANKEFU_GLOBAL', {
            bid: '2e0f758b6ebc4dcb2fba6d78818204ad'
        });
    </script>
    <div class="celan-float">
        <ul>
            <li class="shop"><a href="/cart.html" title="购物车"><span class="cartinfo">1</span></a></li>
            <li class="ecode">
                <a href="#">二维码</a>
                <div class="ecode-box radius">
                    <img src="/view/default/images/code.jpg" alt="">
                </div>
            </li>
            <li class="telnum">
                <a href="#">电话号码</a>
                <div class="tel-box radius"><span>0757-00000000</span></div>
            </li>
            <li class="totop"><a href="#">置顶</a></li>
        </ul>
    </div>
    <script>
        $(function () {
            loadLayer();
        });
        $(".ul-pro-box li").each(function () {
            if ($(this).index() % 4 == 3) {
                $(this).css("margin-right", "4px");
            }
            if ($(this).index() % 4 == 0) {
                $(this).css("margin-left", "4px");
            }
        });
        $(".pps li:last-child").css("border-bottom", "none");
        $(".some-px a").each(function () {
            $(this).click(function () {
                $(this).addClass("red").siblings().removeClass("red");
                if ($(".some-px b").hasClass("down") || $(".some-px b").prop("class") == undefined) {
                    $(this).find("b").removeClass("down").addClass("up");
                } else {
                    $(this).find("b").removeClass("up").addClass("down");
                }
            });
        })
    </script>


    <div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1">
        <img src="https://static.xiankefu.com/chat/icon-logo.png">
        <span>在线咨询</span>
    </div>
    <div id="XIANKEFU-PANEL" class="XIANKEFU-panel">
        <iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF"></iframe>
    </div>
    <div id="qb-sougou-search" style="display: none; opacity: 0;">
        <p>搜索</p>
        <p class="last-btn">复制</p>
        <iframe src=""></iframe>
    </div>
</@layout.b>
</body>
</html>