<!DOCTYPE html>
<!-- saved from url=(0031)https://demo.yunec.cn/cart.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>我的购物车 - 云EC电商系统</title>
<link rel="stylesheet" href="/view/default/css/common.css">
<link rel="stylesheet" href="/view/default/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="/view/default/css/cart/cart.css">		
<style id="XIANKEFU-STYLE">.XIANKEFU-bar{position: fixed; bottom: 50px; right: 50px; font-size: 16px; cursor: pointer; text-overflow: ellipsis; overflow: hidden;  background-color: #56b7c7; background-image: linear-gradient(to right,#56b7c7,#67D0AF); color: #fff;}
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
}</style><link rel="stylesheet" href="/view/default/css/layer.css" id="layui_layer_skinlayercss" style=""></head>

<body>
<div class="ny-header">
<div class="nb">
<div class="logo">
<!--<a href="/"><img src="/view/default/images/logo.png" alt=""></a>-->
</div>
<div class="right cart-center"><a href="user/toUserPage" class="red">流火如夏</a>&nbsp;&nbsp;<a href="https://demo.yunec.cn/user.html?act=logout">退出</a> 
<a href="/toMyOrder">我的订单</a>
<a href="https://demo.yunec.cn/help.html">客户服务</a>
</div>
</div>
</div>
<div class="cart-box">
<div class="nb">
<div class="cart-step">
<ul>
<li class="cart1"><i></i>购物车</li>
<li class="cart2 "><i></i>确认订单</li>
<li class="cart3"><i></i>付款</li>
<li class="cart4"><i></i>支付成功</li>
</ul>
</div>
<form>
<div class="cart-detail">
<div class="cart-thead">
<div class="cart-th cart-one">
<label><input type="checkbox" id="btncheckall" onclick="checkall(this,&#39;#list&#39;);" class="btn-checkall">&nbsp;全选</label>
</div>
<div class="cart-th cart-two">
商品信息
</div>
<div class="cart-th cart-three">
单价（元）
</div>
<div class="cart-th cart-four">
数量
</div>
<div class="cart-th cart-five">
小计（元）
</div>
<div class="cart-th cart-six">
操作
</div>
</div>
<div class="cart-tbody" id="list"> </div>
</div>
<div class="account">
<div class="left">
<div class="check-all">
    <input type="checkbox" onclick="checkall(this,&#39;#list&#39;);" class="btn-checkall">&nbsp;全选
    </div>
         <a href="javascript:void(0);" id="removebatch">删除选中商品</a>
</div>
<div class="right">
<div class="r-lside">
<div class="yunfei"><p class="yixuan">已选商品<span class="orange-bold" id="selectnum">0</span>件</p><p>总价：<span class="orange-bold big">￥<b id="total">0.00</b></span></p></div>							
</div>
<div class="r-rside">
<a href="javascript:void(0);" onclick="gotoOrder();" class="btn-jiesuan">去结算</a>
</div>
</div>					
</div>
</form>
<div class="tab-pro-like" style="display: none;">
<div class="slide-like-pro">
<div class="hd">
<ul>
<li style="border-left: none;" class="on"><a href="https://demo.yunec.cn/cart.html#">特惠商品</a></li>
<li><a href="https://demo.yunec.cn/cart.html#">猜您喜欢</a></li>
</ul>
</div>
<div class="bd">
<div class="like-tehui">
<ul class="ul-pro-box">
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="/view/default/images/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li style="margin-right: 0px;">
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li style="margin-right: 0px;">
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	
                    	
                    </ul>
</div>
<div class="like-guess" style="display: none;">
<ul class="ul-pro-box">
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li style="margin-right: 0px;">
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li>
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	<li style="margin-right: 0px;">
                    		<div class="probox">
                    			<div class="top-pic">
                    				<a href="https://demo.yunec.cn/cart.html#">
                    					<img src="./我的购物车 - 云EC电商系统_files/jingpin.jpg" alt="">
                    					<i class="icon-look"></i>
                    					<i class="mask"></i>
                    					<p>仟湖龙鱼-坦克紫艳</p>
                    				</a>
                    			</div>
                    			<div class="center">
                    				<h3><a href="https://demo.yunec.cn/cart.html#">仟湖龙鱼-坦克紫艳</a><span>￥8500.00</span></h3>
                    				<div class="word elli">
                    					<p>仟湖精品即使那个蓝色短裤--董事局副科级大家仟湖精品即使那个蓝色短裤--董事局副科级大家</p>
                    				</div>
                    			</div>
                    			
                    		</div>
                    		<div class="bottom">
                    				<a href="https://demo.yunec.cn/cart.html#" class="buy">立即购买</a><i class="line"></i>
                    				<a href="https://demo.yunec.cn/cart.html#" class="addcart">加入购物车</a>
                    			</div>
                    	</li>
                    	
                    	
                    </ul>
</div>
</div>
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
<div class="box"><a href="https://demo.yunec.cn/" target="_blank">首页</a></div><div class="box"><a href="https://demo.yunec.cn/n-help.html" target="_blank">帮助中心</a></div>
</div><div class="copyright">
<p>Copy@2015-2019&nbsp;<a href="http://www.yunec.cn/" target="_blank">云EC电商系统</a> <a href="http://www.yunec.cn/" target="_blank">www.yunec.cn</a>&nbsp;All Rights Reserved 粤ICP备16042138号-1</p></div>
</div>
</div>
<p style="display: none;"></p>
<script async="" charset="utf-8" src="/view/default/js/xiankefu.js"></script><script>
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
<a href="https://demo.yunec.cn/cart.html#">二维码</a>
<div class="ecode-box radius">
<img src="/view/default/images/code.jpg" alt="">
</div>
</li>
<li class="telnum">
<a href="https://demo.yunec.cn/cart.html#">电话号码</a>
   <div class="tel-box radius"><span>0757-00000000</span></div>
</li>
<li class="totop"><a href="https://demo.yunec.cn/cart.html#">置顶</a></li>
</ul>
</div> 
<script src="/view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>		
<script src="/view/default/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>				
<script src="/view/default/js/main.js" type="text/javascript"></script>
<script src="/view/default/js/cart/cart.js" type="text/javascript"></script><div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img src="/view/default/images/icon-logo.png"><span>在线咨询</span></div><div id="XIANKEFU-PANEL" class="XIANKEFU-panel"><iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF" src="./我的购物车 - 云EC电商系统_files/saved_resource.html"></iframe></div>
<script src="/view/default/js/jquery.cookie.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
loadLayer();
$(".ul-pro-box li").each(function(){
if($(this).index()%3==2){
$(this).css("margin-right","0");
}		
});
$(".slide-like-pro").slide({});

sumShopping();
setall(".btn-checkall", "#list");
});
</script>		


<script src="/view/default/js/layer.min.js"></script></body></html>