	<#include "../inc/head_base.ftl"/>
	<#include "../inc/head_jq.ftl"/>
	<#include "../inc/head_weui.ftl"/>
	<#include "../inc/head_ng.ftl"/>
	<#include "../inc/head_var.ftl"/>
	<!--/${json_config.project_name_common}-->
	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/getDealDetail.css?version=3423432">
	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css">
</head>
<body ng-controller="ctrl">
    <header>
        <div class="classify_nav">
            <ul>
                <li ng-repeat="item in json.type_list" ng-class="{'active':chose==item.id}" ng-click="getType(item.id,0)" ng-bind="item.name"></li>
            </ul>
        </div>
    </header>
    <!--商品列表-->
    <div class="fix_containner mar-t0">
        <div class="hide base2" style=" margin-top:1.8rem">
            <div class="goods_content"><!-- base2为看效果测试用，可删除-->
                <div class="goods_list" ng-repeat="item in json.deal_list" ng-click="getDealDetail(item.id)">
                    <div class="weui-flex">
                        <div class="flex_item1"><img src="${json_config.oss_image_url}/{{item.icon}}" alt="" style="width:100%;height:100px"></div>
                        <div class="flex_item2 pad-l3 pad-r3">
                            <p>{{item.name}}</p >
                            <div><span class="fl sc-text-warning">￥{{item.price}}</span><span class="fr sc-text-gray">库存：{{item.number}}</span></div>
                        </div>
                    </div>
                </div>
                <div class="weui-loadmore loadMore hide" style="margin-bottom:4rem;">
                    <i class="weui-loading"></i>
                    <span class="weui-loadmore__tips">正在加载</span>
                </div>
                <div class="weui-loadmore" ng-hide="has_data" style="margin-bottom:4rem;">
                    <span class="weui-loadmore__tips">没有更多记录</span>
                </div>
            </div>
        </div>
    </div>
    <!--底部导航栏-->
    <div class="weui-tabbar" id="footer">
        <div class="weui-tabbar">
            <a href="{{combineUrl(item.url,item.app_module_action_param)}}" class="weui-tabbar__item {{is_pre_url(item.url,item.app_module_action_param)?'weui-bar__item--on':''}}"  ng-repeat="item in json.menu_1">
            	<div class="weui-tabbar__icon weui-tar__img">
              		<img src="{{json_config.oss_common_url}}/{{is_pre_url(item.url,item.app_module_action_param)?item.selected_icon:item.no_selected_icon}}" alt="">
            	</div>
            <p class="weui-tabbar__label text-font2" ng-bind="item.name"></p>
        </a>
        </div>
    </div>
<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
<script src="${oss_static_js_css_url}/src/js/deal_dealList.js?version=342343"></script>
<#include "../inc/foot.ftl"/>