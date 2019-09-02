$(function() {
	$(".cart-tr:last-child").css("border-bottom", "none");
	$(".slide-like-pro .hd li:first-child").css("border-left", "none");
	$(".goods-title-pic:last-child").css("border-bottom", "none");
	$(".good-num:last-child").css("border-bottom", "none");
	$(".goods-price:last-child").css("border-bottom", "none");
	$(".xiaoji:last-child").css("border-bottom", "none");

	//购物数量改变时
	$("#list").on("change", ".result", function() {
		var n = parseInt($(this).val());
		var p = $(this).parent();
		var chk = p.siblings(".cart-one").children("input");
		var price = p.prev().children(".g-price").html();
		p.next().children(".subtotal").html((n * price).toFixed(2));
		updateCart(p.parent().attr("id"), p.parent().data("spec"), n);
		chk.prop("checked", "checked");
		if(chk.parents(".cart-tr").hasClass("it-selected") == false) {
			chk.parents(".cart-tr").addClass("it-selected");
		}
		sumShopping();
	})
	
	//得到商品
	var carthtml= $("#cartTemplate").html();
	$("#list").html("");
	show_cartinfo(carthtml);
	
	//移除商品
	$("#list").on("click", ".removeGoods", function() {
		var p = $(this).parent().parent();
		var ids = p.attr("id");
		layer.confirm('确定要删除吗', function() {
			removeGoods(ids);
		});
	})
	
	//批量移除商品
	$(".account").on("click", "#removebatch", function(){
		var ids = '';
		var spec = '';
		$("#list input[name='chk_list']:checked").each(function() {
			ids += $(this).parent().parent().attr("id") + "@";
			spec += $(this).parent().parent().data("spec") + "@";
		});
		if(ids == '') {
			return;
		}
		ids = ids.substring(0, ids.length - 1);
		layer.confirm('确定要删除吗', function(index) {
			removeGoods(ids, spec);
			top.layer.close(index);
		});
	})
	
	//更新商品选择状态
	$("#list").on("click", "input[name='chk_list']", function() {
		updateStatus($(this));
		setall(".btn-checkall", "#list");
	})
		
});



function show_cartinfo(carthtml) {
	$.getJSON("/getUserCart", function(res) {
		if(res.statusCode != 200) {
		} else {
			$("#selectnum").html(res.data.nmount);
			$("#total").html(res.data.pmount);
			$(".cartinfo").text(res.data.nmount);
			var $html='';	
			if (res.data !=false) {					
				$.each(res.data.carts, function(k, v) {
					$html += carthtml;
					if(v.isCollected == "1") {
						v.collectState = "取消收藏";
						v.collectClass = "delfav";
					}
					if(v.isCollected == "0") {
						v.collectState = "加入收藏";
						v.collectClass = "addfav";
					}
					$html = $html.replace(/\[id\]/g, v.id).replace(/\[goods_id\]/g, v.goodId).replace(/\[spec_name\]/g, v.goodName).replace(/\[url\]/g, "#").replace(/\[name\]/g, v.goodName).replace(/\[thumb\]/g, v.goodLogoUrl).replace(/\[price\]/g, v.showPrice)
								 .replace(/\[sumPrice\]/g, v.totalPrice).replace(/\[num\]/g, v.purchaseNum).replace(/\[isCollected\]/g, v.isCollected).replace(/\[collectState\]/g, v.collectState).replace(/\[collectClass\]/g, v.collectClass);
				}); 
			}
			
			$("#list").html($html); 
		}
	});
}

	//商品加入收藏
	$("#list").on("click", ".addfav", function() {
		$(this).click(function() {
			var t =$(this);
			var p = $(this).parent().parent();
			var ids = p.attr("id");
			var goodId = p.data("goodid");
			$.getJSON(
				"/addfav", 
				{
					id: ids,
					goodId: goodId
				}, 
				function(res) {
					if(res.statusCode == 200) {
						msg("收藏成功");
						t.replaceWith('<a href="javascript:void(0);" class="delfav" data-isCollected="1">取消收藏</a>')
					} 
					else if( (res.url && res.url != '')) {
						msg('操作失败，请先登陆。');
						setTimeout("window.location.href="+res.url, 3000);
					}
					else {
						msg("收藏失败，" + res.err);
					}
			});
		});
	})
	

	
	
	//取消收藏
	$("#list").on("click", ".delfav", function() {
		$(this).click(function() {
			var t =$(this);
			var p = $(this).parent().parent();
			var ids = p.attr("id");
			var goodId = p.data("goodid");
			$.getJSON(
				"/delfav",
				{
					id: ids,
					goodId: goodId
				}, 
				function(res) {
					if(res.statusCode == 200) {
						msg("取消收藏成功");
						t.replaceWith('<a href="javascript:void(0);" class="addfav" data-isCollected="0">加入收藏</a>')
					} 
					else if( (res.url && res.url != '')) {
						msg('取消收藏操作失败，请先登陆。');
						setTimeout("window.location.href="+res.url, 3000);
					}
					else {
						msg("取消收藏失败，" + res.err);
					}
				});
		});
	});

//去结算
function gotoOrder() {
	var total=$.trim($("#selectnum").html());
	if (total=='' || parseInt(total)==0) {
		msg("请选择要结算的商品");
		return;
	}
	//获取选中商品id和商品数量
	var cartIds = getCheckedCarts();
	$.getJSON("/calculateCarts", {'cartIds':cartIds}, function(res) {
		if(res.url != null && res.url != '') {
			window.location.href = res.url;
		}
	})
	
	//var a = "<a href='/gOrder?cartIds=" + cartIds + "'><p></p></a>";
	//window.location.href = $(a)[0];
};

//取消收藏
function delFav(goodId, t){
	$.getJSON(
		"/delfav",
		{
			goodId: goodId
		}, 
		function(res) {
			if(res.statusCode == 200) {
				msg("取消收藏成功");
				//t.parent().parent().remove();
				$(t).parent().parent().remove();
			} 
			else if( (res.url && res.url != '')) {
				msg('取消收藏操作失败，请先登陆。');
				setTimeout("window.location.href="+res.url, 3000);
			}
			else {
				msg("取消收藏失败，" + res.err);
			}
	});
}

//将收藏的商品加入购物车
function addCart(goodId, t) {
	$.getJSON(
		"/addToCart",
		{
			goodId: goodId,
			isCollected: 1
		}, 
		function(res) {
			if(res.statusCode == 200) {
				msg("加入购物车成功");
				show_cartinfo(carthtml);
			} 
			else if( (res.url && res.url != '')) {
				msg('加入购物车失败，请先登陆。');
				setTimeout("window.location.href="+res.url, 3000);
			}
			else {
				msg("加入购物车失败，" + res.err);
			}
	});
}
	
//更新购物车商品状态
function updateStatus(t) {
	var p = t.parents(".cart-tr");
	var gid = p.attr("id"),
		spec = p.data("spec"),
		status = t.prop("checked") ? 1 : 0;
	var data = {
		act: 'set_cart_status',
		gid: gid,
		spec: spec,
		status: status
	}
	$.getJSON("/cart.html", data, function(res) {
		if(res.err && res.err != '') {
			msg('操作失败，' + res.err);
		}
	});
	if(status == 1) {
		p.addClass("it-selected");
	} else {
		p.removeClass("it-selected");
	}
	sumShopping();
}

//更新购物车
function updateCart(gid, spec, total) {
	var data = {
		id: gid,
		purchaseNum: total
	};
	$.getJSON("/changeCartGoodNum", data, function(res) {
		if(res.statusCode == 200) {
			//$(".cartinfo").html($.cookie("cnum"));
			msg('操作成功');
		} else {
			msg('操作失败，' + res.err);
		}
	});
}

//保存收货地址
function saveconsignee() {
	var id = $.trim($("#id").val()),
	name = $.trim($("#sh-name").val()),
	mobile = $.trim($("#sh-phone").val()),
	tel = $.trim($("#sh-tel").val()),
	address = $("#province").val() + " " + $("#city").val() + " " + $("#district").val();
	detailAddress = $.trim($("#sh-address").val()),
	isdefault = $("#isdefault").is(":checked")? 1:0;

	if (name=='') {
		msg("请填写收货人");
		return;
	}
	else
	{
		var errorFlag = false;
		if(!is_consignee(name)){
			errorFlag = true;
		}else if(name.search(/·{2,}/) > -1){
			errorFlag = true;
		}
		if(errorFlag){
			msg("收件人姓名仅支持中文或英语");
			return;
		}
	}
	if (mobile=='') {
		msg("请填写手机号码");
		return;
	}
	else if (!is_mobile(mobile)) {
		msg("手机号码格式不正确");
		return;
	}
	if (tel!='' && !is_tel(tel)) {
		msg("固定电话格式不正确");
		return;
	}
	if (address=='' || address.length < 3) {
		msg("请选择所在地区");
		return;
	}
	if (detailAddress =='') {
		msg("请填写详细地址");
		return;
	}
	var data={
		id:id,
		username:name,
		phone:mobile,
		fixPhone:tel,
		location:address,
		detailAddress:detailAddress,
		isDefault:isdefault
	}
	$("#saveconsignee").attr("disabled", "disabled");
	$.getJSON("/addAddress", data, function(res) {
		$("#saveconsignee").removeAttr("disabled");
		if(res.statusCode != 200) {
			msg('操作失败，' + res.err);return;
		}
		else if( (res.url && res.url != '')) {
			msg('操作失败，您还未登陆');
			//setTimeout("window.location.href='"+res.url+"'",3000);
		}
		else
		{
			msg("保存成功");			
			$("#mask,.edit-address").hide();
			//address = $("#store-selector .text>div").html()+address;
			if (isdefault==1) {
				$("li.other-add").find(".moblie").siblings("span").html('');
			}
			if (id=='' || id=='0') {
				id = res.res;
				$(".sh-address ul li.other-add").removeClass("default-add");
				var html= '<li class="other-add default-add" id="'+ id+'" data-cityid="'+curArea.curCityId+'">';
				html += '<div class="add-box"><span class="remove vivi-blue" onclick="removeAddr('+id+');">X</span>';
				html += '<div class="name-add"><span class="name">'+name+'</span><span class="add-rside"></span></div>';
				html += '<div class="elli add-detail"><p title="'+address+detailAddress+'">'+address+detailAddress+'</p></div>';
				html += '<div><span class="moblie">'+mobile+'</span><span style="margin-left: 30px;">'+(isdefault==1?'默认地址':'')+'</span>';
				html += '<a href="javascript:void(0);" onclick="editAddr('+id +');" class="chang-default change vivi-blue">修改</a></div></div><i class="icon-check"></i></li>';
				$(".sh-address .add-add").before(html);
			} else{				
				$("#"+id).data("cityid", curArea.curCityId).find(".name").html(name);
				$("#"+id).find(".moblie").html(mobile);
				if (isdefault==1) {
					$("#"+id).find(".moblie").siblings("span").html('默认地址');
				} else {
					$("#"+id).find(".moblie").siblings("span").html('');
				}
				
				$("#"+id).find(".add-detail").children().attr("title", address+" "+detailAddress).html(address+" "+detailAddress);
			}			
		}		
	});
	 
}

//关闭窗口
$("i.close-modbox").click(function(){
	$("#mask,.modbox").hide();
});


//新增地址
function addAddr(){
	$("#edit-box-title").text("新增配送信息");
	//初始化地址信息
	$distpicker.distpicker('initData', {});
	$("#mask").show();$(".edit-address").slideDown(200);
	
	$("#id").val('');
	$("#sh-name").val('');
	$("#sh-phone").val($("#user_mobile").val());
	$("#sh-tel").val('');
	$("#district").val('');
	$("#sh-address").val('');
	$("#isdefault").removeAttr("checked");	
	
	location_init();
};

//编辑地址
function editAddr(id){
	if (id ==undefined || id==0) {
		return;
	}
	$("#edit-box-title").text("修改配送信息");
	$("#mask").show();$(".edit-address").slideDown(200);
	$("#saveconsignee").attr("disabled", "disabled");
	
	$.getJSON("/getAddress", {addressId:id}, function(res) {
		if( res.statusCode != 200 ) {
			msg('加载地址失败，' + res.err);
			return;
		} else {
			$("#id").val(id);
			$("#sh-name").val(res.data.username);
			$("#sh-phone").val(res.data.phone);
			$("#sh-tel").val(res.data.fixPhone);
			//$("#district").val(res.data.location);
			$("#sh-address").val(res.data.detailAddress);
			$("#isdefault").prop("checked",res.data.isDefault==1);	
			var addressArr = res.data.location.split(" ");
			var data = {
		        province: addressArr[0],
		        city: addressArr[1],
		        district: addressArr[2]	
			}
			$distpicker.distpicker('initData', data);
			/*
			curArea.curProvinceId = res.data[0].province;
			curArea.curCityId = res.data[0].city;
			curArea.curAreaId = res.data[0].area;
			curArea.curTownId= res.data[0].town;
			*/
			//chooseProvince(curArea.curProvinceId);
			page_load=true, edit_init=true;
		}
		$("#saveconsignee").removeAttr("disabled");
	});
};

//删除地址
function removeAddr(id) {
	layer.confirm('确定要删除吗', function(index) {	
		var d= $("li.default-add");
		$.getJSON("/delAddress", {addressId:id}, function(res) {
			if( res.statusCode != 200 ) {
				msg('操作失败，' + res.err);return;
			}
			else if( (res.url && res.url != '')) {
				msg('操作失败，您登陆超时了，请重新登陆。');
				setTimeout("window.location.href="+res.url,3000);
			}
			else
			{
				msg('删除成功');
				$("#"+id).remove();
			}
			d.addClass("default-add");
			$("#saveconsignee").removeAttr("disabled");
		});	
		top.layer.close(index);
	});
}
//选择地址
$(".sh-address ul li.other-add").each(function() {
	$(this).click(function() {
		$(this).addClass("default-add").siblings().removeClass("default-add");
	});
});

//支付密码
$("#setpaypwd a").click(function() {
	$("#mask").show(); $("#edit-paypwd").slideDown(200);
});

//计算订单金额   使用顺序  优惠券>积分>余额
function calcTotal() {
	var sum =0;	
	var expfee = parseFloat($("#expfee").html());
	var payAmount = goods_amount + expfee; //应付金额
	var point_use = 0;//使用积分 
	var point = parseFloat($("#point").siblings().children("b").html()); //现有积分
	var balance_use = 0;//使用余额
	var balance = parseFloat($("#balance").siblings().children("b").html()); //现有余额
	var point_amount = 0,balance_amount =0,coupon_amount = 0; //抵用的金额
	
	//优惠券
	coupon_amount = getCouponAmount();
	payAmount = payAmount - coupon_amount;
	
	//积分 
	if($("#userpoint").is(":checked")) {
		var point_amount = parseInt(payAmount * mostpoint * 0.01),
		    point_use = point_amount * pointpay;
		if(point_use > point) //小于现有积分
		{
			point_use = point - point % pointpay; //使用积分
			point_amount = point_use/pointpay;
		}
		point_amount = point_amount.toFixed(2);		
		payAmount = payAmount - point_amount;
		$("#point").val(point_use);
	}
	else
	{
		$("#point").val('');
	}

	//余额
	if($("#userbalance").is(":checked") && payAmount>0) {
		balance_use = payAmount > balance ? balance : payAmount;//使用余额
		payAmount = payAmount - balance_use;
		$("#balance").val(balance_use);
	}
	else
	{
		$("#balance").val('');
	}
	
	//显示使用的情况
	//优惠券
	if (coupon_amount >0) {
		if ($("#coupon-offset").length==0) {
			$(".calu-box").append('<p class="slivergrey"><span>优惠券抵用：</span><span class="txtmoney">￥<b id="coupon-offset">-'+ coupon_amount+'</b></span></p>');
		}
		else
		{
			$("#coupon-offset").html("-"+coupon_amount);
		}
	}
	else
	{
		$("#coupon-offset").parents(".slivergrey").remove();
	}
		
	if ($("#userpoint").is(":checked")) {
		if ($("#point-offset").length==0) {
			$(".calu-box").append('<p class="slivergrey"><span>积分抵用：</span><span class="txtmoney">￥<b id="point-offset">-'+point_amount +'</b></span></p>');
		} else{
			$("#point-offset").html("-"+point_amount);
		}							
	}
	else{
		$("#point-offset").parents(".slivergrey").remove();
	}
	if ($("#userbalance").is(":checked")) {
		if ($("#balance-offset").length==0) {
			$(".calu-box").append('<p class="slivergrey"><span>余额抵用：</span><span class="txtmoney">￥<b id="balance-offset">-'+ balance_use+'</b></span></p>');
		} else{
			$("#balance-offset").html("-"+balance_use);
		}							
	}
	else{
		$("#balance-offset").parents(".slivergrey").remove();
	}	
		
	$(".txtmoney b").each(function() {
		sum+= parseFloat($.trim($(this).html()).replace(/,/g, ""));
	});
	$("#payAmount").html(sum);
	if (sum == 0)
	{
	  $("#paylist").parent().hide(200);
	}
	else
	{
		$("#paylist").parent().slideDown(200);
	}
}

//获得优惠券金额
function getCouponAmount() {
	var coupon_amount = 0;	
	if($("#couponlist").length>0)
	{
		$("#couponlist>.selected").each(function() {
			coupon_amount += parseInt($.trim($(this).data("amount")));
		});
	}
	return coupon_amount;
}

$(".zhifu-box ul.zfb li").each(function() {
	$(this).click(function() {
		$(this).find("a").addClass("selected").end().siblings().find("a").removeClass("selected");
		$(this).children("i.icon-check-zf").css("display", "block").end().siblings().children("i").css("display", "none");
	});
});

//获取运费
$("#expresslist li a").click(function() {
	$.getJSON("/order.html", {act:'get_expfee',id:$(this).attr("id"), cityid: $(".sh-address .default-add").data("cityid") }, function(res) {
		if(res.err && res.err != '') {
			msg('操作失败，' + res.err);return;
		}
		else
		{
			$("#expfee").html(res.res);
			calcTotal();
		}
	});	
});




