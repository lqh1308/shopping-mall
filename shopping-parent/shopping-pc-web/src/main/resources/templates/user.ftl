<!DOCTYPE html>
<!-- saved from url=(0031)https://demo.yunec.cn/user.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>我的账户 - 云EC电商系统</title>
<link rel="stylesheet" href="/view/default/css/common.css">
<link rel="stylesheet" href="/view/default/css/center.css">

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
}</style><link rel="stylesheet" href="/view/default/css/user/layer.css" id="layui_layer_skinlayercss" style=""></head>

<body><div class="header">
<div class="head-top">
<div class="nb">
<!--<span style="color:#e01;font-size:14px;">演示站，请勿购物！！&nbsp; 前台账号 yunec&nbsp; &nbsp; <span style="color: rgb(238, 0, 17); font-size: 14px;">密码&nbsp;</span>666666&nbsp; &nbsp;后台地址：&nbsp;<a href="https://demo.yunec.cn/admin.html" target="_self" title="https://demo.yunec.cn/admin.html">https://demo.yunec.cn/admin.html</a></span><div class="rside" style="float:right">-->
<ul class="head-ul">
<#if isLogin==true>
<li><a href="/user">${username}</a></li>
<li><a href="logout">退出</a></li>
<#else>
<li><a href="login">登录</a></li>
<li><a href="register">注册</a></li>
</#if>

<li><a href="myOrder">我的订单</a></li>
<li><a href="/user">会员中心</a></li>
</ul>
</div>
</div>
</div>
<div class="head-bot">
<div class="nb">
<div class="web-title-container">
<!--<a href="https://demo.yunec.cn/index.html" class="logo"><img src="./我的账户 - 云EC电商系统_files/logo.png" alt=""></a>-->
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
<ul class="cart-slidedown" id="cart-list">
<li id="[goods_id]" data-spec = "[spec_name]">
<div class="cart-pro">
<a href="[url]" class="pic-box"><img src="[thumb]" alt="60*60"></a>
<div class="cart-pro-num elli">
<a href="[url]">[name]</a>
</div>
<div class="close-price">
<button class="close delgoods"></button>
<p class="red">￥<span class="mincart-price">[price]</span>x<span class="mincart-num">[num]</span></p>
</div>
</div>
</li>
</ul>
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
<div class="nav-classify">
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
</div><div class="center-body">
<div class="nb">
<div class="center-lside"><div class="center-menu">
<h3><i class="icon-myaccount"></i><a href="https://demo.yunec.cn/user.html">我的账户</a></h3>
<div class="title-all">
<div class="title">
<div class="title-navbar">
<i class="icon-center"></i>订单中心<span class="add-reduce">-</span>
</div>
<ul>
<li>
<a href="https://demo.yunec.cn/myorder.html">我的订单</a>
</li>
<li>
<a href="https://demo.yunec.cn/mycomment.html">我的评价</a>
</li>
<li>
<a href="https://demo.yunec.cn/fav.html">我的收藏</a>
</li>
<li>
<a href="https://demo.yunec.cn/service.html">退换货</a>
</li>
</ul>
</div>
<div class="title">
<div class="title-navbar">
<i class="icon-account"></i>账户信息<span class="add-reduce">-</span>
</div>
<ul>
<li>
<a href="https://demo.yunec.cn/mymoney.html">我的钱包</a>
</li>
<li>
<a href="https://demo.yunec.cn/mypoint.html">积分</a>
</li>
<li>
<a href="https://demo.yunec.cn/myquan.html">优惠券</a>
</li>
<li>
<a href="https://demo.yunec.cn/userinfo.html">个人信息</a>
</li>
<li>
<a href="https://demo.yunec.cn/address.html">收货地址</a>
</li>
<li>
<a href="https://demo.yunec.cn/updatepwd.html">账户安全</a>
</li><li>
<a href="https://demo.yunec.cn/dt.html">分销</a>
</li>	</ul>
</div>
</div>
</div>
<div class="hotline-box box-style"> <i class="icon-tel"></i>
<h3>客服热线<span class="tel"></span></h3></div>
<div class="messques-box box-style">
<a href="https://demo.yunec.cn/n-help.html">
<i class="icon-question"></i>	<h3>帮助中心<span>Help Center</span></h3>  </a>
</div></div>
<div class="center-rside">
<div class="cen-top">
<div class="user-cart">
<div class="user-detail">
<div class="headvsname">
<a class="touxiang" href="https://demo.yunec.cn/userinfo.html"><img src="/view/default/images/userDefaultPic.jpg" alt="${username}" width="80" height="80">
</a>
<p class="username">您好！${username}</p>
</div>
<div class="user-info">
<div class="left">
<p>会员等级：<a href="https://demo.yunec.cn/user.html#">老铁</a></p>
<p>余额：<a href="https://demo.yunec.cn/mymoney.html">￥0.00</a></p>
</div>
<div class="right">
<p>积分：<a href="https://demo.yunec.cn/mypoint.html">0</a></p>
<!--<p>优惠券：<a href="#">3</a></p>-->
</div>
</div>
</div>
<div class="user-function">
<ul>
<li class="odd marbot">
<a href="/myOrder?state=0">
<i class="icon-payment"></i>
<span>待付款 <#if (unPay?size>0)>${unPay?size}<#else>0</#if></span>
</a>
</li>
<li class="marbot">
<a href="/myOrder?state=1">
<i class="icon-shipments"></i>
<span>待发货<#if (unDeliver?size>0)>${unDeliver?size}<#else>0</#if></span>
</a>
</li>
<li class="odd">
<a href="https://demo.yunec.cn/myorder.html?t=2">
<i class="icon-receipt"></i>
<span>待收货 <#if (unReceive?size>0)>${unReceive?size}<#else>0</#if></span>
</a>
</li>
<li>
<a href="https://demo.yunec.cn/myorder.html?t=3">
<i class="icon-evaluate"></i>
<span>待评价 <#if (unEvaluate?size>0)>${unEvaluate?size}<#else>0</#if></span>
</a>
</li>
</ul>
</div>
</div>
</div>
<div class="cen-center center1">
<h2 class="borbot"><i class="icon-redline"></i>最近订单<a href="https://demo.yunec.cn/myorder.html" class="view-more">全部订单&gt;</a></h2>
<div class="dingdan"> 
</div>
</div>
<div class="cen-bottom" id="slide-change">
<h2 class="borbot"><i class="icon-redline"></i>最近浏览<a href="javascript:void(0);" class="view-more next">换一组&gt;</a></h2>
<div class="bd">
<div class="dlList"></div>
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
<li class="shop"><a href="toCart" title="购物车"><span class="cartinfo">0</span></a></li>
<li class="ecode">
<a href="https://demo.yunec.cn/user.html#">二维码</a>
<div class="ecode-box radius">
<img src="/view/default/images/code.jpg" alt="">
</div>
</li>
<li class="telnum">
<a href="https://demo.yunec.cn/user.html#">电话号码</a>
   <div class="tel-box radius"><span>0757-00000000</span></div>
</li>
<li class="totop"><a href="https://demo.yunec.cn/user.html#">置顶</a></li>
</ul>
</div><script src="/view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/view/default/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="/view/default/js/main.js" type="text/javascript"></script>
      <script>
      	$(".center-menu li.title").each(function(){
      		$(this).click(function(){
      		
      		});
      	});
		$(function () {
		loadLayer();
		//加载购物车
		show_cartinfo();
		});
      	$("#slide-coupon").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",vis:1});
      	$("#slide-change").slide({ mainCell:".dlList", effect:"leftLoop",autoPage:true,scroll:5,vis:5});	
      </script>



<div id="XIANKEFU-BAR" class="XIANKEFU-bar XIANKEFU-bar-style1"><img src="/view/default/images/icon-logo.png"><span>在线咨询</span></div><div id="XIANKEFU-PANEL" class="XIANKEFU-panel"><iframe allowtransparency="true" frameborder="0" scrolling="no" name="XIANKEFU_SELF" src="./我的账户 - 云EC电商系统_files/saved_resource.html"></iframe></div><script src="/view/default/js/layer.min.js"></script></body></html>