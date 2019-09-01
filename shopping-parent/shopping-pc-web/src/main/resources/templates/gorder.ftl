<!DOCTYPE html>
<!-- saved from url=(0033)https://demo.yunec.cn/order.html# -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>订单结算 - 云EC电商系统</title>
<meta name="keywords" content="云EC,云EC电商系统,商城系统,电商系统,免费开源,PHP电商系统,网店系统,PHP商城系统,独立网店,电子商务软件">
<meta name="description" content="云EC电商系统是云迈旗下的免费开源电商系统，提供灵活的扩展特性、高度自动化与智能化、创新的管理模式和强大的自定义模块，让电商用户零成本拥有安全、高效、专业的电商系统。">
<link rel="stylesheet" href="/view/default/css/common.css">
<link rel="stylesheet" href="/view/default/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="/view/default/css/cart/cart.css">		
<link rel="stylesheet" href="/view/default/css/quan.css">
<script async="" charset="utf-8" src="/view/default/js/xiankefu.js"></script><script src="/view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/view/default/js/main.js" type="text/javascript"></script>
<link rel="stylesheet" href="/view/default/css/layer.css" id="layui_layer_skinlayercss" style=""><style id="XIANKEFU-STYLE">.XIANKEFU-bar{position: fixed; bottom: 50px; right: 50px; font-size: 16px; cursor: pointer; text-overflow: ellipsis; overflow: hidden;  background-color: #56b7c7; background-image: linear-gradient(to right,#56b7c7,#67D0AF); color: #fff;}
.XIANKEFU-bar > img{position: relative; top: -2px; width: 20px; height: 20px; display: inline-block; vertical-align: middle;}
.XIANKEFU-bar-style1{height: 60px; line-height: 60px; max-width: 200px; padding: 0 20px; border-radius: 30px; white-space: nowrap;}
.XIANKEFU-bar-style1 > span{padding-left: 10px;}
.XIANKEFU-bar-style2{width: 80px; height: 60px; padding: 20px 10px; border-radius: 50%; text-align: center; white-space: nowrap;}
.XIANKEFU-bar-style2 > img{margin: 6px 0;}
.XIANKEFU-bar-style2 > span{display: block; text-overflow: ellipsis; overflow: hidden;}
.XIANKEFU-bar-style3{width: 18px; padding: 15px; text-align: center; border-radius: 30px;}
.XIANKEFU-bar-style3 > img{margin: 0 0 5px;}
.XIANKEFU-bar-style3 > span{display: block; line-height: 18px;}
.XIANKEFU-panel{visibility: hidden; position: fixed; bottom: 0; right: 50px; z-index: -1; width: 490px; height: 490px; margin: 0; padding: 0; overflow: hidden; border: 1px solid #B2B2B2\9; box-shadow: 0 0 3px 3px rgba(23,94,103,.05); border-radius: 2px;}
.XIANKEFU-panel-show{visibility: visible; z-index: 2147483647;}
.XIANKEFU-panel iframe{display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; margin: 0; padding: 0;}
.XIANKEFU-panel-show iframe{display: block;}
@media screen and (max-width: 768px) {
}</style></head>

<body>
<div class="ny-header">
<div class="nb">
<div class="logo">
<!--<a href="https://demo.yunec.cn/"><img src="./订单结算 - 云EC电商系统_files/logo.png" alt=""></a>-->
</div>
<div class="right cart-center"><a href="https://demo.yunec.cn/user.html" class="red">流火如夏</a>&nbsp;&nbsp;<a href="https://demo.yunec.cn/user.html?act=logout">退出</a> 
<a href="/myOrder">我的订单</a>
<a href="https://demo.yunec.cn/help.html">客户服务</a>
</div>
</div>
</div>
<div class="cart-box">
<div class="nb">
<div class="cart-step">
<ul>
<li class="cart1"><i></i>购物车</li>
<li class="cart2 oncart2"><i></i>确认订单</li>
<li class="cart3"><i></i>付款</li>
<li class="cart4"><i></i>支付成功</li>
</ul>
</div> 
<!--
<div class="anonlogin">
<div>
<h3 style="margin-bottom: 10px;text-align: left;color: #007cc3;font-size: 20px;">绑定手机号码
</h3>
</div>
<div class="input-box">
<label class="icon-phone" for="loginmobile"></label>
<input type="text" id="loginmobile" value="" placeholder="手机号码" maxlength="11" autocomplete="off">
</div>
<div class="input-box">
<label class="icon-smscode" for="smscode"></label>
<input type="text" name="smscode" id="smscode" maxlength="8" value="" placeholder="短信验证码" onkeyup="onlyNum(this);" style="width: 52%;">	
<input type="button" class="btn" id="btnSendCode" data-mobileid="loginmobile" data-act="user_bind
" value="获取验证码">	
</div>

<input type="button" class="btn" id="btnlogin" value="绑定
">	
<span class="formtip"><i></i><label></label></span>
</div>
-->
<div class="add-deliver">
<div class="cart-title">
<h3><span>收货人信息</span></h3>						
</div>
<div class="sh-address">
<ul>

<!-- 地址信息 -->
<#list addresses as address>
	<li class="other-add <#if address.isDefault==1>default-add</#if>" id=${address.id} data-cityid="430200" >
	<div class="add-box ">
	<span class="remove vivi-blue" onclick="removeAddr(${address.id});">X</span>
	<div class="name-add"><span class="name">${address.username}</span><span class="add-rside"></span></div>
	<div class="elli add-detail">
	<p title="${address.location} ${address.detailAddress}">${address.location} ${address.detailAddress}</p>
	</div>
	<div><span class="moblie">${address.phone}</span><span style="margin-left: 30px;"><#if address.isDefault==1>默认地址</#if></span>
	<a href="javascript:void(0);" onclick="editAddr(${address.id});" class="chang-default change vivi-blue">修改</a>
	</div>																			
	</div>
	<i class="icon-check"></i>
	</li>
</#list>

<li class="add-add">
<div class="add-box add-box-center" onclick="addAddr();">
<!--<a href="https://demo.yunec.cn/order.html#">-->
<i class="icon-add-add"></i>
添加新地址
</a>
</div>
</li>
</ul>						
</div>
</div><div class="goods-infor">
<div class="cart-title">
<h3><span>商品信息</span><a href="/toCart" class="vivi-blue">返回购物车修改</a></h3>
</div>
<div class="goods-table">
<div class="goods-thead">
<div class="col col1">
商品
</div>
<div class="col col3">
单价
</div>
<div class="col col4">
数量
</div>
<div class="col col5">
小计
</div>
</div>

<div class="goods-tbody">
<!--购物车信息-->
<#list carts as cart>
    <div class="goodinfor" id="${cart.goodId}">
	<div class="col col1 goods-title-pic">
	<a href="#"><img src="${cart.goodLogoUrl}" width="60" height="60"></a>
	<div class="goods-describ elli">
	<p><a href="#">${cart.goodName}</a></p>
	</div>
	</div>
	<div class="col col3 goods-price">${cart.showPrice}</div>
	<div class="col col4 good-num">${cart.purchaseNum}</div>
	<div class="col col5 orange-bold xiaoji" style="border-bottom: none;">${cart.totalPrice}</div>
	</div>
</#list>
							
</div>						
</div>
</div>

<div class="style-zhifu">
<div class="cart-title">
<h3><span>支付方式</span></h3>
</div>
<div class="zhifu-box">
<div class="yue"><span><input type="checkbox" id="userbalance" disabled="disabled">&nbsp;使用余额</span><input type="text" maxlength="9" id="balance" onkeyup="onlyAmount(this,2);" value="" readonly="readonly"><span class="yeuse">（我的余额：<b class="orange-bold">0.00</b>元）</span>。<br><br><p>							
<span><input type="checkbox" id="userpoint" disabled="disabled">&nbsp;使用积分</span><input type="text" maxlength="9" id="point" onkeyup="onlyNum(this);" value="" readonly="readonly">
<span class="yeuse">（我的积分：<b class="orange-bold">0</b>个）</span>
</p><span id="setpaypwd">为保障您的资金安全，请先<a href="javascript:void(0);" class="vivi-blue"> 设置支付密码</a></span></div>						
</div>
<div class="zhifu-box" style="">
<ul class="zfb" id="paylist"><li>
<i class="icon-check-zf"></i>
<a href="javascript:void(0);" id="alipay" data-type="0"><img src="/view/default/images/alipay.png">支付宝</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="javascript:void(0);" id="wxpay_native" data-type="1"><img src="/view/default/images/wxpay_native.png">微信扫码支付</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="javascript:void(0);" id="unionpay" data-type="3"><img src="/view/default/images/unionpay.png">银联支付</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="javascript:void(0);" id="cod" data-type="4"><img src="/view/default/images/cod.png">货到付款</a>
</li>
		
</ul>
</div>
</div><div class="style-zhifu">
<div class="cart-title">
<h3><span>配送方式</span></h3>
</div>
<div class="zhifu-box">						
<ul class="zfb" id="expresslist"><li><i class="icon-check-zf" style="display: block;"></i><a href="javascript:void(0);" id="0" class="selected">商家配送</a></li></ul>						
</div>
</div><div class="style-zhifu order-invoice">
<div class="cart-title">
<h3><span>发票信息</span></h3>
</div>
<div class="zhifu-box">
<div class="item">
<div class="label">
<ul class="zfb" id="is_invoice">
<li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="1">需要发票</a></li>
<li><i class="icon-check-zf" style="display: block;"></i><a href="javascript:void(0);" id="0" class="selected">不需要发票</a></li>
</ul>
</div>
</div>
<div id="invoiceinfo" style="display: none;">
<div class="item">
<span class="label fl">发票抬头：</span>
<div class="fl">
<ul class="zfb" id="invoice_tite_list">
<li><i class="icon-check-zf" style="display: block"></i><a href="javascript:void(0);" id="1" class="selected">个人</a></li>
<li class="company"><i class="icon-check-zf"></i><a id="2"><input type="text" placeholder="请填写公司发票抬头" maxlength="200"></a></li>
</ul>
</div>
</div>	
<div class="item">
<span class="label fl">发票内容：</span>
<div class="fl">
<ul class="zfb" id="invoice_con"><li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="明细
">明细
</a></li>
<li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="办公用品
">办公用品
</a></li>
<li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="电脑配件
">电脑配件
</a></li>
<li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="食品
">食品
</a></li>
<li><i class="icon-check-zf"></i><a href="javascript:void(0);" id="生活用品
">生活用品
</a></li>
</ul>
</div>
</div>
</div>
</div>
</div><div class="discount">
<div class="h3dy">
<h3 class="yhdyong">使用优惠券<sup id="couponnum">2</sup><i class="icon-arrow"></i><span id="couponselected" style="display: inline-block;">已选<b class="orange-bold"> 1</b> 张</span></h3> 
</div>
<div class="youhui-box couponlist" id="couponlist">

<div class="cp-it  selected" id="13" data-cid="1" data-amount="20"><div class="hd"><span class="amount">￥<b>20</b></span><span class="amount_reached">满 100元 可用</span><span class="date">2018.10.15-2022.09.30</span></div><div class="bt"><div class="option"><span><label>限品类</label>：<b class="tit" title="十一活动100-20">十一活动100-20</b></span><span><label>限平台</label>：全平台</span><span><label>限等级</label>：所有<i class="tip-down"></i></span><span><label>券编号</label>：10000013</span></div></div><i class="icon-check-zf"></i></div><div class="cp-it " id="14" data-cid="2" data-amount="1"><div class="hd"><span class="amount">￥<b>1</b></span><span class="amount_reached">满 10元 可用</span><span class="date">2018.10.15-2022.12.31</span></div><div class="bt"><div class="option"><span><label>限品类</label>：<b class="tit" title="满10减1">满10减1</b></span><span><label>限平台</label>：全平台</span><span><label>限等级</label>：所有<i class="tip-down"></i></span><span><label>券编号</label>：20000014</span></div></div><i class="icon-check-zf"></i></div></div>
</div>
<div class="fare-result">
<div class="cart-title"><h3><span>结算信息</span></h3></div>
<div class="result-box">
<ul>
<li class="first">
<div class="calu-box">
<p class="slivergrey">
<span><b class="orange-bold">${cartsNum}</b> 件商品 总计：</span>
<span class="txtmoney">￥<b>${cartsTotalPrice}</b></span>
</p>
<input style="display:none" id="cartTotalPrice" value=${cartsTotalPrice}></input>
<p class="slivergrey"><span>运费：</span><span class="txtmoney">￥<b id="expfee">0.00</b></span></p>							
<p class="slivergrey"><span>优惠券抵用：</span><span class="txtmoney">￥<b id="coupon-offset">-20</b></span></p></div>
</li>
<li>
<div style="width: 400px; float: left;font-size: 14px;">
<label class="list-name" for="leavemess">留言：</label>
<textarea style="width: 90%; margin-top:6px;height: 50px;vertical-align: top;" id="leavemess" maxlength="200"></textarea>
</div>
<div class="lside">
<p class="save-passw"><span class="slivergrey">输入支付密码：</span><input type="password" id="cbkpaypwd"></p>
</div>
<div class="rside">
<div class="lside">
<p><span class="slivergrey">应付金额：</span><span class="orange-bold big">￥<b id="payAmount">${cartsTotalPrice}</b></span></p>
<p class="vivi-blue">提交订单后尽快支付，商品才不会被人抢走哦！</p>
</div>
<a href="javascript:void(0);" class="btn-jiesuan">提交订单</a>
</div>
</li>
</ul>
</div>
</div>			
</div>
</div>

 <div class="footer">
<div class="nb">
<div class="promise"><ul><li><div class="promise-box"><em class="yec-icon-qg yec-icon"></em><div class="word"><h3>正品保障</h3><p>正品行货 放心选购</p></div></div></li><li><div class="promise-box"><em class="yec-icon-fare yec-icon"></em><div class="word"><h3>满99包邮</h3><p>满99 免运费</p></div></div></li><li><div class="promise-box"><em class="yec-icon-cs yec-icon"></em><div class="word"><h3>售后无忧</h3><p>7天无理由退货</p></div></div></li><li><div class="promise-box"><em class="yec-icon-help yec-icon"></em><div class="word"><h3>帮助中心</h3><p>您的购物指南</p></div></div></li></ul></div><div class="foot-navson">
<div class="navsonbox"><dl>
<dt><a href="https://demo.yunec.cn/n-DDSXn.html" target="_blank">购物指南</a></dt><dd><a href="https://demo.yunec.cn/n-67Azk.html" target="_blank">找回密码</a></dd>
<dd><a href="https://demo.yunec.cn/n-77Fik.html" target="_blank">搜索商品和店铺</a></dd>
<dd><a href="https://demo.yunec.cn/n-jqfec.html" target="_blank">注册会员</a></dd>
</dl>
<dl>
<dt><a href="https://demo.yunec.cn/n-x4vHY.html" target="_blank">账户和会员</a></dt><dd><a href="https://demo.yunec.cn/n-point.html" target="_blank">积分规则</a></dd>
</dl>
<dl>
<dt><a href="https://demo.yunec.cn/n-jqfBc.html" target="_blank">新手指南</a></dt><dd><a href="https://demo.yunec.cn/n-y4Clq.html" target="_blank">注册登录</a></dd>
<dd><a href="https://demo.yunec.cn/n-NRlFz.html" target="_blank">选购商品</a></dd>
<dd><a href="https://demo.yunec.cn/n-B1Y6p.html" target="_blank">订单支付</a></dd>
<dd><a href="https://demo.yunec.cn/n-16Rqc.html" target="_blank">收货退款</a></dd>
</dl>
<dl>
<dt><a href="https://demo.yunec.cn/n-8DJJy.html" target="_blank">支付方式</a></dt><dd><a href="https://demo.yunec.cn/n-gjsuL.html" target="_blank">网上支付</a></dd>
<dd><a href="https://demo.yunec.cn/n-16R6c.html" target="_blank">银行转账</a></dd>
</dl>
<dl>
<dt><a href="https://demo.yunec.cn/n-DDSHn.html" target="_blank">配送方式</a></dt><dd><a href="https://demo.yunec.cn/n-9xNEl.html" target="_blank">配送服务查询</a></dd>
<dd><a href="https://demo.yunec.cn/n-OQITC.html" target="_blank">配送费收取标准</a></dd>
</dl>
</div>
<div class="foot-service">
<p>客服电话</p>
<div class="tel">0757-00000000</div>
<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=153492506&amp;site=qq&amp;menu=yes" target="_blank" class="btn-service">在线客服</a>
</div>
</div>
<div class="foot-sortnav">
<div class="box"><a href="https://demo.yunec.cn/" target="_blank">首页</a></div><div class="box"><a href="https://demo.yunec.cn/n-help.html" target="_blank">帮助中心</a></div>
</div><div class="copyright">
<p>Copy@2015-2019&nbsp;<a href="http://www.yunec.cn/" target="_blank">云EC电商系统</a> <a href="http://www.yunec.cn/" target="_blank">www.yunec.cn</a>&nbsp;All Rights Reserved 粤ICP备16042138号-1</p></div>
</div>
</div>
<p style="display: none;"></p>
<script>
  (function(w, d, s, g, o) {
    var x = document.createElement(s)
    ,s = document.getElementsByTagName(s)[0];
    w[g] = o;
    x.async = true;
    x.charset = 'utf-8';
    x.src = 'https://cdn.xiankefu.com/dist/xiankefu.js';
    s.parentNode.insertBefore(x, s);
  })(window, document, 'script', 'XIANKEFU_GLOBAL', {
    bid: '2e0f758b6ebc4dcb2fba6d78818204ad'
  });
</script><div class="celan-float">
<ul>
<li class="shop"><a href="https://demo.yunec.cn/cart.html" title="购物车"><span class="cartinfo">22</span></a></li>
<li class="ecode">
<a href="https://demo.yunec.cn/order.html#">二维码</a>
<div class="ecode-box radius">
<img src="/view/default/images/code.jpg" alt="">
</div>
</li>
<li class="telnum">
<a href="https://demo.yunec.cn/order.html#">电话号码</a>
   <div class="tel-box radius"><span>0757-00000000</span></div>
</li>
<li class="totop"><a href="https://demo.yunec.cn/order.html#">置顶</a></li>
</ul>
</div> 
<div class="edit-address modbox" style="display: none;">
<div class="edit-box">
<h3><span id="edit-box-title">新增配送信息</span><i class="close-modbox"></i></h3>
<div class="edit-form">
<ul>
<li>
<label><i>*</i>收货人：</label>
<input type="text" id="sh-name" maxlength="20" class="s-length">
</li>
<li>
<label><i>*</i>手机号码：</label>
<input type="text" id="sh-phone" maxlength="11" class="s-length">
</li>
<li>
<label>固定电话：</label>
<input type="text" id="sh-tel" maxlength="20" class="s-length">
</li>
<li style="min-height: 25px;">
<label style="width: 75px; float: left;"><i>*</i>所在地区：</label>
<!--
<div class="deliver" style="float: left;">								
<div id="store-selector">
<div class="text"><div title="请选择">- 请选择 -</div><b></b><input type="hidden" id="district"></div>                 
<div onclick="$('#store-selector').removeClass('hover')" class="close"></div>
</div>
<div id="store-prompt"><strong></strong></div>
</div>
-->
<div id="distpicker">
  <select id="province"></select>
  <select id="city"></select>
  <select id="district"></select>
</div>
</li>
<li style="clear: both;">
<label><i>*</i>详细地址：</label>
<input type="text" id="sh-address" maxlength="30" class="l-length">
</li>
</ul>
<div class="setting">
        <input type="checkbox" value="1" id="isdefault">&nbsp;&nbsp;设为默认地址
         </div>
         <input type="hidden" id="id" value="">
         <button class="btn-save" id="saveconsignee" onclick="saveconsignee();">保存</button>
</div>							
</div>
</div>
<div id="edit-paypwd" class="modbox" style="display: none;">
<h3>设置支付密码<i class="close-modbox"></i></h3>
<div>
<p><label>手机：</label><input type="text" id="mobile" readonly="readonly" value="" style="width: 93px; border: none;"><input type="button" value="获取验证码" id="sendcode" data-mobileid="mobile" class="btn" onclick="sendSms(this, &#39;sms_setpaypwd&#39;);"></p>
<p><label>手机验证码：</label><input type="text" value="" id="authcode" maxlength="8" class="input" onkeyup="onlyNum(this);"></p>
<p><label>设置支付密码：</label><input type="password" value="" id="paypwd" maxlength="16" class="input"><span class="tip">限数字和字母，6到16个字符</span></p>
<p><label>再输支付密码：</label><input type="password" value="" id="repaypwd" maxlength="16" class="input"></p>
<a href="javascript:void(0);" onclick="editPaypwd();" class="btn" style="margin-left: 94px;margin-top: 20px">提交</a>
</div>
</div>
<div id="mask" style="display: none;"></div>
<input type="hidden" id="user_mobile" value="">
<link rel="stylesheet" href="/view/default/css/location.css">
<script src="/view/default/js/distpicker.data.js" type="text/javascript"></script>
<script src="/view/default/js/distpicker.js" type="text/javascript"></script>
<script src="/view/default/js/gorder/gorder.js" type="text/javascript"></script>
<script src="/view/default/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="/view/default/js/users.js" type="text/javascript"></script>
<script src="/view/default/js/cart/cart.js" type="text/javascript"></script>
<script src="/view/default/js/location.js" type="text/javascript"></script>
<script src="/view/default/js/layer.min.js"></script><script src="/view/default/js/layer.min.js"></script><div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img src="/view/default/images/icon-logo.png"><span>在线咨询</span></div><div id="XIANKEFU-PANEL" class="XIANKEFU-panel"><iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF" src="./订单结算 - 云EC电商系统_files/saved_resource.html"></iframe></div></body></html>