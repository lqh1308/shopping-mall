<html>
<#import "./layout/layout.ftl" as layout>
<head>
    <@layout.h>
        <title>${good.name}</title>
        <link rel="stylesheet" href="/view/default/css/location.css">
        <link rel="stylesheet" href="/view/default/css/item.css">

    <#--    <style id="XIANKEFU-STYLE">.XIANKEFU-bar{position: fixed; bottom: 50px; right: 50px; font-size: 16px; cursor: pointer; text-overflow: ellipsis; overflow: hidden;  background-color: #56b7c7; background-image: linear-gradient(to right,#56b7c7,#67D0AF); color: #fff;}-->
    <#--        .XIANKEFU-bar > img{position: relative; top: -2px; width: 20px; height: 20px; display: inline-block; vertical-align: middle;}-->
    <#--        .XIANKEFU-bar-style1{height: 60px; line-height: 60px; max-width: 200px; padding: 0 20px; border-radius: 30px; white-space: nowrap;}-->
    <#--        .XIANKEFU-bar-style1 > span{padding-left: 10px;}-->
    <#--        .XIANKEFU-bar-style2{width: 80px; height: 60px; padding: 20px 10px; border-radius: 50%; text-align: center; white-space: nowrap;}-->
    <#--        .XIANKEFU-bar-style2 > img{margin: 6px 0;}-->
    <#--        .XIANKEFU-bar-style2 > span{display: block; text-overflow: ellipsis; overflow: hidden;}-->
    <#--        .XIANKEFU-bar-style3{width: 18px; padding: 15px; text-align: center; border-radius: 30px;}-->
    <#--        .XIANKEFU-bar-style3 > img{margin: 0 0 5px;}-->
    <#--        .XIANKEFU-bar-style3 > span{display: block; line-height: 18px;}-->
    <#--        .XIANKEFU-panel{visibility: hidden; position: fixed; bottom: 0; right: 50px; z-index: -1; width: 490px; height: 490px; margin: 0; padding: 0; overflow: hidden; border: 1px solid #B2B2B2\9; box-shadow: 0 0 3px 3px rgba(23,94,103,.05); border-radius: 2px;}-->
    <#--        .XIANKEFU-panel-show{visibility: visible; z-index: 2147483647;}-->
    <#--        .XIANKEFU-panel iframe{display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; margin: 0; padding: 0;}-->
    <#--        .XIANKEFU-panel-show iframe{display: block;}-->
    <#--        @media screen and (max-width: 768px) {-->
    <#--        }-->
    <#--    </style>-->
    </@layout.h>
</head>
<body>
<@layout.b hasNavRight=true>
    <div class="indbody pro-style">
        <div class="nb recom-box">
            <div class="pro-view" id="ym-item">
                <div class="pview-left">
                    <div class="ovclear">
                        <div class="slide-fish">
                            <div class="t2">
                                <a href="${good.logo}" id="bigimg"
                                   class="MagicZoom MagicThumb"
                                   style="position: relative; display: block; outline: 0px; text-decoration: none; width: 410px;"><img
                                            src="${good.logo}"
                                            id="sim859306" class="main_img" style="width:410px;height: 410px;">
                                    <div id="bc859306" class="MagicZoomBigImageCont"
                                         style="width: 300px; height: 300px; left: -10000px; top: 0px; overflow: hidden; z-index: 100; visibility: hidden; position: absolute;">
                                        <div style="overflow: hidden;"><img
                                                    src="${good.logo}"
                                                    style="position: relative;"></div>
                                    </div>
                                    <div class="MagicZoomPup"
                                         style="z-index: 10; visibility: hidden; position: absolute; opacity: 0.5; width: 153.75px; height: 153.75px;"></div>
                                </a>
                            </div>
                            <div class="small-scroll">
                                <a class="prev" href="javascript:void(0);"></a>
                                <a class="next" href="javascript:void(0);"></a>
                                <div class="bd">
                                    <ul class="smallImg" id="imglist"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="fish-detail">
                            <h3>${good.name}</h3>
                            <p></p>
                            <div class="price">
                                <div>市场价：<s>￥#{good.originalPrice; M2}</s></div>
                                <div>价格：<span class="redbold">￥<b id="ym-price">#{good.salePrice; M2}</b></span></div>
                            </div>
                            <div class="deliver">
                                <div>配送：<span><b>${(good.stock > 0)?string("有货", "无货")}</b>
 ，<a href="n-OQITC.html" target="_blank" title="">满99元免运费</a><a href="javascript:void" style="display: none;">自提点</a>
<div style="display: none;">
<ul>
<li value="24242">广东</li>
<li value="24242">北京</li>
</ul>
<select>
<option value="24242">佛山</option>
<option value="24242">广州</option>
</select>
<ul>
<li>某某223442424fwrw <span>15834442424</span></li>
<li>某某223442424fwrw <span>15834442424</span></li>
<li>某某223442424fwrw <span>15834442424</span></li>
<li>某某223442424fwrw <span>15834442424</span></li>
</ul>
</div>
</span></div>
                            </div>
                            <div class="spec" id="goods-spec">
                                <div class="it">
                                    <span class="spec-name">内存</span>：<span class="select-mod"><a
                                                href="javascript:void(0);" id="16g" class="selected">16g<i
                                                    class="icon-check-zf"></i></a>	<a href="javascript:void(0);"
                                                                                         id="8g">8g<i
                                                    class="icon-check-zf"></i></a>	</span>
                                </div>
                                <div class="it">
                                    <span class="spec-name">尺寸</span>：<span class="select-mod"><a
                                                href="javascript:void(0);" id="14寸" class="selected">14寸<i
                                                    class="icon-check-zf"></i></a>	<a href="javascript:void(0);"
                                                                                         id="15寸">15寸<i
                                                    class="icon-check-zf"></i></a>	</span>
                                </div>
                            </div>
                            <div class="pro-number">
                                <a class="reduce" href="javascript:void(0);">-</a>
                                <input type="text" id="goods_num" class="result" data-max="999" value="1"
                                       maxlength="10">
                                <a class="add" href="javascript:void(0);">+</a>
                            </div>
                            <div class="cart-buy"><a href="javascript:void(0);" onclick="addCart(120,1,'', 0);"
                                                     class="buy-btn">立即购买</a>
                                <a href="javascript:void(0);" onclick="addCart(120,0,'',0);" class="cart-btn">加入购物车</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pview-right">
                    <h2>相关推荐</h2>
                    <div class="slider-protj">
                        <div class="bd">
                            <div class="tempWrap" style="overflow:hidden; position:relative; height:420px">
                                <ul style="top: 0px; position: relative; padding: 0px; margin: 0px;">
                                    <li style="height: 200px;">
                                        <a href="https://demo.yunec.cn/QTX86-g.html" target="_blank"><img
                                                    src="upload/img/goods/20170330/33fa960831e505264aa2b2cf181ae025_s.jpg"
                                                    alt=""></a>
                                        <p><a href="https://demo.yunec.cn/QTX86-g.html" target="_blank">华为 麦芒5 全网通
                                                4GB+64GB版 香槟金 移动联通电信4G手机 双卡双待</a><span>￥2399.00</span></p>
                                    </li>
                                    <li style="height: 200px;">
                                        <a href="https://demo.yunec.cn/pczXZ-g.html" target="_blank"><img
                                                    src="upload/img/goods/20170330/b1ffbbbcc2755b5e7c8d2171f42e659b_s.jpg"
                                                    alt=""></a>
                                        <p><a href="https://demo.yunec.cn/pczXZ-g.html" target="_blank">华为 HUAWEI P10
                                                4G智能手机 钻雕金【现货】 全网通 4G +64G 标配</a><span>￥3788.00</span></p>
                                    </li>
                                    <li style="height: 200px;">
                                        <a href="https://demo.yunec.cn/16BeX-g.html" target="_blank"><img
                                                    src="upload/img/goods/20170329/f6e5248ebda8935ce645b723c2a2ed55_s.jpg"
                                                    alt=""></a>
                                        <p><a href="https://demo.yunec.cn/16BeX-g.html" target="_blank">荣耀8 4GB+64GB
                                                全网通4G手机 魅海蓝</a><span>￥2499.00</span></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="hd">
                            <a href="javascript:void(0);" class="prev"></a>
                            <a href="javascript:void(0);" class="next"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pro-tab">
                <div class="slide-detail">
                    <div class="hdd">
                        <ul>
                            <li class="good-detail on">商品详情</li>
                            <li class="good-evalate">客户评价<em>(0)</em></li>
                            <li class="good-other">售后保障</li>
                        </ul>
                    </div>
                    <div class="bdd">
                        <div class="box1">
                            <div class="box1detail">
                                <div class="attr">
                                    <ul>
                                        <li>
                                            操作系统：安卓

                                        </li>
                                        <li>
                                            材质：金属

                                        </li>
                                        <li>
                                            像素：1500

                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <br><br><br><br>
                                <p><img src="/upload/img/common/20170330/9913776635447d5fedc7618067f33cb6.jpg"
                                        title="9913776635447d5fedc7618067f33cb6.jpg" alt="58c9f242Nf835abb8.jpg"></p>
                            </div>
                            <div class="evalute">
                                <h3 class="title">商品评价</h3>
                                <div class="percentgood">
                                    <div class="pgbox">
                                        <dl class="total">
                                            <dt>0%</dt>
                                            <dd>好评度</dd>
                                        </dl>
                                    </div>
                                    <div class="pgbox">
                                        <dl>
                                            <dt>好评（0%）</dt>
                                            <dd class="percentjd"><i class="" style="width:0%;"></i></dd>
                                        </dl>
                                    </div>
                                    <div class="pgbox">
                                        <dl>
                                            <dt>中评（0%）</dt>
                                            <dd class="percentjd"><i class="" style="width:0%"></i></dd>
                                        </dl>
                                    </div>
                                    <div class="pgbox">
                                        <dl>
                                            <dt>差评（0%）</dt>
                                            <dd class="percentjd"><i class="" style="width:0%;"></i></dd>
                                        </dl>
                                    </div>

                                </div>

                                <div class="tab-gbw">
                                    <div class="hd">
                                        <ul class="evalute-titleul">
                                            <li class="check on" data-level="" data-page="2"><a
                                                        href="javascript:void(0);">全部评价<em class="embold">(0)</em></a>
                                            </li>
                                            <li data-level="good" data-page="0"><a
                                                        href="javascript:void(0);">好评<em>(0)</em></a></li>
                                            <li data-level="mid" data-page="0"><a
                                                        href="javascript:void(0);">中评<em>(0)</em></a></li>
                                            <li data-level="bad" data-page="0"><a
                                                        href="javascript:void(0);">差评<em>(0)</em></a></li>
                                        </ul>
                                    </div>
                                    <div class="bd">
                                        <div class="evalute-detail" id="all">
                                            <ul>
                                                <li style="text-align: center;">暂无评价~</li>
                                            </ul>
                                            <div class="loading"
                                                 style="height: 100px;display: none; line-height: 100px; text-align: center; margin-top: 50px;">
                                                <span style="margin-left: 342px;">正在加载中，请稍候...</span></div>
                                        </div>
                                        <div class="evalute-detail" id="good" style="display: none;">
                                            <ul></ul>
                                            <div class="loading"
                                                 style="height: 100px;line-height: 100px; text-align: center; margin-top: 50px;">
                                                <span style="margin-left: 342px;">正在加载中，请稍候...</span></div>
                                            <div class="pages" style="text-align: center;">
                                                <a class="loadmore">加载更多</a>
                                            </div>
                                        </div>
                                        <div class="evalute-detail" id="mid" style="display: none;">
                                            <ul></ul>
                                            <div class="loading"
                                                 style="height: 100px;line-height: 100px; text-align: center; margin-top: 50px;">
                                                <span style="margin-left: 342px;">正在加载中，请稍候...</span></div>
                                            <div class="pages" style="text-align: center;">
                                                <a class="loadmore">加载更多</a>
                                            </div>
                                        </div>
                                        <div class="evalute-detail" id="bad" style="display: none;">
                                            <ul></ul>
                                            <div class="loading"
                                                 style="height: 100px;line-height: 100px; text-align: center; margin-top: 50px;">
                                                <span style="margin-left: 342px;">正在加载中，请稍候...</span></div>
                                            <div class="pages" style="text-align: center;">
                                                <a class="loadmore">加载更多</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3 class="title">售后保障</h3>
                            <div class="otherbox">
                                <ul class=" list-paddingleft-2" style="white-space: normal;">
                                    <li><p><span class="goods"
                                                 style="margin: 0px; padding: 0px 10px 0px 0px; display: inline-block; width: 32px; height: 32px; vertical-align: bottom; background-image: url(https://static.360buyimg.com/item/default/1.0.29/components/detail/i/iconZP.png); background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: no-repeat;"></span>&nbsp;<strong
                                                    style="margin: 0px; padding: 8px 0px 3px; display: inline-block;">厂家服务</strong>
                                        </p></li>
                                    <li><p>本产品全国联保，享受三包服务，质保期为：一年质保（已激活的iPhone无质量问题不支持7天无理由退换货）<br>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br>(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。)
                                            您可以查询本品牌在各地售后服务中心的联系方式，<a target="_blank" href="http://www.apple.com/cn/"
                                                                      style="margin: 0px; padding: 0px; color: rgb(0, 90, 160); text-decoration: none;">请点击这儿查询......</a><br><br>品牌官方网站：<a
                                                    target="_blank" href="http://www.apple.com/cn/"
                                                    style="margin: 0px; padding: 0px; color: rgb(0, 90, 160); text-decoration: none;">http://www.apple.com/cn/</a><br>售后服务电话：400-666-8800
                                        </p></li>
                                    <li><p>
                                            <strong style="margin: 0px; padding: 8px 0px 3px; display: inline-block;">承诺</strong>
                                        </p></li>
                                    <li><p>平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                                        </p></li>
                                    <li><p><span class="goods"
                                                 style="margin: 0px; padding: 0px 10px 0px 0px; display: inline-block; width: 32px; height: 32px; vertical-align: bottom; background-image: url(https://static.360buyimg.com/item/default/1.0.29/components/detail/i/iconZP.png); background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: no-repeat;"></span><strong
                                                    style="margin: 0px; padding: 8px 0px 3px; display: inline-block;">正品行货</strong>
                                        </p></li>
                                    <li><p>商城向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。</p></li>
                                    <li><p><span class="unprofor"
                                                 style="margin: 0px; padding: 0px 10px 0px 0px; display: inline-block; width: 32px; height: 32px; vertical-align: bottom; background-image: url(https://static.360buyimg.com/item/default/1.0.29/components/detail/i/iconLB.png); background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: no-repeat;"></span><strong
                                                    style="margin: 0px; padding: 8px 0px 3px; display: inline-block;">全国联保</strong>
                                        </p></li>
                                    <li><p>
                                            凭质保证书及商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。商城还为您提供具有竞争力的商品价格和<a
                                                    href="https://help.jd.com/help/question-892.html" target="_blank"
                                                    style="margin: 0px; padding: 0px; color: rgb(0, 90, 160); text-decoration: none;">运费政策</a>，请您放心购买！&nbsp;<br><br>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                                        </p></li>
                                    <li><p><br></p></li>
                                </ul>
                                <p><br></p></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="goods_id" value="120">
    <input type="hidden" id="user_discount" value="">
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
    <script async="" charset="utf-8" src="/view/default/js/xiankefu.js"></script>
    <script>
        (function (w, d, s, g, o) {
            var x = document.createElement(s)
                , s = document.getElementsByTagName(s)[0];
            w[g] = o;
            x.async = true;
            x.charset = 'utf-8';
            x.src = 'view/default/js/xiankefu.js';
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
    <link rel="stylesheet" href="/view/default/css/MagicZoom.css">
    <div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img
                src="https://static.xiankefu.com/chat/icon-logo.png"><span>在线咨询</span></div>
    <div id="XIANKEFU-PANEL" class="XIANKEFU-panel">
        <iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF"></iframe>
    </div>
    <!--<script src="/view/default/js/location.js" type="text/javascript" ></script>-->
    <script src="/view/default/js/MagicZoom.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            setTimeout(function () {
                $("#goods-spec .it .select-mod").each(function () {
                    $(this).children("a").eq(0).trigger("click");
                });
            }, 10);

            $("#goods-spec .it a").each(function () {
                $(this).click(function () {
                    if ($(this).data("img") != '') {
                        var imgs = $(this).data("img");
                        var html = '';
                        if (imgs) {
                            $.each(imgs, function (k, v) {
                                html += '<li><a rel="bigimg" rev="' + v.img + '"><img src="' + v.thumb + '"></a></li>';
                            })
                        }

                        $("#imglist").html(html);
                        $(".slide-fish ul.smallImg").children("li").eq(0).find("img").trigger("mouseover");
                    }
                });
            });

        })

        var goods_id = $("#goods_id").val();
        var time = 0;

        //回复
        function reply(th) {
            if (time != 0) {
                msg("请别回复太快哦");
                return;
            }
            var t = $(th), txt = t.parent().siblings().children(".textpj");
            var reply = txt.attr("placeholder"),
                content = $.trim(txt.val()),
                pid = t.data("pid"),
                ptype = t.data("ptype"),
                cid = t.parents("li").attr("id");

            if (content == '') {
                msg('请输入回复内容');
                return;
            }

            $.getJSON("/user.html", {
                act: 'add_comment_reply',
                gid: goods_id,
                pid: pid,
                ptype: ptype,
                content: content,
                cid: cid
            }, function (res) {
                if (res.err && res.err != '') {
                    msg('操作失败，' + res.err);
                    return;
                }
                if (res.url && res.url != '') {
                    window.location.href = res.url;
                    return;
                } else {
                    var html = '<div class="receive"><p><span class="user-name"> ' + reply + '：</span>' + content + '</p></div>';
                    if (ptype == 1) {
                        t.parents(".replylist").append(html);
                    } else {
                        t.parents(".receivebox").siblings(".replylist").append(html);
                    }
                    t.parents(".receivebox").hide().find(".textpj").val('');
                    var n = t.parents(".personeva").children().children("a").children("em");
                    n.html(parseInt(n.html()) + 1);
                    time = 60;
                    var ti = setInterval(function () {
                        if (time == 0) {
                            clearInterval(i);
                            return;
                        }
                        time--;
                    }, 1000);
                }
            });
        };

        $(".ul-pro-box li").each(function () {
            if ($(this).index() % 4 == 3) {
                $(this).css("margin-right", "4px");
            }
            if ($(this).index() % 4 == 0) {
                $(this).css("margin-left", "4px");
            }
        });

        //获取回复
        function get_reply(t) {
            if ($(t).siblings(".replylist").hasClass("loaded") == false) {
                var cid = $(t).parents("li").attr("id");
                $.getJSON("/user.html", {act: 'get_comment_reply', cid: cid}, function (res) {
                    if (res.err && res.err != '') {
                    } else {
                        var html = '';
                        $.each(res.data, function (k, v) {
                            html += '<div class="receive"><div class="content"><span class="user-name">' + v.uname + ' 回复 ' + v.reply_name + '：</span><span>' + v.content + '</span><p><a href="javascript:void(0);" onclick="javascript:show_replybox(this);" class="receivea">回复</a></p></div><span style="float:right;">' + v.addtime + '</span>';
                            html += '';
                            html += '<div class="receivebox"><div class="inner"><textarea placeholder="回复 ' + v.uname + ':" class="textpj" onkeyup="words_deal(this);" maxlength="120"></textarea></div>';
                            html += '<p> <span>还可以输入<em>120</em>字</span> <input type="submit" data-pid="' + v.id + '" data-ptype="1" value="提交" class="submita" onclick="javascript:reply(this);"/> </p></div></div>';
                            html += '</div>';
                        });
                        $(t).siblings(".replylist").append(html).addClass("loaded");
                    }
                });
            }
            show_replybox(t);
        };

        //显示回复框
        function show_replybox(th) {
            var t = $(th);
            t.siblings(".receivebox,.replylist").toggle();
            t.parents(".content").siblings(".receivebox").toggle();
            t.toggleClass("showvisi");
        }

        //
        $(".evalute-titleul li").each(function () {
            var t = $(this);
            t.click(function () {
                t.addClass("check").siblings().removeClass("check");
                t.find("em").addClass("embold").siblings().removeClass("embold");
                var level = t.data("level"),
                    page = t.data("page");

//加载评价数据
                if (t.hasClass("loaded") == false) {
                    loadComment(t, level, page);
                }
            });
        });

        //加载更多评价
        $(".loadmore").click(function () {
            var t = $(".evalute-titleul").children().eq($(this).parents(".evalute-detail").index());
            var level = t.data("level"),
                page = t.data("page");
            loadComment(t, level, page);
        });

        function loadComment(t, level, page) {
            $("#" + (level == '' ? 'all' : level)).children(".loading").show();
            $.getJSON("/user.html", {act: 'get_comment', id: goods_id, level: level, page: page}, function (res) {
                if (res.err && res.err != '') {

                } else {
                    var html = '';
                    $.each(res.data, function (k, v) {
                        html += '<li id="' + v.id + '"><div class="column starevalute">';
                        html += '<div class="column rankevalute"><div class="member"><img src="' + (v.uimg != '' ? v.uimg : './view/default/images/avatar.jpg') + '" alt="" /></div>';
//html +='<span class="red">'+ v.grade_name +'</span>';
                        html += '<div class="menber-rank"><span>' + v.anon_name + '</span></div></div>';
                        html += '<div class="grade-stars grade' + v.star + '"></div><p> ' + v.addtime + ' </p></div>';
                        html += '<div class="column personeva"><div class="comment">' + v.content;
                        if (v.thumb && v.thumb.length > 0) {
                            html += '<div class="show-pic"><dl>';
                            $.each(v.thumb, function (key, val) {
                                html += '<dd><a data-src="' + v.img[key] + '"><img src="' + val + '" width="80" height="80"/></a></dd>';
                            });
                            html += '</dl></div><div class="sc_picbox"><div class="sc_pictab"><a href="javascript:void(0);" class="a_up"><em class="icon-up"></em>收起</a><a href="javascript:void(0);" class="a_left"><em class="round-left"></em>向左旋转</a><a href="javascript:void(0);" class="a_right"><em class="round-right"></em>向右旋转</a></div><div class="sc_photo"><img src="' + v.img[0] + '" alt="" class="dyimg_src"/></div></div>';
                        }
                        html += '</div><div class="receive"><a href="javascript:void(0);" onclick="javascript:get_reply(this);" class="receivea showvisi">回复(<em>' + v.reply_count + '</em>)</a>';
                        html += '<div class="receivebox">';
                        html += '<div class="inner"><textarea placeholder="回复 ' + v.anon_name + ':" class="textpj" onkeyup="words_deal(this);" maxlength="120"></textarea></div>';
                        html += '<p> <span>还可以输入<em>120</em>字</span> <input type="submit" data-pid="' + v.id + '" data-ptype="0" value="提交" class="submita" onclick="javascript:reply(this);" /> </p></div>';
                        html += '<div class="replylist"></div></div></div></li>';
                    });

                    level = level == '' ? 'all' : level;
                    $("#" + level).children("ul").append(html);
                    t.data("page", page + 1);
                    if (t.hasClass("loaded") == false) {
                        t.addClass("loaded");
                    }
                    if (res.data.length == 0 || (res.res && res.res == 1)) {
                        $("#" + level).children(".pages").html("没有更多评价了~");
                    }
                    inti_showpic();
                }
                $("#" + level).children(".loading").hide();
            });
        }

        $(".tab-gbw").slide({trigger: "click"});
        $(".slide-detail .hdd li").each(function () {
            $(this).click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                if ($(this).index() == 0) {
                    $(".box1detail,.otherbox,.evalute,.box1 h3.title").show();
                } else if ($(this).index() == 1) {
                    $(".box1detail,.otherbox").hide();
                    $(".evalute").show();
                    $(".box1 h3.title").hide();
                } else {
                    $(".box1detail,.evalute").hide();
                    $(".otherbox").show();
                    $(".box1 h3.title").hide();
                }
            });
        });

        $(".pps li:last-child").css("border-bottom", "none");
        $(document).ready(function () {
            loadLayer();

            $(".slide-fish").slide({
                titCell: ".smallImg li",
                mainCell: ".bigImg",
                effect: "left",
                autoPlay: false,
                delayTime: 200
            });
            $(".slide-fish .small-scroll").slide({
                mainCell: "ul.smallImg",
                effect: "left",
                autoPlay: false,
                autoPage: true,
                vis: 5,
                delayTime: 100
            });
            $(".slide-fish ul.smallImg").on("mouseover", "li img", function () {
                $(this).parents("li").css("border-color", "#de342f").siblings().css({"border-color": "#fff"});
                var s = $(this).parents(".small-scroll").siblings(".t2").children();
                s.children(".main_img").prop("src", $(this).parent().prop("rev"));
                s.children(".MagicZoomBigImageCont").find("img").prop("src", $(this).parent().prop("rev"));
            });
        });
        $(".slider-protj").slide({
            titCell: ".hd ul",
            mainCell: ".bd ul",
            autoPage: true,
            effect: "top",
            autoPlay: false,
            vis: 2
        });
        $(window).scroll(function () {
            var topproview = $(".pro-view").outerHeight() + $(".header").height();
            if ($(window).scrollTop() > topproview) {
                $(".pro-tab .hdd").addClass("hdfix");
            } else {
                $(".pro-tab .hdd").removeClass("hdfix");
            }
        });
    </script>

    <!--晒单图片-->
    <script type="text/javascript">
        $(".show-pic").slide({
            mainCell: ".sc_bd dl",
            autoPage: true,
            effect: "left",
            autoPlay: false,
            vis: 5,
            prevCell: ".sc_prev",
            nextCell: ".sc_next"
        });

        function inti_showpic() {
            $(".evalute-detail li").each(function () {
                $(this).find(".show-pic dd a").click(function () {
                    d = 0;
                    var img_src = $(this).attr("data-src");
                    var showpic = $(this).parents(".show-pic").siblings(".sc_picbox");
                    showpic.find(".dyimg_src").attr("src", img_src).css("transform", "rotateZ(0deg)");
                    $(this).addClass("on").parent().siblings().children().removeClass("on");
                    showpic.show().parents("li").siblings("li").children(".sc_picbox").hide();
                });
            });

            $(".a_left").click(function () {
                move(-90, $(this));
            });
            $(".a_right").click(function () {
                move(90, $(this));
            });
            $(".sc_photo,.a_up").click(function () {
                $(".sc_picbox").hide();
                $(".show-pic dd a").removeClass("on");
            });
        }

        $(function () {
            inti_showpic();
        })

        var d = 0;

        function move(s, t) {
            d += s;
            t.parent().siblings().children(".dyimg_src").css("transform", "rotateZ(" + d + "deg)");
        }


    </script>
</@layout.b>
</body>
</html>