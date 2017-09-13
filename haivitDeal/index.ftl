	<#include "../inc/head_base.ftl"/>
	<#include "../inc/head_jq.ftl"/>
	<#include "../inc/head_weui.ftl"/>
	<#include "../inc/head_ng.ftl"/>
	<#include "../inc/head_var.ftl"/>
	
	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/haivitDeal.css?version=342343566">
	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css?version=3423432344">
</head>
<body  ng-controller="ctrl">
    <!--头部-->
	<!--<header class="back-header weui-flex bg-white">-->
	    <!--<span class="back-header-icon flex_item1"></span>-->
	    <!--<h1 class="back-header-h1 flex_item4">永鑫商城</h1>-->
	    <!--<a class="flex_item1 header-right"></a>-->
	<!--</header>-->
	<nav class="classify_nav">
		<ul>
			<li  data-base="1" ng-click="nav_click(-1)"><span class="nav_msg" ng-class="{'theme_sc theme-borBottom-color':tab==-1}">首页</span></li>
			<li data-base="1" ng-repeat="item in json.type_list" ng-click="nav_click($index)" ><span class="nav_msg" ng-bind="item.name" ng-class="{'theme_sc theme-borBottom-color':tab==$index}"></span></li>
			<!--<li data-base="2">理财商品</li>
			<li data-base="2">普通商品</li>
			<li data-base="2">兑换商品</li>-->
		</ul>
	</nav>
    <!--轮播区-->
    <!--swiper容器[可以随意更改该容器的样式-->
	<div class="fix_containner">
		<div class="swiper-container" style="width:100%;margin-top:0;">
			<div class="swiper-wrapper">
				<div class="swiper-slide" ng-repeat="item in swipers">
					<img src="{{ item.pic_path}}" style="width:100%;height:11rem" ng-click="toAd(item)"/>
				</div>
			</div>
		</div>
		<div ng-show="tab==-1">
			<!--通告区-->
			<div class="weui-row bg-white nav_form mar-t1">
				<div class="weui-col-20 mar-l2" id="box_title">
					<img src="${json_config.oss_common_url}/wap/images/form.png" alt="" style="width:16px">
					<span class="text-font3">公告</span>
				</div>
				<div class="weui-col-75">
					<div class="nav_form_title">
						<ul id="title_msg">
							<li ng-repeat="item in notices" ng-bind="item.name" ng-click="toArticle(item.id)"></li>
						</ul>
					</div>
				</div>
				<div class="weui-col-5 text-r"><span class="icon icon-angle-right"></span></div>
			</div>
			<!--导航区-->
			<div class="text-c bg-white mar-t1 pad-t2 pad-b2">
				<div class="grid">
					<div class="grid_item nav_item" ng-repeat="item in ads.nav" ng-click="toAd(item)">
						<img ng-src="{{item.pic_path}}" alt="">
						<p ng-bind="item.title"></p>
					</div>
				</div>
			</div>
		</div>
		<!--产品展示区-->
		<div class="pad-all2 bg-white mar-t3" ng-show="tab==-1">
			<p class="goods_title theme-borLeft-color">特惠区</p>
		</div>
		<div class="goods mar-t3">
			<div class="goods_con" ng-repeat="item in deal_list" ng-click="getDealDetail(item.id)">
				<div class="goods_item2">
					<!--<div class="goods_item2_title"></div>-->
					<img src="{{ item.index_img }}" alt="" style="width:100%;height:100%">
				</div>
				<div class="goods_msg">
					<h4 ng-bind="item.name"></h4>
					<p>
						<span class="sc-text-warning text-font1">￥</span>
						<span class="goods_msg_price">{{item.price}}</span>
						<span class=" mar-l1 text-font1 sc-text-gray" style="text-decoration:line-through">原价：{{item.origin_price}}</span>
					</p>
				</div>
				<div class="goods_info">
					<span class="text-font1 sc-text-gray">库存：{{item.number}}</span>
				</div>
			</div>

			<div style="clear:both"></div>
			<div class="weui-loadmore loadMore hide">
				<i class="weui-loading"></i>
				<span class="weui-loadmore__tips">正在加载</span>
			</div>
			<div class="weui-loadmore mar-b0" ng-hide="has_data">
				<span class="weui-loadmore__tips">没有更多商品了哦</span>
			</div>
		</div>
	</div>
	
    <!--底部导航栏-->
	<div class="weui-tabbar" id="footer">
		<div class="weui-tabbar">
			<a href="{{combineUrl(item.url,item.app_module_action_param)}}"   class="weui-tabbar__item" ng-repeat="item in json.menu_1">
				<div class="weui-tabbar__icon weui-tar__img">
					<img src="{{json_config.oss_common_url}}/{{is_pre_url(item.url,item.app_module_action_param)?item.selected_icon:item.no_selected_icon}}" alt="">
				</div>
				<p class="weui-tabbar__label text-font2" ng-class="{'theme_sc':is_pre_url(item.url,item.app_module_action_param)}">{{item.name}}</p>
			</a>
		</div>
	</div>
	<div class="back_top" ng-click="back_top()">
        <img src="${json_config.oss_common_url}/wap/images/haivit/backtop.png" alt="" style="width:130%;margin-top:-0.4rem;margin-left:-0.27rem;">
    </div>
	<script src="${oss_static_js_css_url}/src/js/haivitDeal.js?ver=20170809"></script>
	<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>

	<script>
		var myswiper="";
		$('.goods_item2').height(document.body.clientWidth*(1-0.04)/2);
		$(function(){
			setTimeout(function(){
				mySwiper = new Swiper(".swiper-container", {
					direction : "horizontal",/* 横向滑动 */
					loop : true,/* 形成环路（即：可以从最后一张图跳转到第一张图 */
					pagination : ".swiper-pagination",/* 分页器 */
					prevButton : ".swiper-button-prev",/* 前进按钮 */
					nextButton : ".swiper-button-next",/* 后退按钮 */
					autoplay : 3000,
					observer:true
					/* 每隔3秒自动播放 */
				});

			},2000);


		})
	</script>
	<#include "../inc/foot.ftl"/>