<!DOCTYPE html>
<!-- saved from url=(0022)https://demo.yunec.cn/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>云EC电商系统</title>
<meta name="keywords" content="云EC,云EC电商系统,商城系统,电商系统,免费开源,PHP电商系统,网店系统,PHP商城系统,独立网店,电子商务软件">
<meta name="description" content="云EC电商系统是云迈旗下的免费开源电商系统，提供灵活的扩展特性、高度自动化与智能化、创新的管理模式和强大的自定义模块，让电商用户零成本拥有安全、高效、专业的电商系统。">
<link rel="stylesheet" href="view/default/css/index/iconfont.css">
<link rel="stylesheet" href="view/default/css/common.css">
<link rel="stylesheet" href="view/default/css/index/index.css">
<style>
.nav .menu-mainnav{display: block;}
.slidebanner .bd ul li{display:none}
.slidebanner .bd ul li:first-child{display:block}
</style>
<link rel="stylesheet" href="view/default/css/layer.css" id="layui_layer_skinlayercss" style=""><style id="XIANKEFU-STYLE">.XIANKEFU-bar{position: fixed; bottom: 50px; right: 50px; font-size: 16px; cursor: pointer; text-overflow: ellipsis; overflow: hidden;  background-color: #56b7c7; background-image: linear-gradient(to right,#56b7c7,#67D0AF); color: #fff;}
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
<body class="greybg"><div class="header">
<div class="head-top">
<div class="nb">
<span style="color:#e01;font-size:14px;">演示站，请勿购物！！&nbsp; 前台账号 yunec&nbsp; &nbsp; <span style="color: rgb(238, 0, 17); font-size: 14px;">密码&nbsp;</span>666666&nbsp; &nbsp;后台地址：&nbsp;<a href="https://demo.yunec.cn/admin.html" target="_self" title="https://demo.yunec.cn/admin.html">https://demo.yunec.cn/admin.html</a></span><div class="rside" style="float:right">
<ul class="head-ul">

<#if isLogin==true>
<li><a href="user/toUserPage">${username}</a></li>
<li><a href="logout">退出</a></li>
<#else>
<li><a href="login">登录</a></li>
<li><a href="register">注册</a></li>
</#if>

<li><a href="toMyOrder">我的订单</a></li>
<li><a href="user/toUserPage">会员中心</a></li>
</ul>
</div>
</div>
</div>
<div class="head-bot">
<div class="nb">
<div class="web-title-container">
<!--<a href="https://demo.yunec.cn/index.html" class="logo"><img src="./view/default/images/logo.png" alt=""></a>-->
<div class="searchbox">
<form name="search" action="https://demo.yunec.cn/list.html" method="get">
<input type="search" name="word" id="word" value="" placeholder="请输入关键词" class="txt-search">
<input type="submit" value="搜  索" id="btn-search" class="btn-submit">
<input type="hidden" name="action" value="list">
</form>
</div>
<div class="cartbox">
<div class="cartbtn">
<a href="/toCart" class="radv-nav"><span>购物车</span>(<span class="cartinfo">0</span>)</a>
</div>
<div class="cart-slidedownbox">
<h3>最近加入</h3>
<ul class="cart-slidedown" id="cart-list"></ul>
<div class="sum-box">
<a class="slidecart-js" href="https://demo.yunec.cn/cart.html">立即结算(<span class="cartinfo">0</span>)</a>
<div class="sum">合计：￥<span class="red" id="cart-total">0.00</span></div>
<div class="check">
<p>共<span class="red cartinfo">0</span>件商品</p>
</div>
</div>           
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="nav">
<div class="nav-classify nav-classifyopaity">
<h3 class="nav-all-btn">全部分类</h3>
<ul class="menu-mainnav" style="height: 450px;">						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/bT5hC.html" target="_blank">家具家饰</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/koEwa.html" target="_blank">家具1<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/NRlBt.html" target="_blank">ccc30000</a><a href="https://demo.yunec.cn/fW3XU.html" target="_blank">床</a><a href="https://demo.yunec.cn/QTn0G.html" target="_blank">高低床</a><a href="https://demo.yunec.cn/FMPwq.html" target="_blank">餐桌</a><a href="https://demo.yunec.cn/0qFkS.html" target="_blank">床垫</a><a href="https://demo.yunec.cn/y4Cpf.html" target="_blank">茶几</a><a href="https://demo.yunec.cn/B1Y2f.html" target="_blank">电视柜</a><a href="https://demo.yunec.cn/8DJ6p.html" target="_blank">衣柜</a><a href="https://demo.yunec.cn/8DJ6q.html" target="_blank">鞋柜</a><a href="https://demo.yunec.cn/maCWU.html" target="_blank">椅凳</a><a href="https://demo.yunec.cn/iZENU.html" target="_blank">书桌</a><a href="https://demo.yunec.cn/QTn4F.html" target="_blank">电脑桌</a><a href="https://demo.yunec.cn/ZZmGP.html" target="_blank">坐具</a><a href="https://demo.yunec.cn/elAOG.html" target="_blank">现代简约</a><a href="https://demo.yunec.cn/iZERO.html" target="_blank">美式家具</a><a href="https://demo.yunec.cn/IMfIz.html" target="_blank">北欧家具</a><a href="https://demo.yunec.cn/TUpO6.html" target="_blank">中式家具</a><a href="https://demo.yunec.cn/knEgR.html" target="_blank">儿童家具</a><a href="https://demo.yunec.cn/GMUG2.html" target="_blank">真皮沙发</a><a href="https://demo.yunec.cn/0qFoX.html" target="_blank">布艺沙发</a><a href="https://demo.yunec.cn/VdkW2.html" target="_blank">皮床</a><a href="https://demo.yunec.cn/ow0lf.html" target="_blank">实木床</a><a href="https://demo.yunec.cn/77Vqg.html" target="_blank">儿童床</a><a href="https://demo.yunec.cn/H4mPw.html" target="_blank">乳胶床垫</a><a href="https://demo.yunec.cn/Xf2f0.html" target="_blank">儿童学习桌</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/cj6hY.html" target="_blank">家饰<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/B1YBe.html" target="_blank">窗帘</a><a href="https://demo.yunec.cn/B1YBf.html" target="_blank">地毯</a><a href="https://demo.yunec.cn/ryEjV.html" target="_blank">沙发垫</a><a href="https://demo.yunec.cn/qf3de.html" target="_blank">十字绣</a><a href="https://demo.yunec.cn/Xf2f5.html" target="_blank">桌布</a><a href="https://demo.yunec.cn/bS5d5.html" target="_blank">地垫</a><a href="https://demo.yunec.cn/5ATvt.html" target="_blank">抱枕</a><a href="https://demo.yunec.cn/WMkaF.html" target="_blank">坐垫</a><a href="https://demo.yunec.cn/OQYTy.html" target="_blank">飘窗垫</a><a href="https://demo.yunec.cn/77VyY.html" target="_blank">门帘</a><a href="https://demo.yunec.cn/ryEnT.html" target="_blank">缝纫机</a><a href="https://demo.yunec.cn/JBYMv.html" target="_blank">洗衣机罩</a><a href="https://demo.yunec.cn/y4C1h.html" target="_blank">卷帘</a><a href="https://demo.yunec.cn/QTnHC.html" target="_blank">珠帘</a><a href="https://demo.yunec.cn/0qFwX.html" target="_blank">沙发巾</a><a href="https://demo.yunec.cn/RHwM7.html" target="_blank">靠垫</a><a href="https://demo.yunec.cn/GMUO5.html" target="_blank">空调罩</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/MAof8.html" target="_blank">厨具<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/IMfQ6.html" target="_blank">烹饪锅具</a><a href="https://demo.yunec.cn/YOxTA.html" target="_blank">刀剪菜板</a><a href="https://demo.yunec.cn/UXgk6.html" target="_blank">厨房配件</a><a href="https://demo.yunec.cn/qf3lb.html" target="_blank">水具酒具</a><a href="https://demo.yunec.cn/0qF0U.html" target="_blank">餐具</a><a href="https://demo.yunec.cn/8DJNp.html" target="_blank">茶具/咖啡具</a><a href="https://demo.yunec.cn/TUpa8.html" target="_blank">保温杯</a></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/XgmjD.html" target="_blank">运动户外</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/9xdMe.html" target="_blank">运动<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/ZZmWO.html" target="_blank">AJ1禁穿</a><a href="https://demo.yunec.cn/RHwQA.html" target="_blank">AJ12病倒</a><a href="https://demo.yunec.cn/46YGf.html" target="_blank">Yeezy 350</a><a href="https://demo.yunec.cn/aNloJ.html" target="_blank">Alpha Bounce</a><a href="https://demo.yunec.cn/EJiEt.html" target="_blank">AJ30</a><a href="https://demo.yunec.cn/FMPHt.html" target="_blank">Stan Smith</a><a href="https://demo.yunec.cn/KLXZ4.html" target="_blank">大Air皮蓬</a><a href="https://demo.yunec.cn/DDiXf.html" target="_blank">KD9</a><a href="https://demo.yunec.cn/nrynH.html" target="_blank">Kayano23</a><a href="https://demo.yunec.cn/FMPHx.html" target="_blank">Sock Dart</a><a href="https://demo.yunec.cn/JBYU0.html" target="_blank">Hyperdunk</a><a href="https://demo.yunec.cn/iZEhW.html" target="_blank">耐克</a><a href="https://demo.yunec.cn/SKhY2.html" target="_blank">阿迪达斯</a><a href="https://demo.yunec.cn/CzOXp.html" target="_blank">New Balance</a><a href="https://demo.yunec.cn/16R6R.html" target="_blank">亚瑟士</a><a href="https://demo.yunec.cn/QTnTA.html" target="_blank">Under Armour</a><a href="https://demo.yunec.cn/0qF8V.html" target="_blank">匡威</a><a href="https://demo.yunec.cn/LAqbz.html" target="_blank">彪马</a><a href="https://demo.yunec.cn/elAiM.html" target="_blank">VANS</a><a href="https://demo.yunec.cn/WMkqD.html" target="_blank">锐步</a><a href="https://demo.yunec.cn/JBYY0.html" target="_blank">斯凯奇</a><a href="https://demo.yunec.cn/dl4lN.html" target="_blank">美津浓</a><a href="https://demo.yunec.cn/vjB6N.html" target="_blank">李宁</a><a href="https://demo.yunec.cn/ow0AY.html" target="_blank">跑鞋</a><a href="https://demo.yunec.cn/B1YVe.html" target="_blank">篮球鞋</a><a href="https://demo.yunec.cn/46YOi.html" target="_blank">复古休闲</a><a href="https://demo.yunec.cn/8DJZp.html" target="_blank">健身</a><a href="https://demo.yunec.cn/maCyT.html" target="_blank">足球</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/WMkiD.html" target="_blank">户外<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/AIWYv.html" target="_blank">冲锋衣</a><a href="https://demo.yunec.cn/y4CIk.html" target="_blank">登山鞋</a><a href="https://demo.yunec.cn/8DJZt.html" target="_blank">钓竿</a><a href="https://demo.yunec.cn/pcGzc.html" target="_blank">鱼线</a><a href="https://demo.yunec.cn/0qFHR.html" target="_blank">鱼线轮</a><a href="https://demo.yunec.cn/9xdcZ.html" target="_blank">户外鞋</a><a href="https://demo.yunec.cn/WMky7.html" target="_blank">登山包</a><a href="https://demo.yunec.cn/gjs6B.html" target="_blank">帐篷</a><a href="https://demo.yunec.cn/Xf233.html" target="_blank">睡袋</a><a href="https://demo.yunec.cn/y4CMi.html" target="_blank">望远镜</a><a href="https://demo.yunec.cn/ci6pR.html" target="_blank">皮肤衣</a><a href="https://demo.yunec.cn/utKOi.html" target="_blank">速干衣</a><a href="https://demo.yunec.cn/CzOfw.html" target="_blank">速干裤</a><a href="https://demo.yunec.cn/maC2X.html" target="_blank">手电筒</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/jrPiY.html" target="_blank">箱包<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/9y6Ee.html" target="_blank">行李箱</a><a href="https://demo.yunec.cn/OR1P5.html" target="_blank">双肩包</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/gkMiG.html" target="_blank">鞋子<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/ZaGOP.html" target="_blank">男鞋</a><a href="https://demo.yunec.cn/5Bwzl.html" target="_blank">女鞋</a></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/RHD50.html" target="_blank">美食天地</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/NSlFz.html" target="_blank">牛肉<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/ORYLC.html" target="_blank">牛肉丸</a><a href="https://demo.yunec.cn/78Vuk.html" target="_blank">猪肉</a><a href="https://demo.yunec.cn/RHgA8.html" target="_blank">童装</a><a href="https://demo.yunec.cn/GMEC6.html" target="_blank">内衣</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/Vd0Ow.html" target="_blank">美食<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/8DZ2p.html" target="_blank">麦片</a><a href="https://demo.yunec.cn/x4SoQ.html" target="_blank">咖啡</a><a href="https://demo.yunec.cn/gj8WE.html" target="_blank">牛奶</a><a href="https://demo.yunec.cn/YOE8H.html" target="_blank">柚子茶</a><a href="https://demo.yunec.cn/bSMR6.html" target="_blank">酸梅汤</a><a href="https://demo.yunec.cn/SKx5C.html" target="_blank">矿泉水</a><a href="https://demo.yunec.cn/iZUNN.html" target="_blank">酵素</a><a href="https://demo.yunec.cn/x4SsM.html" target="_blank">藕粉</a><a href="https://demo.yunec.cn/aN1UK.html" target="_blank">大米</a><a href="https://demo.yunec.cn/46ovi.html" target="_blank">橄榄油</a><a href="https://demo.yunec.cn/9xt5c.html" target="_blank">小米</a><a href="https://demo.yunec.cn/ZZ2GL.html" target="_blank">黄豆</a><a href="https://demo.yunec.cn/37ixY.html" target="_blank">赤豆</a><a href="https://demo.yunec.cn/9xt5f.html" target="_blank">火腿</a><a href="https://demo.yunec.cn/WM0SE.html" target="_blank">香肠</a><a href="https://demo.yunec.cn/0qVka.html" target="_blank">木耳</a><a href="https://demo.yunec.cn/gj8e7.html" target="_blank">枸杞</a><a href="https://demo.yunec.cn/y4Ste.html" target="_blank">人参</a><a href="https://demo.yunec.cn/16hmR.html" target="_blank">石斛</a><a href="https://demo.yunec.cn/x4SwO.html" target="_blank">燕窝</a><a href="https://demo.yunec.cn/65j7b.html" target="_blank">雪蛤</a><a href="https://demo.yunec.cn/PQsMD.html" target="_blank">蜂蜜</a><a href="https://demo.yunec.cn/wwRyh.html" target="_blank">天麻</a><a href="https://demo.yunec.cn/B1o6j.html" target="_blank">花粉</a><a href="https://demo.yunec.cn/Vd0W3.html" target="_blank">铁观音</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/SKx54.html" target="_blank">生鲜<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/77lqg.html" target="_blank">樱桃</a><a href="https://demo.yunec.cn/EJy1r.html" target="_blank">海参</a><a href="https://demo.yunec.cn/8DZFm.html" target="_blank">麻辣小龙虾</a><a href="https://demo.yunec.cn/CzeHq.html" target="_blank">三文鱼</a><a href="https://demo.yunec.cn/Vd0ay.html" target="_blank">牛排</a><a href="https://demo.yunec.cn/znj3f.html" target="_blank">咸鸭蛋</a><a href="https://demo.yunec.cn/B1oBh.html" target="_blank">土鸡蛋</a><a href="https://demo.yunec.cn/IMvM3.html" target="_blank">奇异果</a><a href="https://demo.yunec.cn/Vd0a2.html" target="_blank">土鸡</a><a href="https://demo.yunec.cn/aN1cQ.html" target="_blank">芒果</a><a href="https://demo.yunec.cn/knUkW.html" target="_blank">橙子</a><a href="https://demo.yunec.cn/owHtX.html" target="_blank">黄秋葵</a><a href="https://demo.yunec.cn/8DZJm.html" target="_blank">苹果</a><a href="https://demo.yunec.cn/YOEPC.html" target="_blank">榴莲</a><a href="https://demo.yunec.cn/EJy5u.html" target="_blank">柠檬</a><a href="https://demo.yunec.cn/37iAW.html" target="_blank">干贝</a><a href="https://demo.yunec.cn/elQWM.html" target="_blank">虾仁</a><a href="https://demo.yunec.cn/x4S4S.html" target="_blank">生蚝</a><a href="https://demo.yunec.cn/WM0eE.html" target="_blank">牛肉</a><a href="https://demo.yunec.cn/16huY.html" target="_blank">虾皮</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/16heS.html" target="_blank">零食<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/owHxX.html" target="_blank">山核桃</a><a href="https://demo.yunec.cn/2rmJT.html" target="_blank">星空棒棒糖</a><a href="https://demo.yunec.cn/qfKlb.html" target="_blank">碧根果</a><a href="https://demo.yunec.cn/gj8qB.html" target="_blank">巴旦木</a><a href="https://demo.yunec.cn/pcWnX.html" target="_blank">开心果</a><a href="https://demo.yunec.cn/maSmT.html" target="_blank">夏威夷果</a><a href="https://demo.yunec.cn/vjRuT.html" target="_blank">鸭肉</a><a href="https://demo.yunec.cn/ciNZS.html" target="_blank">话梅糖</a><a href="https://demo.yunec.cn/owHxf.html" target="_blank">泡泡糖</a><a href="https://demo.yunec.cn/H42X5.html" target="_blank">薄荷糖</a><a href="https://demo.yunec.cn/ZZ2aG.html" target="_blank">Kirkland坚果</a><a href="https://demo.yunec.cn/Vd0mw.html" target="_blank">牛奶糖</a><a href="https://demo.yunec.cn/pcWrV.html" target="_blank">费列罗</a><a href="https://demo.yunec.cn/KLnZ3.html" target="_blank">布丁</a><a href="https://demo.yunec.cn/maSqS.html" target="_blank">果冻</a><a href="https://demo.yunec.cn/gj8uD.html" target="_blank">白色恋人饼干</a><a href="https://demo.yunec.cn/JBoUy.html" target="_blank">甜甜圈</a><a href="https://demo.yunec.cn/8DZRs.html" target="_blank">辣条</a><a href="https://demo.yunec.cn/lbHnH.html" target="_blank">蛋条</a></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/PQscH.html" target="_blank">美妆个护</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/Vd0qv.html" target="_blank">美妆<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/tycDd.html" target="_blank">面膜</a><a href="https://demo.yunec.cn/FMfLu.html" target="_blank">洁面</a><a href="https://demo.yunec.cn/ciNhQ.html" target="_blank">防晒</a><a href="https://demo.yunec.cn/FMfLw.html" target="_blank">爽肤水</a><a href="https://demo.yunec.cn/5AjCs.html" target="_blank">眼霜</a><a href="https://demo.yunec.cn/dlLlM.html" target="_blank">乳液</a><a href="https://demo.yunec.cn/OQof7.html" target="_blank">面霜</a><a href="https://demo.yunec.cn/FMfPq.html" target="_blank">精华</a><a href="https://demo.yunec.cn/fWK3N.html" target="_blank">卸妆</a><a href="https://demo.yunec.cn/shLCb.html" target="_blank">男士护肤</a><a href="https://demo.yunec.cn/AImYs.html" target="_blank">眼线</a><a href="https://demo.yunec.cn/RHDc4.html" target="_blank">粉底液</a><a href="https://demo.yunec.cn/37iQX.html" target="_blank">BB霜</a><a href="https://demo.yunec.cn/y4SIj.html" target="_blank">隔离</a><a href="https://demo.yunec.cn/65jWe.html" target="_blank">睫毛膏</a><a href="https://demo.yunec.cn/2rmVa.html" target="_blank">彩妆盘</a><a href="https://demo.yunec.cn/M84f4.html" target="_blank">唇膏</a><a href="https://demo.yunec.cn/AImcp.html" target="_blank">腮红</a><a href="https://demo.yunec.cn/fWK7N.html" target="_blank">香水</a><a href="https://demo.yunec.cn/knU8P.html" target="_blank">精油</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/GMkay.html" target="_blank">洗护<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/B1oZf.html" target="_blank">洗发水</a><a href="https://demo.yunec.cn/aN10M.html" target="_blank">护发素</a><a href="https://demo.yunec.cn/XfJ34.html" target="_blank">发膜</a><a href="https://demo.yunec.cn/owHEd.html" target="_blank">头发造型</a><a href="https://demo.yunec.cn/65jae.html" target="_blank">染发膏</a><a href="https://demo.yunec.cn/XfJ37.html" target="_blank">烫发水</a><a href="https://demo.yunec.cn/WM0yF.html" target="_blank">假发</a><a href="https://demo.yunec.cn/NSFBm.html" target="_blank">沐浴露</a><a href="https://demo.yunec.cn/emdGH.html" target="_blank">私处护理</a><a href="https://demo.yunec.cn/bTZR0.html" target="_blank">身体乳液</a><a href="https://demo.yunec.cn/WNEO8.html" target="_blank">牙膏</a><a href="https://demo.yunec.cn/y5flh.html" target="_blank">牙刷</a><a href="https://demo.yunec.cn/ZaGCL.html" target="_blank">漱口水</a><a href="https://demo.yunec.cn/RIQ56.html" target="_blank">足浴</a><a href="https://demo.yunec.cn/66wze.html" target="_blank">足贴</a><a href="https://demo.yunec.cn/rzhXZ.html" target="_blank">洗手液</a><a href="https://demo.yunec.cn/XgWT8.html" target="_blank">卫生巾</a><a href="https://demo.yunec.cn/78ymX.html" target="_blank">成人纸尿裤</a><a href="https://demo.yunec.cn/iahNO.html" target="_blank">抽纸</a><a href="https://demo.yunec.cn/wxeud.html" target="_blank">卷纸</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/2rmRU.html" target="_blank">保健品<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/zowve.html" target="_blank">多维矿物质</a><a href="https://demo.yunec.cn/qgXVd.html" target="_blank">B族维生素</a><a href="https://demo.yunec.cn/QUH4C.html" target="_blank">葡萄籽</a><a href="https://demo.yunec.cn/DECDg.html" target="_blank">辅酶Q10</a><a href="https://demo.yunec.cn/dmYNL.html" target="_blank">消化酶</a><a href="https://demo.yunec.cn/MAID3.html" target="_blank">软骨素</a><a href="https://demo.yunec.cn/lcUTI.html" target="_blank">维生素C</a><a href="https://demo.yunec.cn/9y6AY.html" target="_blank">钙</a><a href="https://demo.yunec.cn/qgXZa.html" target="_blank">大豆异黄酮</a><a href="https://demo.yunec.cn/tzpsc.html" target="_blank">益生菌</a><a href="https://demo.yunec.cn/fXXfP.html" target="_blank">鱼油</a></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/OR1L2.html" target="_blank">图书天地</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/x5fwQ.html" target="_blank">电子书<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/2sz6Y.html" target="_blank">儿童书<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/vkemN.html" target="_blank">图书<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/TVJOB.html" target="_blank">珠宝首饰</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/bTZZ6.html" target="_blank">钟表<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/9y6Ec.html" target="_blank">手表</a><a href="https://demo.yunec.cn/VeEa0.html" target="_blank">挂钟</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/17uqQ.html" target="_blank">吊坠<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/5Bwvn.html" target="_blank">戒指<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/17uqS.html" target="_blank">耳环<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"></div>
</div></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/tzp0e.html" target="_blank">虚拟商品</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"></div>
</div>
</div>
</li>						
<li>
<div class="sortmaintitle">
<a href="https://demo.yunec.cn/17rec.html" target="_blank">数码电器</a>
</div>
<div class="navsonbox">
<div class="nr">
<div class="navson-classify"><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/AJGM2.html" target="_blank">手机<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/nsirO.html" target="_blank">Iphone</a><a href="https://demo.yunec.cn/JCIc5.html" target="_blank">OPPO</a><a href="https://demo.yunec.cn/hhrsc.html" target="_blank">魅族13</a><a href="https://demo.yunec.cn/fX37Z.html" target="_blank">iPhone</a><a href="https://demo.yunec.cn/TV5SH.html" target="_blank">vivo</a><a href="https://demo.yunec.cn/dmLZR.html" target="_blank">小米</a><a href="https://demo.yunec.cn/PRsYL.html" target="_blank">三星</a><a href="https://demo.yunec.cn/emdWJ.html" target="_blank">不显示</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/hhrgc.html" target="_blank">家电<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/C0eD1.html" target="_blank"></a><a href="https://demo.yunec.cn/WN0qJ.html" target="_blank">个人护理l</a><a href="https://demo.yunec.cn/QU3XK.html" target="_blank">美容仪</a><a href="https://demo.yunec.cn/Ve0y8.html" target="_blank">空气净化器</a><a href="https://demo.yunec.cn/ZbGCT.html" target="_blank">扫地机器人</a><a href="https://demo.yunec.cn/FOsw3.html" target="_blank">吸尘器</a><a href="https://demo.yunec.cn/DFCHn.html" target="_blank">取暖器</a><a href="https://demo.yunec.cn/x6f0Y.html" target="_blank">烤箱</a><a href="https://demo.yunec.cn/VfEe8.html" target="_blank">豆浆机</a><a href="https://demo.yunec.cn/B31Jp.html" target="_blank">榨汁料理</a><a href="https://demo.yunec.cn/kphwa.html" target="_blank">电饭煲</a><a href="https://demo.yunec.cn/FOsL3.html" target="_blank">吹风机</a><a href="https://demo.yunec.cn/3AvQf.html" target="_blank">足浴盆</a><a href="https://demo.yunec.cn/r0h7e.html" target="_blank">剃须刀</a><a href="https://demo.yunec.cn/ibxJa.html" target="_blank">卷发器</a><a href="https://demo.yunec.cn/zpDvo.html" target="_blank">按摩器材</a><a href="https://demo.yunec.cn/XhmbD.html" target="_blank">冬季火锅</a><a href="https://demo.yunec.cn/OSIPC.html" target="_blank">蓝牙耳机</a><a href="https://demo.yunec.cn/ibxZa.html" target="_blank">电暖桌</a><a href="https://demo.yunec.cn/glcqL.html" target="_blank">蓝牙音箱</a><a href="https://demo.yunec.cn/r0xve.html" target="_blank">电热毯</a><a href="https://demo.yunec.cn/IOPcB.html" target="_blank">加湿器</a><a href="https://demo.yunec.cn/VfUu8.html" target="_blank">暖风机</a><a href="https://demo.yunec.cn/nsFnO.html" target="_blank">厨房电器</a></div>
</div><div class="navson-classify-box">
<h3 class="maintitle"><a href="https://demo.yunec.cn/JCY55.html" target="_blank">数码<span>&gt;</span></a></h3>
<div class="navson-classify-subtitle"><a href="https://demo.yunec.cn/fWnXM.html" target="_blank">IPAD air2</a><a href="https://demo.yunec.cn/7AFJk.html" target="_blank">数码实体店体验</a><a href="https://demo.yunec.cn/eltGH.html" target="_blank">平板电脑</a><a href="https://demo.yunec.cn/EJSpt.html" target="_blank">surface平板电脑</a><a href="https://demo.yunec.cn/ut3ne.html" target="_blank">苹果/Apple</a><a href="https://demo.yunec.cn/pczTX.html" target="_blank">iPad Pro</a><a href="https://demo.yunec.cn/WMUOB.html" target="_blank">电脑主机</a><a href="https://demo.yunec.cn/shoff.html" target="_blank">数码相机</a><a href="https://demo.yunec.cn/77Fie.html" target="_blank">电玩动漫</a><a href="https://demo.yunec.cn/ryxXZ.html" target="_blank">单反相机</a><a href="https://demo.yunec.cn/KLHBA.html" target="_blank">华为 MateBook</a><a href="https://demo.yunec.cn/8D26l.html" target="_blank">IPAD mini4</a><a href="https://demo.yunec.cn/JBIAt.html" target="_blank">游戏主机</a><a href="https://demo.yunec.cn/M8YDx.html" target="_blank">鼠标键盘</a><a href="https://demo.yunec.cn/0qykU.html" target="_blank">无人机</a><a href="https://demo.yunec.cn/iZxNR.html" target="_blank">二手数码</a></div>
</div></div>
</div>
</div>
</li></ul>
</div>
<ul class="nav-othder">
<li><a href="/">首页</a></li>
<li><a href="https://demo.yunec.cn/17rec.html" target="_blank">数码电器</a></li>
<li><a href="https://demo.yunec.cn/PQscH.html" target="_blank">美妆个护</a></li>
<li><a href="https://demo.yunec.cn/NSlFz.html" target="_blank">时尚服装</a></li>
<li><a href="toTimespick" target="_blank">限时抢购</a></li>
<li><a href="toDiscount" target="_blank">优惠券</a></li>

</ul>
</div>
</div>
</div>
</div><div class="banner">
<div class="slidebanner">
<div class="hd">
<!--
<ul><li class="">1</li><li class="">2</li><li class="">3</li><li class="on">4</li><li class="">5</li></ul>
-->
</div>
<div class="bd">
<!--
<ul>
<li style="display: none;"><a href="https://demo.yunec.cn/" style="background:url(upload/img/banner/4c9a8e0cc29395d1980500592c671b93_b.jpg) no-repeat top center"></a></li>
<li style="display: none;"><a href="https://demo.yunec.cn/" style="background:url(upload/img/banner/f5c4079eb966eb0be52405f9392b01bf_b.jpg) no-repeat top center"></a></li>
<li style="display: none;"><a href="https://demo.yunec.cn/" style="background:url(upload/img/banner/476bbb34a7a5e6a4645df8463ddea02a_b.jpg) no-repeat top center"></a></li>
<li style="display: list-item;"><a href="https://demo.yunec.cn/" style="background:url(upload/img/banner/d4f739418f78e155ae42e276a283ccc8_b.jpg) no-repeat top center"></a></li>
<li style="display: none;"><a href="https://demo.yunec.cn/" style="background:url(upload/img/banner/de5a8e9f29cf2bb1edcf404a28320d14_b.jpg) no-repeat top center"></a></li>
</ul>
-->
</div>
</div>
<div class="nb">
<div class="lognew">
<div class="login-quick"><a href="user/toUserPage" class="head"><img src="view/default/images/index/avatar.jpg" alt="70*70"></a>
<!--<div class="login-quick"><a href="https://demo.yunec.cn/login.html" class="head"><img src="view/default/images/index/avatar.jpg" alt="70*70"></a>-->
<p>Hi~您好！</p>
<#if isLogin==true>
<a href="user/toUserPage" class="btn-login">老铁</a>
<a href="user/toUserPage" class="btn-regist">${username}</a></div>
<#else>
<a href="login" class="btn-login">请登录</a>
<a href="register" class="btn-regist">免费注册</a></div>
</#if>
<div class="new-quick">
<div class="quicknew-bar">
<span>资讯</span><a href="https://demo.yunec.cn/n-news.html" target="_blank" class="rside">更多</a>
</div>
<ul><li><a href="https://demo.yunec.cn/news/H5WbzJt4u.html">模板引擎说明</a></li>
<li><a href="https://demo.yunec.cn/news/66DOZBlkh.html">模板引擎说明</a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="content">
<div class="nb">
<div class="cont-item"><a href="https://demo.yunec.cn/#" target="_blank"><img src="view/default/images/index/ind_item1.jpg"></a><a href="https://demo.yunec.cn/#" target="_blank"><img src="view/default/images/index/ind_item2.jpg"></a><a href="https://demo.yunec.cn/#" target="_blank"><img src="view/default/images/index/ind_item3.jpg"></a><a href="https://demo.yunec.cn/#" target="_blank"><img src="view/default/images/index/ind_item4.jpg"></a></div><div class="time-limit">
<div class="timeslimit-bar">
<span>限时秒杀</span>
<p data-time="3230209" class="time" id="time1">还剩：<span id="v_day1">37</span>天<span id="v_hour1">9</span>小时<span id="v_minute1">14</span>分<span id="v_second1">35</span>秒</p>

<a href="https://demo.yunec.cn/timespike.html" target="_blank" class="rside">查看全部 &gt;</a>
</div>
<div class="slide-timeslimit" style="height: 268px;">
<div class="prev-next">
<a href="javascript:void(0);" class="prev"></a>
<a href="javascript:void(0);" class="next"></a>
</div>
<div class="bd">
<div class="tempWrap" style="overflow:hidden; position:relative; width:1170px"><ul style="width: 1950px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;"><li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/YOhTD-g.html" target="_blank"><img src="view/default/images/index/7e61c6a2c97eab37c85e8e0734db0265_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/YOhTD-g.html">可悠然（ KUYURA）美肌沐浴露（欣怡幽香）550ml （资生堂旗下）2</a></p>
<div class="pricebox">
<div class="price">￥<span>85.00</span></div>
<del>￥56.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/pczXZ-g.html" target="_blank"><img src="view/default/images/index/b1ffbbbcc2755b5e7c8d2171f42e659b_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/pczXZ-g.html">华为 HUAWEI P10 4G智能手机 钻雕金【现货】 全网通 4G +64G 标配</a></p>
<div class="pricebox">
<div class="price">￥<span>3219.80</span></div>
<del>￥3788.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/ciqZQ-g.html" target="_blank"><img src="https://demo.yunec.cn/" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/ciqZQ-g.html">测试商品，一分钱34</a></p>
<div class="pricebox">
<div class="price">￥<span>0.01</span></div>
<del>￥22000.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/qfnhe-g.html" target="_blank"><img src="view/default/images/index/5f789197dd87cf5a3c57be0911ffc373_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/qfnhe-g.html">名家厨房 牛排10片装1520g 黑椒 菲力西冷 顺丰包邮 赠2刀叉油酱包</a></p>
<div class="pricebox">
<div class="price">￥<span>101.15</span></div>
<del>￥119.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/LAaPy-g.html" target="_blank"><img src="view/default/images/index/798ebe7e7b45b0ff5fe0507325e9aae4_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/LAaPy-g.html">国联(GUO LIAN) 冷冻翡翠生虾仁 200g 31-40只 海鲜水产</a></p>
<div class="pricebox">
<div class="price">￥<span>15.98</span></div>
<del>￥18.80</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/WMUe8-g.html" target="_blank"><img src="view/default/images/index/df0aabd54ff2a2569345c75ec65c8455_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/WMUe8-g.html">沃隆 每日坚果 坚果炒货 休闲零食 成人款 （25g*30包） 750g/盒</a></p>
<div class="pricebox">
<div class="price">￥<span>117.30</span></div>
<del>￥138.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/LAaD2-g.html" target="_blank"><img src="view/default/images/index/20055de0bbf8ebb33d9d05e08c4d90da_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/LAaD2-g.html">OPPO A57 3GB+32GB内存版 玫瑰金 全网通4G手机 双卡双待</a></p>
<div class="pricebox">
<div class="price">￥<span>1359.15</span></div>
<del>￥1599.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/JBIAz-g.html" target="_blank"><img src="view/default/images/index/17400ef2555417492e9b6d9f344a6c4e_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/JBIAz-g.html">vivo Xplay6 全网通6GB+128GB 移动联通电信4G手机 双卡双待 磨砂黑</a></p>
<div class="pricebox">
<div class="price">￥<span>3823.30</span></div>
<del>￥4498.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/owkhb-g.html" target="_blank"><img src="view/default/images/index/37d811f62d4d88347a6cc7e6a76e2832_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/owkhb-g.html">魅族5 魅蓝5 全网通4G智能手机 香槟金 2GB+16GB</a></p>
<div class="pricebox">
<div class="price">￥<span>669.80</span></div>
<del>￥788.00</del>
</div>
</div>
</li>
<li style="float: left; width: 195px;">
<div class="nr">
<a class="picbox" href="https://demo.yunec.cn/VdUSy-g.html" target="_blank"><img src="view/default/images/index/0f74181a1b0c4e413c304c97a84eb4b1_s.jpg" alt=""></a>
<p class="word"><a href="https://demo.yunec.cn/VdUSy-g.html">三星 Galaxy S7 edge（G9350）4GB+32GB 星钻黑 全网通4G手机 双卡双待</a></p>
<div class="pricebox">
<div class="price">￥<span>4154.80</span></div>
<del>￥4888.00</del>
</div>
</div>
</li>
</ul></div>
</div>
<div class="hd" style="display: none;">
<ul><li class="on">1</li><li>2</li></ul>
</div>
</div>
</div><div class="floor-fontainer"><div class="leftgood-bar" style="left: 250px;"><div class="lgb onlgb lgb0">
<a href="javascript:void(0)" name="#floor0">
<span>数码电器</span>
</a>
</div>
<div class="lgb  lgb1">
<a href="javascript:void(0)" name="#floor1">
<span>运动户外</span>
</a>
</div>
<div class="lgb  lgb2">
<a href="javascript:void(0)" name="#floor2">
<span>家具家饰</span>
</a>
</div>
<div class="lgb  lgb3">
<a href="javascript:void(0)" name="#floor3">
<span>美食天地</span>
</a>
</div>
<div class="lgb  lgb4">
<a href="javascript:void(0)" name="#floor4">
<span>美妆个护</span>
</a>
</div>
	
</div>
<div class="rightgood-body">
<div class="floor floor0" id="floor0">
<div class="floor-title">
<h3><a href="https://demo.yunec.cn/17rec.html">数码电器</a></h3>
<a href="https://demo.yunec.cn/17rec.html" class="more">查看全部 &gt;</a>
<ul class="navson"><li><a href="https://demo.yunec.cn/AJGM2.html">手机</a></li>
<li><a href="https://demo.yunec.cn/hhrgc.html">家电</a></li>
<li><a href="https://demo.yunec.cn/JCY55.html">数码</a></li>
</ul>
</div>
<div class="floornr">
<div class="itemsale">
<a href="https://demo.yunec.cn/17rec.html" class="picbox">
<img src="view/default/images/index/e178f8aeafc39bf71ad98afdab5a672a.jpg" alt="" style="background-image:url(/view/default/images/icon-duo.png)">
</a>
<a href="https://demo.yunec.cn/17rec.html" class="itemtitle">
<h4 class="ellipsis">数码电器</h4>
<p class="ellipsis">SHOW出你的味道</p>
</a>
</div>
<div class="style-sale">
<ul><li>
<a href="https://demo.yunec.cn/JBIEv-g.html" target="_blank">
<h4 class="ellipsis">飞利浦（PHILIPS）空气净化器KJ330F-C03(AC4076)香槟色家用除甲醛</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/25f226b37c7397d90222f64d1e824e7d_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/QTX86-g.html" target="_blank">
<h4 class="ellipsis">华为 麦芒5 全网通 4GB+64GB版 香槟金 移动联通电信4G手机 双卡双待</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/33fa960831e505264aa2b2cf181ae025_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/ciqNM-g.html" target="_blank">
<h4 class="ellipsis">戴森(Dyson)HP01白银 空气净化暖风器取暖器电暖气 无叶风扇 原装进口</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/dbdb75b1f274b4622bb3f019f68684c0_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/pczXZ-g.html" target="_blank">
<h4 class="ellipsis">华为 HUAWEI P10 4G智能手机 钻雕金【现货】 全网通 4G +64G 标配</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/b1ffbbbcc2755b5e7c8d2171f42e659b_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/ciqZQ-g.html" target="_blank">
<h4 class="ellipsis">测试商品，一分钱34</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="https://demo.yunec.cn/" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/aNVYK-g.html" target="_blank">
<h4 class="ellipsis">戴森(Dyson) 吸尘器 V6 Motorhead手持式家用除螨无线无绳</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/22a7a0435563e934cb7ae5ead93f1faa_s.jpg" alt="238*130">
</span>
</a>
</li>
</ul>
</div>
<div class="brand-sale">
<ul><li><a href="https://demo.yunec.cn/brand.html?id=21" target="_blank"><img src="view/default/images/index/2cb578d092f604d4e452143a25e4fae3.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=22" target="_blank"><img src="view/default/images/index/02aad63a947ebdef7f2e255e2053430a.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=23" target="_blank"><img src="view/default/images/index/409ac701da3588fcd69947af55cb5481.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=24" target="_blank"><img src="view/default/images/index/b448c9d070bf2fce1c2286fb41b01dce.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=25" target="_blank"><img src="view/default/images/index/182546f99da8ba0dba7803acf50ba469.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=26" target="_blank"><img src="view/default/images/index/164a926c1613e48b99c4e70164eb07b0.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=20" target="_blank"><img src="view/default/images/index/2416a0588f03b9ffacb80b5476bc8e9c.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=31" target="_blank"><img src="view/default/images/index/ab82b2513f1756d1e9586b2baf959440.jpg" alt="80*60" width="60" height="60"></a></li>
</ul>
</div>
</div>
</div>
<div class="floor floor1" id="floor1">
<div class="floor-title">
<h3><a href="https://demo.yunec.cn/XgmjD.html">运动户外</a></h3>
<a href="https://demo.yunec.cn/XgmjD.html" class="more">查看全部 &gt;</a>
<ul class="navson"><li><a href="https://demo.yunec.cn/9xdMe.html">运动</a></li>
<li><a href="https://demo.yunec.cn/WMkiD.html">户外</a></li>
<li><a href="https://demo.yunec.cn/jrPiY.html">箱包</a></li>
<li><a href="https://demo.yunec.cn/gkMiG.html">鞋子</a></li>
</ul>
</div>
<div class="floornr">
<div class="itemsale">
<a href="https://demo.yunec.cn/XgmjD.html" class="picbox">
<img src="view/default/images/index/7d67060903e3f2c779a26e8cd9eacf74.png" alt="" style="background-image:url(/view/default/images/icon-duo.png)">
</a>
<a href="https://demo.yunec.cn/XgmjD.html" class="itemtitle">
<h4 class="ellipsis">运动户外</h4>
<p class="ellipsis">SHOW出你的味道</p>
</a>
</div>
<div class="style-sale">
<ul><li>
<a href="https://demo.yunec.cn/dlohL-g.html" target="_blank">
<h4 class="ellipsis">知识付费 --付款内容--购买才能看--虚拟商品</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="https://demo.yunec.cn/" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/0qy4X-g.html" target="_blank">
<h4 class="ellipsis">云EC授权优惠券--虚拟商品d2</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/996512abf9299c68c513f5a502952e31_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/5ADzm-g.html" target="_blank">
<h4 class="ellipsis">红色营地 睡袋 户外秋冬季加厚睡袋成人午休睡袋 2.3kg 蓝色</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/aa7357748b40ecd1b2194675a7a2cece_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/ryxnR-g.html" target="_blank">
<h4 class="ellipsis">博冠（BOSMA） 保罗10X50ZCY 双筒望远镜驴友型10X50 高清高倍 旅游 观赛 观鸟</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/33f4eb67168a3d45583c7057bc870c46_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/dloVN-g.html" target="_blank">
<h4 class="ellipsis">范斯蒂克 运动套装男健身服长袖抓绒紧身衣长裤篮球足球服套装跑步速干综合训练运动服套装 黑色拼线四件套 L</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/f278572264a3987ed34fc34160361996_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/shorh-g.html" target="_blank">
<h4 class="ellipsis">鸿星尔克ERKE跑鞋2016新款情侣款全掌气垫减震运动慢跑鞋女款52116120028正黑/荧光蓝38码</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/3811515bf8d68d1159b24041b49bac2d_s.jpg" alt="238*130">
</span>
</a>
</li>
</ul>
</div>
<div class="brand-sale">
<ul><li><a href="https://demo.yunec.cn/brand.html?id=28" target="_blank"><img src="view/default/images/index/e45bb8e8046923a2e4fd72fb4fe234a1.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=36" target="_blank"><img src="view/default/images/index/c3c207a6a26c5821eaf812742fe68cd3.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=37" target="_blank"><img src="view/default/images/index/15deecc4835d28078dc9de8c565ab9b5.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=38" target="_blank"><img src="view/default/images/index/1057540e57c928a5d9cfdd5a996acf5c.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=40" target="_blank"><img src="view/default/images/index/18eee6624dd6e25d8af0161ce2321396.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=42" target="_blank"><img src="view/default/images/index/ce9c8b59eef77c14a87e38cbab882b22.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=44" target="_blank"><img src="view/default/images/index/f85e293bc803242b9957f25d44b76bbf.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=45" target="_blank"><img src="view/default/images/index/d257ae99157d452ca088584c7945e1d5.jpg" alt="80*60" width="60" height="60"></a></li>
</ul>
</div>
</div>
</div>
<div class="floor floor2" id="floor2">
<div class="floor-title">
<h3><a href="https://demo.yunec.cn/bT5hC.html">家具家饰</a></h3>
<a href="https://demo.yunec.cn/bT5hC.html" class="more">查看全部 &gt;</a>
<ul class="navson"><li><a href="https://demo.yunec.cn/koEwa.html">家具1</a></li>
<li><a href="https://demo.yunec.cn/cj6hY.html">家饰</a></li>
<li><a href="https://demo.yunec.cn/MAof8.html">厨具</a></li>
</ul>
</div>
<div class="floornr">
<div class="itemsale">
<a href="https://demo.yunec.cn/bT5hC.html" class="picbox">
<img src="view/default/images/index/89917c92df6297ba47028daaae973f29.jpg" alt="" style="background-image:url(/view/default/images/icon-duo.png)">
</a>
<a href="https://demo.yunec.cn/bT5hC.html" class="itemtitle">
<h4 class="ellipsis">家具家饰</h4>
<p class="ellipsis">SHOW出你的味道</p>
</a>
</div>
<div class="style-sale">
<ul><li>
<a href="https://demo.yunec.cn/37C5X-g.html" target="_blank">
<h4 class="ellipsis">欧式落地灯 创意简约客厅卧室落地台灯北欧木艺立式落地灯 9008落地灯 黑色-带5W LED暖光</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/b4cde2b3d6fc7f9f29c479dbc1341bd3_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/dloVI-g.html" target="_blank">
<h4 class="ellipsis">MEILVJU藤编飘窗桌阳台茶几简约日式榻榻米茶几矮桌可储物实木小茶几炕桌 小号桌(43*43*30cm) 整装</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/267a746e20719d7504d6ea22003a5661_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/77Fua-g.html" target="_blank">
<h4 class="ellipsis">泥印 陶瓷 单杯主人杯白瓷个人杯品茗杯玉瓷茶杯禅定杯功夫茶杯羊脂白茶具杯子礼盒D53-06</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/cd4827b974a7bf41a0d7900a8e3956fa_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/owkpZ-g.html" target="_blank">
<h4 class="ellipsis">UP简约欧式陶瓷餐具餐盘餐碗勺子17头套装点心骨瓷饭碗</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/0c485d26cb3a22efebd532db24e2f05e_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/IMPMy-g.html" target="_blank">
<h4 class="ellipsis">LOVO 罗莱生活出品 水洗棉四件套纯棉简约床品双人加大床特丽斯220*240cm</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/2b9e844b5a52c617105a6cf87f7d7621_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/SKRI2-g.html" target="_blank">
<h4 class="ellipsis">Snnei室内 客厅装饰画走廊挂画 创意现代立体浮雕板画壁饰 地中海沙发背景墙壁画 蓝框-海滩挂画-单幅售价</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/2135ba7316899c527d4c29b7bb257a77_s.jpg" alt="238*130">
</span>
</a>
</li>
</ul>
</div>
<div class="brand-sale">
<ul><li><a href="https://demo.yunec.cn/brand.html?id=63" target="_blank"><img src="view/default/images/index/e795f7e4594d431316cc18e3f7f4c2af.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=60" target="_blank"><img src="view/default/images/index/05cef826dd74d8195e97be31fe50bae6.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=61" target="_blank"><img src="view/default/images/index/9dafe751374760beaf94c85f4b31b340.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=32" target="_blank"><img src="view/default/images/index/fe950a8b179ce365b26533a6bae231dc.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=71" target="_blank"><img src="view/default/images/index/a912a72eecf656dee0c3c259a587a1bc.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=70" target="_blank"><img src="view/default/images/index/7f6c41750cd5668bfde125bdf6066d89.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=65" target="_blank"><img src="view/default/images/index/e6e9bda77d4af55206f9737dcd80ca8a.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=72" target="_blank"><img src="view/default/images/index/9f7dc3f2fde7b68dc57323cb84f3c2ba.jpg" alt="80*60" width="60" height="60"></a></li>
</ul>
</div>
</div>
</div>
<div class="floor floor3" id="floor3">
<div class="floor-title">
<h3><a href="https://demo.yunec.cn/RHD50.html">美食天地</a></h3>
<a href="https://demo.yunec.cn/RHD50.html" class="more">查看全部 &gt;</a>
<ul class="navson"><li><a href="https://demo.yunec.cn/NSlFz.html">牛肉</a></li>
<li><a href="https://demo.yunec.cn/Vd0Ow.html">美食</a></li>
<li><a href="https://demo.yunec.cn/SKx54.html">生鲜</a></li>
<li><a href="https://demo.yunec.cn/16heS.html">零食</a></li>
</ul>
</div>
<div class="floornr">
<div class="itemsale">
<a href="https://demo.yunec.cn/RHD50.html" class="picbox">
<img src="view/default/images/index/a38081b141e446db9c438a805ee66488.jpg" alt="" style="background-image:url(/view/default/images/icon-duo.png)">
</a>
<a href="https://demo.yunec.cn/RHD50.html" class="itemtitle">
<h4 class="ellipsis">美食天地</h4>
<p class="ellipsis">SHOW出你的味道</p>
</a>
</div>
<div class="style-sale">
<ul><li>
<a href="https://demo.yunec.cn/SKRE8-g.html" target="_blank">
<h4 class="ellipsis">Gap男童 舒适趣味印花短袖T恤634985 杂灰色 150cm(XL)</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/e659a969226913d718f56377d0bdba64_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/Cz7Lv-g.html" target="_blank">
<h4 class="ellipsis">法国进口红酒 拉菲传奇波尔多干红葡萄酒 双支礼盒装带酒具 750ml*2瓶</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/9e073afe72a243aaa7b3d189f3d5b4e7_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/iZxZT-g.html" target="_blank">
<h4 class="ellipsis">传奇会 茶叶 安溪铁观音茶叶 浓香型乌龙茶感恩系列铁观音礼盒装500g</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/6f799d9e37bb71f11e47e0ac393e8107_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/qfnhe-g.html" target="_blank">
<h4 class="ellipsis">名家厨房 牛排10片装1520g 黑椒 菲力西冷 顺丰包邮 赠2刀叉油酱包</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/5f789197dd87cf5a3c57be0911ffc373_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/LAaPy-g.html" target="_blank">
<h4 class="ellipsis">国联(GUO LIAN) 冷冻翡翠生虾仁 200g 31-40只 海鲜水产</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/798ebe7e7b45b0ff5fe0507325e9aae4_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/WMUe8-g.html" target="_blank">
<h4 class="ellipsis">沃隆 每日坚果 坚果炒货 休闲零食 成人款 （25g*30包） 750g/盒</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/df0aabd54ff2a2569345c75ec65c8455_s.jpg" alt="238*130">
</span>
</a>
</li>
</ul>
</div>
<div class="brand-sale">
<ul><li><a href="https://demo.yunec.cn/brand.html?id=58" target="_blank"><img src="view/default/images/index/57d4b2cfe127dd8dc62651439ab2202a.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=59" target="_blank"><img src="view/default/images/index/82f45ce3626fa836c803db25d1c5c618.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=62" target="_blank"><img src="view/default/images/index/0d9c5154d6b08cbb2bf52d5d5ce940d8.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=64" target="_blank"><img src="view/default/images/index/c76415ed052169ce661fbf56512e490f.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=66" target="_blank"><img src="view/default/images/index/374b22934d992a1f03bf6ec11baae53f.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=67" target="_blank"><img src="view/default/images/index/88ac39d5f1fb497d07a868e718f228e0.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=68" target="_blank"><img src="view/default/images/index/248173a7174a0e527bedd1a7b027a703.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=69" target="_blank"><img src="view/default/images/index/7593cfb80eb94546aacdaa8ea6d11ee3.jpg" alt="80*60" width="60" height="60"></a></li>
</ul>
</div>
</div>
</div>
<div class="floor floor4" id="floor4">
<div class="floor-title">
<h3><a href="https://demo.yunec.cn/PQscH.html">美妆个护</a></h3>
<a href="https://demo.yunec.cn/PQscH.html" class="more">查看全部 &gt;</a>
<ul class="navson"><li><a href="https://demo.yunec.cn/Vd0qv.html">美妆</a></li>
<li><a href="https://demo.yunec.cn/GMkay.html">洗护</a></li>
<li><a href="https://demo.yunec.cn/2rmRU.html">保健品</a></li>
</ul>
</div>
<div class="floornr">
<div class="itemsale">
<a href="https://demo.yunec.cn/PQscH.html" class="picbox">
<img src="view/default/images/index/9b742983c15b2967864cccce936a2618.jpg" alt="" style="background-image:url(/view/default/images/icon-duo.png)">
</a>
<a href="https://demo.yunec.cn/PQscH.html" class="itemtitle">
<h4 class="ellipsis">美妆个护</h4>
<p class="ellipsis">SHOW出你的味道</p>
</a>
</div>
<div class="style-sale">
<ul><li>
<a href="https://demo.yunec.cn/pcznV-g.html" target="_blank">
<h4 class="ellipsis">贝德玛（Bioderma）舒妍洁肤液500ml 卸妆水（敏感肌 温和 法国进口 粉水）</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/413b0dd459fdf8e1cde95202fc918711_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/Xfmn0-g.html" target="_blank">
<h4 class="ellipsis">善存（Centrum）佳维片复合维生素 京东定制礼盒（180片）</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/e1d5f88fcc1b317511fe01edd41d72f0_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/H4WXw-g.html" target="_blank">
<h4 class="ellipsis">卡姿兰（Carslan）蜗牛气垫调控霜礼盒装02#柔缎色 14.5g*2（气垫bb霜升级 保湿 遮瑕 提亮）</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="https://demo.yunec.cn/" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/NRVRv-g.html" target="_blank">
<h4 class="ellipsis">LG睿嫣 润膏舒盈滋养洗发水250ml（润膏）超值两只装</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/a03fd494f9c0958744d937049ba3874c_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/x4v4T-g.html" target="_blank">
<h4 class="ellipsis">一叶子 莹润亮颜奢养面膜套组30片（奢养面膜15片+黑松露面膜15片)（补水保湿 护肤套装）</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/c216fa5850a253099de56f9022128e18_s.jpg" alt="238*130">
</span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/YOhTD-g.html" target="_blank">
<h4 class="ellipsis">可悠然（ KUYURA）美肌沐浴露（欣怡幽香）550ml （资生堂旗下）2</h4>
<p class="ellipsis"></p>
<span class="picbox">
<img src="view/default/images/index/7e61c6a2c97eab37c85e8e0734db0265_s.jpg" alt="238*130">
</span>
</a>
</li>
</ul>
</div>
<div class="brand-sale">
<ul><li><a href="https://demo.yunec.cn/brand.html?id=39" target="_blank"><img src="view/default/images/index/60ee9c7cc37587747a7bc3e78b055873.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=41" target="_blank"><img src="view/default/images/index/7861807383821ac636967396cfd8e6cf.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=43" target="_blank"><img src="view/default/images/index/dea0c478c9ae046565e64001fa8faa78.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=46" target="_blank"><img src="view/default/images/index/24dabacf6fcb8b797da7706aafa04eca.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=50" target="_blank"><img src="view/default/images/index/256dd412704e905226542652f3096c75.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=51" target="_blank"><img src="view/default/images/index/6a481838907adbe07b483f87f1b2cb92.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=54" target="_blank"><img src="view/default/images/index/a16956d2dbf2003caaa64e450993b4fc.jpg" alt="80*60" width="60" height="60"></a></li>
<li><a href="https://demo.yunec.cn/brand.html?id=56" target="_blank"><img src="view/default/images/index/42d14b263499a67eb0befa1edbaba3bb.jpg" alt="80*60" width="60" height="60"></a></li>
</ul>
</div>
</div>
</div>
</div></div>
<!--猜你喜欢--><div class="guesslike">
<div class="title-ab">
<h4>猜你喜欢</h4>
</div>
<ul class="yourlike indyourlike"><li>
<a href="https://demo.yunec.cn/JBIEv-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/25f226b37c7397d90222f64d1e824e7d_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/JBIEv-g.html" target="_blank">飞利浦（PHILIPS）空气净化器KJ330F-C03(AC4076)香槟色家用除甲醛</a>
</div>
<a href="https://demo.yunec.cn/JBIEv-g.html" class="price" target="_blank">￥<span>2799.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/QTX86-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/33fa960831e505264aa2b2cf181ae025_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/QTX86-g.html" target="_blank">华为 麦芒5 全网通 4GB+64GB版 香槟金 移动联通电信4G手机 双卡双待</a>
</div>
<a href="https://demo.yunec.cn/QTX86-g.html" class="price" target="_blank">￥<span>2399.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/ciqNM-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/dbdb75b1f274b4622bb3f019f68684c0_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/ciqNM-g.html" target="_blank">戴森(Dyson)HP01白银 空气净化暖风器取暖器电暖气 无叶风扇 原装进口</a>
</div>
<a href="https://demo.yunec.cn/ciqNM-g.html" class="price" target="_blank">￥<span>5190.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/pczXZ-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/b1ffbbbcc2755b5e7c8d2171f42e659b_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/pczXZ-g.html" target="_blank">华为 HUAWEI P10 4G智能手机 钻雕金【现货】 全网通 4G +64G 标配</a>
</div>
<a href="https://demo.yunec.cn/pczXZ-g.html" class="price" target="_blank">￥<span>3788.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/ciqZQ-g.html" class="picbox" target="_blank">
<img src="https://demo.yunec.cn/" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/ciqZQ-g.html" target="_blank">测试商品，一分钱34</a>
</div>
<a href="https://demo.yunec.cn/ciqZQ-g.html" class="price" target="_blank">￥<span>0.01</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/aNVYK-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/22a7a0435563e934cb7ae5ead93f1faa_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/aNVYK-g.html" target="_blank">戴森(Dyson) 吸尘器 V6 Motorhead手持式家用除螨无线无绳</a>
</div>
<a href="https://demo.yunec.cn/aNVYK-g.html" class="price" target="_blank">￥<span>2990.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/znDvk-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/3fb22e1d136f8384634d0189ef9cf2fd_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/znDvk-g.html" target="_blank">小米5s Plus 全网通 高配版 6GB内存 128GB ROM 灰色 移动联通电信4G手机</a>
</div>
<a href="https://demo.yunec.cn/znDvk-g.html" class="price" target="_blank">￥<span>2599.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/LAaD2-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/20055de0bbf8ebb33d9d05e08c4d90da_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/LAaD2-g.html" target="_blank">OPPO A57 3GB+32GB内存版 玫瑰金 全网通4G手机 双卡双待</a>
</div>
<a href="https://demo.yunec.cn/LAaD2-g.html" class="price" target="_blank">￥<span>1599.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/JBIAz-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/17400ef2555417492e9b6d9f344a6c4e_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/JBIAz-g.html" target="_blank">vivo Xplay6 全网通6GB+128GB 移动联通电信4G手机 双卡双待 磨砂黑</a>
</div>
<a href="https://demo.yunec.cn/JBIAz-g.html" class="price" target="_blank">￥<span>4498.00</span></a>
</li>
<li>
<a href="https://demo.yunec.cn/owkhb-g.html" class="picbox" target="_blank">
<img src="view/default/images/index/37d811f62d4d88347a6cc7e6a76e2832_s.jpg" alt="">
</a>
<div class="elli">
<a href="https://demo.yunec.cn/owkhb-g.html" target="_blank">魅族5 魅蓝5 全网通4G智能手机 香槟金 2GB+16GB</a>
</div>
<a href="https://demo.yunec.cn/owkhb-g.html" class="price" target="_blank">￥<span>788.00</span></a>
</li>
</ul>
</div></div>
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
<script async="" charset="utf-8" src="view/default/js/xiankefu.js"></script><script>
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
<li class="shop"><a href="toCart" title="购物车"><span class="cartinfo">0</span></a></li>
<li class="ecode">
<a href="https://demo.yunec.cn/#">二维码</a>
<div class="ecode-box radius">
<img src="view/default/images/index/code.jpg" alt="">
</div>
</li>
<li class="telnum">
<a href="https://demo.yunec.cn/#">电话号码</a>
   <div class="tel-box radius"><span>0757-00000000</span></div>
</li>
<li class="totop"><a href="https://demo.yunec.cn/#">置顶</a></li>
</ul>
</div><script src="view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="view/default/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="view/default/js/main.js" type="text/javascript"></script>
<script src="view/default/js/good/good.js" type="text/javascript"></script>

<script>
$(function() {
    var isDev = true;
    function out(msg) { if(isDev) console.log(msg); }

    var cgyJson = null;
    $.getJSON("/category/getAll", function(json) {
        cgyJson = json;
        init_main_nav();
    });

    function init_main_nav() {
        if(cgyJson == null)
            return;
        $('.menu-mainnav').empty();
        // cgyJson下标为1的是第一层结点的list json
        var level_1_list = cgyJson['1'];
        // list 下标为0的是父节点的Category bean，
        // 之后的才是子节点的Category bean，所以要从index=1开始遍历
        for(var i = 1; i < level_1_list.length; i++) {
            var level_1_node = level_1_list[i];
            var li = $('<li></li>');
            var sortmaintitle = $('<div></div>').addClass('sortmaintitle');
            var title = $('<a></a>').attr({href: '/category/search/'+level_1_node.code, target: '_blank'}).text(level_1_node.title);
            var navsonbox = $('<div></div>').addClass('navsonbox');
            var nr = $('<div></div>').addClass('nr');
            var navson_classify = $('<div></div>').addClass('navson-classify'); // 二层节点加在这个里面
            sortmaintitle.append(title);
            navsonbox.append(nr);
            nr.append(navson_classify);
            li.append(sortmaintitle).append(navsonbox);
            $('.menu-mainnav').append(li);

            var level_2_list = cgyJson[level_1_node.cgy_id];
            if(level_2_list) {
                for(var j = 1; j < level_2_list.length; j++) {
                    var level_2_node = level_2_list[j];
                    var navson_classify_box = $('<div></div>').addClass('navson-classify-box');
                    var maintitle = $('<h3></h3>').addClass('maintitle');
                    var title_sub = $('<a></a>').attr({href: 'javascript:void(0);', target: '_blank'}).html(level_2_node.title + '<span>&gt;<span>');
                    var navson_classify_subtitle = $('<div></div>').addClass('navson-classify-subtitle'); // 第三层放这里

                    navson_classify.append(navson_classify_box);
                    navson_classify_box.append(maintitle).append(navson_classify_subtitle);
                    maintitle.append(title_sub);

                    var level_3_list = cgyJson[level_2_node.cgy_id];
                    if(level_3_list) {
                        for (var k = 1; k < level_3_list.length; k++) {
                            var level_3_node = level_3_list[k];
                            var title_sub_sub = $('<a></a>').attr({
                                href: 'javascript:void(0);',
                                target: '_blank'
                            }).text(level_3_node.title);

                            navson_classify_subtitle.append(title_sub_sub);
                        }
                    }
                }
            }
        }

    }

});
$(".nav .nav-classify").addClass("nav-classifyopaity");
 			$(function () {
 				loadLayer();
 			});
<!--jQuery(".slidebanner").slide({mainCell:".bd ul",titCell:".hd ul",autoPlay:true,autoPage:true});-->
jQuery(".slide-timeslimit").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:false,scroll:6,vis:6});
//秒杀计时
InterValObj1 = window.setInterval(function () {SetRemainTime(1);}, 1000); 
//侧栏浮动定位显示隐藏
$(window).scroll(function(){
var topH=$(".header").height()+$(".banner").height();
var footH=$(document).height()-$(".footer").height()-500;

if($(this).scrollTop()>topH-250 && $(this).scrollTop()<=footH){
$(".leftgood-bar").fadeIn(200);
}else{
$(".leftgood-bar").fadeOut(200);
}
});
setLeftBar();
function setLeftBar(){
if($(window).width()>1800){
$(".leftgood-bar").css("left",'150px');
}
if($(window).width()<=1800){
$(".leftgood-bar").css("left",'120px');
}
if($(window).width()<1600){
$(".leftgood-bar").css("left",'0px');
}
}
$(window).resize(function(){
setLeftBar();
});
$(".leftgood-bar .lgb").each(function(){
$(this).click(function(){
    $("body ,html").animate({scrollTop: $($(this).find("a").attr("name")).offset().top}, 500);
    
});
});
$(window).scroll(function(){
var scrollTop=$(window).scrollTop();
var len = $(".leftgood-bar").children().length;
for (var i = 0; i < len; i++) {
if(scrollTop+250>=$("#floor"+i).offset().top) {
$(".lgb").eq(i).addClass("onlgb").siblings().removeClass("onlgb");
}
}
});
//ie hask
var DEFAULT_VERSION = "8.0";
var ua = navigator.userAgent.toLowerCase();
var isIE = ua.indexOf("msie")>-1;
var safariVersion;
if(isIE){
    safariVersion =  ua.match(/msie ([\d.]+)/)[1];
}
if(safariVersion <= DEFAULT_VERSION ){
    $(".indyourlike li:nth-child(5n)").css("margin-right","0px");
$(".cont-item a:last-child").css("margin-right","0px");
$(".time-limit .slide-timeslimit .bd li:nth-child(6n)").children(" .nr").css("border-right","none");
}
</script>


<script src="view/default/js/layer.min.js"></script>
<div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img src="./view/default/images/icon-logo.png"><span>在线咨询</span></div>
<div id="XIANKEFU-PANEL" class="XIANKEFU-panel"><iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF" src="view/default/images/index/saved_resource.html"></iframe></div>
</body>
</html>