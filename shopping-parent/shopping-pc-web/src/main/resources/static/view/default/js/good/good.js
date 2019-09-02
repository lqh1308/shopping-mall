//商品分类展示模块 商品一级分类集
var goodTopCategoryList = [];

$(function(){
	getBannerWall();
});

//背景轮播墙
function getBannerWall() {
	$.getJSON(
		"/getBrandWall", 
		function(res) {
			if(res.statusCode == 200) {
				displayBannerWall(res.data);
			}
		});
}


//商品分类展示板块
/**
 * 查询前 num 个商品一级分类， num为空则查询所有
 */
function getTopCategory(num) {
	
}

/**
 * 查询前 num 个一级分类对应的二级分类， num为空查询所有
 */
function getSecondCategory(num) {
	
}

/**
 * 查询前 num 个一级分类对应的品牌， num为空查询所有
 */
function getBrand(num) {
	
}

/**
 * 查询前 num 个一级分类对应的商品， num为空查询所有
 */
function getGood(num) {
	
}



function displayBannerWall(banners) {
	var bannerBdHtml = "<ul>";
	var bannerHdHtml = "<ul>";
	for(var i = 0; i < banners.length; i++) {
		bannerBdHtml += "<li><a href=# style='background:url(" + banners[i].imgUrl + ") no-repeat top center'></a></li>";
		bannerHdHtml += "<li class=''>" + (i+1) + "</li>";
	}
	bannerBdHtml += "</ul>";
	bannerHdHtml += "</ul>";
	
	$(".slidebanner .bd").append($(bannerBdHtml));
	$(".slidebanner .hd").append($(bannerHdHtml));
	
	$(".slidebanner").slide({mainCell:".bd ul",titCell:".hd ul",autoPlay:true,autoPage:true});
}