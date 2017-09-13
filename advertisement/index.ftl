 	<#include "../inc/head_base.ftl"/>
	<#include "../inc/head_jq.ftl"/>
	<#include "../inc/head_weui.ftl"/>
	<#include "../inc/head_ng.ftl"/>
	<#include "../inc/head_var.ftl"/>
	<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
	

    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/activity.css">

	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css">
    <script src="${oss_static_js_css_url}/src/js/adv_index.js"></script>
	<#--
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/activity.css">
    <script src="${oss_static_js_css_url}/src/js/adv_index.js?ver=2014"></script>
    -->
</head>
<body  ng-controller="ctrl">
	<div class="fix_containner" style="margin-top:0">
	        <div class="swiper-container details_img">
	            <div class="swiper-wrapper">
	                <div class="swiper-slide" ng-repeat="item in ads.top">
	                    <img src="{{item.pic_path}}" alt="" style="width:100%;height:11rem">
	                </div>
	            </div>
	        </div>
	        <div class="goods mar-t3">
	            <p class="goods_title theme-borLeft-color">最新活动</p>
	            <div ng-repeat="item in activities" >
	                <div ng-click="toAd(item)" class="goods_item2" >
	                    <img ng-src="{{item.pic_path}}" alt="" style="width:100%">
	                    <div class="activity_msg">
	                        <h4 ng-bind="item.title"></h4>
	                        <p ng-bind="item.description"></p>
	                        <p class="text-r time sc-text-tab" ng-bind="getTimeStr(item)"></p>
	                    </div>
	                </div>
	            </div>
	
	            <div class="weui-loadmore loadMore hide">
	                <i class="weui-loading"></i>
	                <span class="weui-loadmore__tips">正在加载</span>
	            </div>
	            <div class="weui-loadmore" ng-hide="has_data">
	                <span class="weui-loadmore__tips">没有更多记录</span>
	            </div>
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
	            <p class="weui-tabbar__label text-font2" ng-class="{'theme_sc':is_pre_url(item.url,item.app_module_action_param)}" ng-bind="item.name"></p>
	        </a>
	    </div>
	</div>
<#include "../inc/foot.ftl"/>