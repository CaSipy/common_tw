<#include "../inc/head_base.ftl"/>
<#include "../inc/head_jq.ftl"/>
<#include "../inc/head_weui.ftl"/>
<#include "../inc/head_ng.ftl"/>
<#include "../inc/head_var.ftl"/>
<#--
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/coupon.css">
<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css"/>
-->
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/coupon.css?ver=20170704">
<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css"/>

</head>
<body ng-controller="ctrl">
<header class="header_fix">
	<nav class="bg-wechat">
		<div class="classify_nav">
			<ul class="bg-white">
				<li class="ng-scope centerbor" ng-class="{'theme_sc':choose=='0'}" ng-click="change(0)">未使用({{json.unuse}})</li>
				<li class="ng-scope centerbor" ng-class="{'theme_sc':choose=='1'}" ng-click="change(1)">已使用({{json.used}})</li>
				<li class="ng-scope centerbor" ng-class="{'theme_sc':choose=='2'}" ng-click="change(2)">已过期({{json.overdue}})</li>
			</ul>
		</div>
	</nav>
</header>
<div class="fix_containner">
	<aside class="cp_aside pad-r2 mar-t1 text-font3">
		<input type="text" class="cpAsi_input flex_item8" placeholder="请您输入卡券密码" ng-model="cp_num" />
		<i class="cpAsi_i theme_bg" ng-click="exchange()">绑定</i>
	</aside>
	<section class="cp_sec mar-b0">
		<!--可用-->
		<figure class="weui-flex" ng-repeat="item in json.coupons"
				ng-class="{true:'cp_figExpired',false:'cp_figNew'}[item.is_overdue==1]"
				ng-click="toDetail(item.id)">
			<div class="flex_item3 text-c fig_Lsize" ng-bind="'￥'+item.money"></div>
			<div class="flex_item4 fig_Rsize">
				<header class="text-c" ng-bind="item.title"></header>
				<article ng-class="{true:'fig_Rart',false:'fig_RartNew'}[item.is_overdue==1]">
					<p ng-bind="item.begin_day+'~'+item.end_day"></p>
					<p ng-bind="item.content"></p>
					<p ng-bind="item.limit"></p>
				</article>
			</div>
		</figure>

		<div class="weui-loadmore loadMore hide">
			<i class="weui-loading"></i>
			<span class="weui-loadmore__tips">正在加载</span>
		</div>
		<div class="weui-loadmore" ng-hide="has_data">
			<span class="weui-loadmore__tips">没有更多记录</span>
		</div>
	</section>
</div>

<footer class="footer footerBtn" id="footer">
	<a href="javascript:;" class="weui-btn theme_bg text-font4" ng-click="toShop()">卡券兑换</a>
</footer>

<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
<#--
<script src="${oss_static_js_css_url}/src/js/coupon.js" type="text/javascript" charset="utf-8"></script>
-->
<script src="${oss_static_js_css_url}/src/js/coupon.js?ver=20170730" type="text/javascript" charset="utf-8"></script>

<#include "../inc/foot.ftl"/>
<script>
    
    var wheight = window.screen.height;
    var wh;
    if($('#footer').hasClass('footerBtn')){
        wh = wheight - 168;
        $('#foot_public').css('margin-bottom','3rem');
        $('.fix_containner').css('min-height',wh).addClass('mar-b0');
    }else{
        wh = wheight - 180;
        $('#foot_public').css('margin-bottom','3.1rem');
        $('.fix_containner').css('min-height',wh).addClass('mar-b0');
    }
</script>