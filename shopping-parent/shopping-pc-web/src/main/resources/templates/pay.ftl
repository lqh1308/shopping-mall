<!DOCTYPE html>
<!-- saved from url=(0090)https://demo.yunec.cn/pay.html?oid=19082353101555&pay_code=alipay&order_type=0&pay_amount= -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>支付订单 - 云EC电商系统</title>
<link rel="stylesheet" href="/view/default/css/common.css">
<link rel="stylesheet" type="text/css" href="/view/default/css/cart/cart.css"> 
<script async="" charset="utf-8" src="/view/default/js/xiankefu.js"></script><script src="/view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>
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
<a href="https://demo.yunec.cn/"><img src="./支付订单 - 云EC电商系统_files/logo.png" alt=""></a>
</div>
<div class="right cart-center">
<#if isLogin==true>
<a href="/user">${username}</a>
<a href="logout">退出</a>
<#else>
<a href="login">登录</a>
<a href="register">注册</a>
</#if>

<a href="myOrder">我的订单</a>
<a href="/user">会员中心</a>
</div>
</div>
</div>
<div class="cart-box">
<div class="nb"><div class="cart-step">
<ul>
<li class="cart1"><i></i>购物车</li>
<li class="cart2 oncart2"><i></i>确认订单</li>
<li class="cart3 oncart3"><i></i>付款</li>
<li class="cart4"><i></i>支付成功</li>
</ul>
</div>
<div class="cart3-body">
<div class="cart3-zf-box">
<input style="display:none" id="orderId" value=${orderId}></input>
<h3 style="margin-bottom: 80px;margin-top:20px;text-align: center;font-size: 20px;padding-left: 0;">支付中心</h3> 
<p style="font-size: 16px;">订单提交成功，请您尽快付款！</p>
<p style="font-size: 16px;">订单号：${orderId}</p><p style="font-size: 14px;display: none;">请您在提交订单后<b class="red">24小时</b>内完成支付，超时后订单会自动取消。</p><span class="zf-price">应付金额&nbsp;<b class="orange-bold" id="payble_amount">${totolMoney}</b><span>元</span><span style="margin-left: 20px;color: #666;display: none;">银行卡限额？<a href="javascript:void(0);" style="display: inline-block;font-size: 16px;" class="lnk" id="splitpay" data-splitpay="0">分批支付</a></span>
<div id="splitpay-mod" style="margin: auto; display: none;">
<br><br>
<form enctype="multipart/form-data" method="post" onsubmit="return checkSplit();">
<span>本次支付：<input type="text" class="input" style="width: 101px;" id="split_amount" name="pay_amount" onkeyup="onlyAmount(this)" maxlength="8" value="">
<span style="margin-left: 15px;">还需支付：<label style="display: inline-block;text-align: left;"><b style="font-weight: normal;font-size: 14px;" id="remain_amount">12036.22</b>元</label></span>
</span>

<br><br>
<div>
<input type="hidden" value="0" name="order_type">
<input type="hidden" value="0" name="iscancel" id="iscancel">
<input type="submit" class="btn" name="submit" value="确定" style="width: 80px;" id="btnsplitpay"></div>
</form>

<script type="text/javascript">
calcRemainAmt();

//本次支付
$("#split_amount").keyup(function() {
calcRemainAmt();									
});

function calcRemainAmt() {
var t = $("#split_amount");var split_amount = $.trim(t.val());
split_amount = split_amount =='' ? 0 : parseFloat(split_amount);
var	payble_amount = parseFloat($("#payble_amount").html()),
remain_amount = payble_amount-split_amount
if(remain_amount<0) {
t.val(payble_amount);
remain_amount = 0;
}
$("#remain_amount").html(remain_amount);
}

//开启/取消分批支付
$("#splitpay").click(function() {
if($(this).data('splitpay') == 1) {
$("#splitpay-mod").hide();
$(".box-code").show();
$(this).html("分批支付").data('splitpay', 0);
}
else
{
$("#splitpay-mod").show();
$(".box-code").hide();
$(this).html("不用分批").data('splitpay', 1);										
}
});

//确定分批支付
$("#btnsplitpay").click(function() {
 
$(".box-code").show();									
});		

function checkSplit() {
if($("#iscancel").val()==1) {
return true;
}

var split_amount = $.trim($("#split_amount").val());
if(split_amount =='' || split_amount ==0) {
msg("请填写本次支付金额");
return false;
}
return true;
}
</script>
</div>	</span>					 			 				
<div class="box-code">
<div id="boxcode">
<!--
<form id="alipaysubmit" name="alipaysubmit" action="https://mapi.alipay.com/gateway.do?_input_charset=utf-8" method="get">
<input type="hidden" name="_input_charset" value="utf-8">
<input type="hidden" name="extra_common_param" value="{&quot;is_split&quot;:0,&quot;order_type&quot;:0}">
<input type="hidden" name="notify_url" value="https://demo.yunec.cn/paynotify_alipay_async.html">
<input type="hidden" name="out_trade_no" value="19082353101555">
<input type="hidden" name="partner" value="2088221727483213">
<input type="hidden" name="payment_type" value="1">
<input type="hidden" name="return_url" value="https://demo.yunec.cn/paynotify_alipay.html">
<input type="hidden" name="seller_id" value="2088221727483213">
<input type="hidden" name="service" value="create_direct_pay_by_user">
<input type="hidden" name="subject" value="云EC电商系统订单">
<input type="hidden" name="total_fee" value="12036.22">
<input type="hidden" name="sign" value="e46d5993932009597ddd3ef9131228e1">
<input type="hidden" name="sign_type" value="MD5">
</form>
-->
<input type="submit" class="sub btn" id="paySubmit" value="立即支付">
</div>

<input type="hidden" id="txnTime" value="1566516246">
</div></div><div class="zhifu-box" style="border: none;border-top: dashed 1px #ddd;">
<ul class="zfb" id="paylist">
<li style="line-height: 53px;">选择付款方式</li><li>
<i class="icon-check-zf" style="display: block;"></i>
<a href="#" id="alipay" class="selected"><img src="/view/default/images/alipay.png">支付宝</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="#" id="wxpay_native"><img src="/view/default/images/wxpay_native.png">微信扫码支付</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="#" id="unionpay"><img src="/view/default/images/unionpay.png">银联支付</a>
</li>
<li>
<i class="icon-check-zf"></i>
<a href="#" id="cod"><img src="/view/default/images/cod.png">货到付款</a>
</li>
</ul>
    </div>
        </div>
</div>
</div><div class="footer">
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
<div class="box"><a href="https://demo.yunec.cn/" target="_blank">首页</a></div><div class="box"><a href="https://demo.yunec.cn/n-about.html" target="_blank">关于我们</a></div>
<div class="box"><a href="https://demo.yunec.cn/n-help.html" target="_blank">联系我们</a></div>
<div class="box"><a href="https://demo.yunec.cn/n-help.html" target="_blank">帮助中心</a></div>
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
<li class="shop"><a href="https://demo.yunec.cn/cart.html" title="购物车"><span class="cartinfo">0</span></a></li>
<li class="ecode">
<a href="https://demo.yunec.cn/pay.html?oid=19082353101555&amp;pay_code=alipay&amp;order_type=0&amp;pay_amount=#">二维码</a>
<div class="ecode-box radius">
<img src="./支付订单 - 云EC电商系统_files/code.jpg" alt="">
</div>
</li>
<li class="telnum">
<a href="https://demo.yunec.cn/pay.html?oid=19082353101555&amp;pay_code=alipay&amp;order_type=0&amp;pay_amount=#">电话号码</a>
   <div class="tel-box radius"><span>0757-00000000</span></div>
</li>
<li class="totop"><a href="https://demo.yunec.cn/pay.html?oid=19082353101555&amp;pay_code=alipay&amp;order_type=0&amp;pay_amount=#">置顶</a></li>
</ul>
</div><script src="./支付订单 - 云EC电商系统_files/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="/view/default/js/main.js" type="text/javascript"></script>
<script src="/view/default/js/cart/cart.js" type="text/javascript"></script>
<script src="/view/default/js/jquery.range.js" type="text/javascript"></script>
<link rel="stylesheet" href="/view/default/css/jquery.range.css">  
<style>.slider-container{display: inline-block; margin-left: 50px;}</style>

<script>
var s = 120;
var inter;
var order_type ='0';

$(function() {
	$(".ul-pro-box li").each(function() {
		if($(this).index() % 3 == 2) {
			$(this).css("margin-right", "0");
		}
	});

	//支付
	$("#paySubmit").on("click", function(){
		var orderId = $("#orderId").val();
		window.location.href="/alipay?payToken=" + orderId;
	});

	inter = window.setInterval(setRemainTime, 1000); //间隔函数，1秒执行 							
	$(".slide-like-pro").slide({});		
	loadLayer();

	var jrange = $('.single-slider').jRange({ 
	        from: 0, //滑动范围的最小值，数字，如0 
	        to: 5000, //滑动范围的最大值，数字，如100 
	        step: 100,//步长值，每次滑动大小 
	        scale: [0,1000,2000,3000,4000,5000],//滑动条下方的尺度标签，数组类型，如[0,50,100] 
	        format: '%s',//数值格式 
	        width: 300, //滑动条宽度 
	        showLabels: true,// 是否显示滑动条下方的尺寸标签 
	        showScale: true, //是否显示滑块上方的数值标签 
	        onstatechange: function() { 
	        	if ($("#pay_amount").prop("readonly")===false) {
	        		$("#pay_amount").val($(".single-slider").val()); 
	        	}	        	
	        }
	    }); 
    
});

function check() {
    	var pay_amount = $.trim($("#pay_amount").val());
    	if (pay_amount == '' || parseFloat(pay_amount)==0) {
    		msg("请填写充值金额");return false;
    	}
    	$(".zhifu-box").show();
    	$("#pay_amount").attr("readonly",true).css({"background-color":"transparent",'border': 'none'});
    	return true;
    	$(this).remove();
};

/*$("#paylist li a").click(function() {

})*/

//将时间减去1秒，计算天、时、分、秒 
function setRemainTime() {
if(s > 0) {
s--;
var second = Math.floor(s % 60); // 计算秒     
var minite = Math.floor((s / 60) % 60); //计算分 
$("#wxmin").html(minite);
$("#wxsec").html(second);

} else { 
window.clearInterval(inter);
$("#pay_newqrcode").show().siblings().hide();
}
}	

//获得支付二维码
function get_pay_qrcode(pay_code) {
$.getJSON("pay.html",{oid:'19082353101555',act:'get_payhtml',pay_code:pay_code},function (res) {
if (!res || res.data==null) {
msg("获取二维码失败，请刷新页面后重试，或选择其它支付方式", 5000);
}
if(res.err && res.err != '') {
msg(res.err);
if(res.url && res.url != '') {
setTimeout(function(){window.location.href = res.url;},3000);
}
else
{
setTimeout(function(){window.location.reload();},3000);
}
return;
}
 
if (res.err_code && res.err_code=='ORDERPAID') {
window.location.href = order_type =='1' ? "mymoney.html" : "payresult.html?oid=19082353101555";
} else{
$("#boxcode").html(res.data.pay_html);
if (res.data.result_code !='') {
$("#pay_newqrcode").hide().siblings().hide();
} else{
$("#pay_newqrcode").hide().siblings().show();
s = 120;inter = window.setInterval(setRemainTime, 1000);	
}					
}				
});			
};

//检测是否支付
function check_paystatus(pay_code) {
var pay_int =window.setInterval(function() {			
$.getJSON("pay.html",{oid:'19082353101555', act:'check_paystatus',pay_code:pay_code, order_type:order_type, pay_time: $("#txnTime").val()},function (res) {
/*if (res.res &&  res.res =='FAIL') {
clearInterval(pay_int);
}*/
if(res.err && res.err != '') {
//msg(res.err);
if(res.url && res.url != '') {
setTimeout(function(){window.location.href = res.url;},3000);
}

return;
}					
 
if (res==1) {
window.location.href=order_type =='1' ? "mymoney.html" : "payresult.html?oid=19082353101555";
}			
});
}, 5000);
}
</script>

<script src="/view/default/js/layer.min.js"></script><div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img src="./支付订单 - 云EC电商系统_files/icon-logo.png"><span>在线咨询</span></div><div id="XIANKEFU-PANEL" class="XIANKEFU-panel"><iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF" src="./支付订单 - 云EC电商系统_files/saved_resource.html"></iframe></div></body></html>