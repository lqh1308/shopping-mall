var vir_flag = 0;
var goods_amount;
var mostpoint = 50; //最多不超过每笔订单结算金额
var pointpay = 100; //每pointpay个积分可抵1元
var is_invoice=1;
var is_paypwd=false;
var $distpicker;

//地址联动
var $distpicker = $('#distpicker');

$(function(){
	//获取商品总价格
	goods_amount = parseInt($("#cartTotalPrice").val().replace(/,/g, ""));
	//获取实际支付价格
	calcTotal();
	//地址初始化
    $distpicker.distpicker({});
    
	loadLayer();
	$(".ul-pro-box li").each(function(){
		if($(this).index()%3==2){
			$(this).css("margin-right","0");
		}				
	});
	$(".slide-like-pro").slide({});		
	setTimeout(function() {
		get_coupon_list();					
	}, 100);
	

});

$("#loginmobile").change(function() {
	var mobile  = $.trim($(this).val());
	if (is_mobile(mobile) == false) {
		msg("请输入正确手机号码")
		return;
	}
	check_mobile(mobile, callback_check_mobile);
});

function callback_check_mobile(res) {
	if ($.trim($("#btnSendCode").data("act")) =='user_bind') {
		return false;
	}
	if(res.err && res.err !=''){
		//已注册
		$("#btnSendCode").data("act", 'login');	
	}
	else{
		$("#btnSendCode").data("act", 'reg');
	}
}

$("#btnlogin").click(function() {
	var mobile = $.trim($("#loginmobile").val()), smscode = $.trim($("#smscode").val()),
	act = $.trim($("#btnSendCode").data("act"));
	
	$.post(
	"user_api.html",
	{   
		act: act,
		authtype:1,//短信验证
		username: (act=='reg' ? '' : mobile),
		tel: mobile,
		smscode: smscode,
		password: '',
		repassword: '',
		agree: 1,
		isOauth: 0,
		authcode: '',
		autologin:1
	},
	function(data) {
		if (data.err != '') {
			msg(data.err);
		}
		else{
			msg("登陆成功");
			setTimeout(function() {
				window.location.reload();	
			},1500)												
		}
	},"json");

});

//发送验证码
$("#btnSendCode").click(function() {
	var act= $.trim($(this).data("act"))
	sendSms($(this)[0], 'sms_'+ (act=="user_bind" ?'login':act));		
})

$("#is_invoice a").click(function() {
	if ($(this).attr("id") == "1") {
		$("#invoiceinfo").slideDown(200);
	}
	else{
		$("#invoiceinfo").slideUp(100);
	}
});
	 
//优惠券
$(".h3dy .yhdyong").click(function() {
	$(this).find("i.icon-arrow").toggleClass("icon-down");
	$(".youhui-box").slideToggle(500);
});
	
$(".useful li").each(function() {
	$(this).click(function() {
		$(this).toggleClass("checked").siblings().removeClass("checked");
		inputdis();
	});
});

//输入余额、积分
$("#balance, #point").blur(function() {		
	///inputdis();
	//calcTotal();
});

//选中使用余额
$("#userbalance").click(function () {
	inputdis();
	calcTotal();
	$("#balance").css("display", $(this).is(":checked")?"inline-block":"none") ;				
});

//选中使用积分
$("#userpoint").click(function () {
	inputdis();
	calcTotal();
	$("#point").css("display", $(this).is(":checked")?"inline-block":"none") ;						
});

//结算
$(".btn-jiesuan").click(function() {
	/*
	if($("#btnSendCode").length>0 && $.trim($("#btnSendCode").data("act")) =='user_bind'){
		$("#loginmobile").focus();
		msg("请先绑定手机号码");return;
	}
	*/
	if(vir_flag<2) {
		//含实物
		if ($(".other-add").length==0) {
			msg("请先填写您的收货人信息");return;
		}
		if ($(".default-add").length==0) {
			msg("请选择您的收货地址");return;
		}
		if ($("#expresslist li a.selected").length==0) {
			msg("请选择配送方式");return;
		}
	}
	if ($("#payAmount").html() !=0 && $("#paylist li a.selected").length==0) {
		msg("请选择支付方式");return;
	}				
	
	if (is_paypwd && $.trim($("#cbkpaypwd").val()) == '') {
		msg("请填写支付密码");return;
	}
	//发票信息
	var invoice_title ='', invoice_con =''; 
	if ($("#is_invoice a.selected").attr("id") ==1) { //开启发票功能
		var sl_title = $("#invoice_tite_list a.selected");
		invoice_title = sl_title.attr("id") ==1 ? sl_title.html() : $.trim(sl_title.children().val());
		invoice_con = $("#invoice_con a.selected").attr("id");
		if (invoice_title=='') {
			msg("请填写发票抬头");return;
		}
		if (invoice_con =='') {
			msg("请填写发票内容");return;
		}
	}							
	
	/*
	var data ={
		addressId: $(".default-add").attr("id"),
		balance:$("#userbalance").is(":checked")? $.trim($("#balance").val()) :0 ,
		point : $("#userpoint").is(":checked")? $.trim($("#point").val()) :0 ,
		payType : $("#paylist li a.selected").val(),
		distributeMode : $("#expresslist li a.selected").attr("id"),
		paypwd : is_paypwd ? $.trim($("#cbkpaypwd").val()) : '',
		invoice_title: invoice_title,
		invoice_con : invoice_con,
		user_remark : $("#leavemess").val(),
		coupon_ids:getCouponIDs()//会员优惠券
	};
	*/
	
	var data = {
		addressId: $(".default-add").attr("id"),							//收获地址
		payType : $("#paylist li a.selected").data("type"),					//支付类型
		distributeMode : $("#expresslist li a.selected").attr("id"),		//配送方式
		remarks: $("#leavemess").val()
	}
	
	$(this).attr("disabled", "disabled");
	$.getJSON("/createUnPayOrder", data, function(res) {
		if( (res.statusCode != 200)) {
			msg('操作失败，' + res.err);
			return;
		}
		if( (res.url && res.url != '')) {
			window.location.href = res.url;
		}
		
		$(this).removeAttr("disabled");
	});	
});

//显示支付密码框
function inputdis() {
	if( $("#userbalance").is(":checked") || $("#userpoint").is(":checked") || $(".useful li").hasClass("checked")) {
		$(".result-box .lside .save-passw").show();
		is_paypwd= true;
	} else {
		$(".result-box .lside .save-passw").hide();
		is_paypwd=false;
	}
}

var is_count=1,//各状态数量
page = 1; //当前页码
//加载优惠券
function get_coupon_list() {		
	var ids_arr = Array();
	$(".goodinfor").each(function() {
		ids_arr.push($(this).attr('id'));
	})
 	var goods_ids = ids_arr.toString();
 				 
	$.getJSON("myquan.html", {act: "get_coupon", page:page,num:100, goods_ids:goods_ids, is_count:is_count,type:0,is_available:1}, function(res) {
		var html ='';
		if(res.err) {
		msg("加载优惠券失败，".res.err);return;
		}
		var n =0;
		$.each(res.data, function(k, v) {
			n++;
			html +='<div class="cp-it '+(n%5 ==0 ? 'last' :'')+(v.is_selected==1 ? ' selected' :'')+(v.is_vaild==0 ? ' disabled' :'')+ '" id="'+v.id+'" data-cid="'+v.cid+'" data-amount="'+v.amount+'"><div class="hd">';
			html +='<span class="amount">￥<b>'+v.amount+'</b></span>';
			html +='<span class="amount_reached">满 '+v.amount_reached+'元 可用</span>';
			html +='<span class="date">'+v.date_start+'-'+v.date_end+'</span></div>';
			html +='<div class="bt"><div class="option">';
			html +='<span><label>限品类</label>：<b class="tit" title="'+v.name+'">'+v.name+'</b></span>';
			html +='<span><label>限平台</label>：'+v.client_name+'</span>';
			html +='<span><label>限等级</label>：'+v.grade_name+'<i class="tip-down"></i></span>';
			html +='<span><label>券编号</label>：'+v.code+'</span></div></div><i class="icon-check-zf"></i></div>';
		});
	
		if(is_count ==1){
			is_count=0;
			$("#couponnum").html(res.count[0]);
		}
		if (res.data.length==0) {
			return;
		}
	
		$(".couponlist").append(html);						
		calcTotal();
		sumSelected();
		page++; 
	});	
}
	 			
//选择优惠券
$(".couponlist").each(function() { 				
	$(this).on("click",".cp-it",function() {
		var t =$(this);
		if(t.hasClass("disabled")) {
			return;
		}
	
		var cid = t.data("cid");		
		if(t.hasClass("selected")){
			t.removeClass("selected");
		}else {											
			var ids = getSelectedCoupon(); //已选
			if(ids !='' && t.hasClass("selected") ==false) {
				$.getJSON("myquan.html", {act: "select_coupon", id: cid, ids: ids}, function(res) {
					var html ='';
					if(res.err) {
						msg("选择优惠券失败，".res.err);return;
					}
					if(res.data && res.data.length > 0) {
						$.each(res.data, function(k, v) {
							var coupon = $(".couponlist>.selected[data-cid='"+v+"']");
							$(".couponlist>.selected[data-cid='"+v+"']").each(function() {
								if($(this).attr("id") != t.attr("id")) {
								$(this).removeClass("selected");
								}
							})									
						});								
					}
					sumSelected();
					calcTotal();
				});	
			}
		
			t.addClass("selected");
		}
	
		sumSelected();
		calcTotal();
	});
}); 

function sumSelected(num) {
	num = num || $(".couponlist>.selected").length;
	$("#couponselected").html("已选<b class='orange-bold'> "+ num + "</b> 张").css("display", (num == 0 ? "none" :"inline-block") );
}

//获取优惠券id
function getSelectedCoupon(){
	var ids = '';
	$(".couponlist>.selected").each(function() {
	ids += $(this).data("cid") + ",";
	});
	if (ids !='') {
	ids = ids.substr(0, ids.length - 1);
	}
	return ids;
}

//获取会员优惠券id
function getCouponIDs(){
	var ids = '';
	
	$(".couponlist>.selected").each(function() {
	ids += $(this).attr("id") + ",";
	});
	if (ids !='') {
	ids = ids.substr(0, ids.length - 1);
	}
	return ids;
}

