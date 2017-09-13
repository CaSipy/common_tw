	<#include "../inc/head_base.ftl"/>
		<#include "../inc/head_jq.ftl"/>
		<#include "../inc/head_weui.ftl"/>		
		<#include "../inc/head_ng.ftl"/>
		<#include "../inc/head_var.ftl"/>
		
	   	<!--当前项目样式引用-->
	    <!--/${json_config.project_name_common}-->
	    
	    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
	    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/order.css">
		<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css"/>

<!-- 		<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css"> -->
<!-- 		<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public.css"/> -->
<!-- 	    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/order.css"> -->
	    
	    
	</head>
	<body class="bg-wechat"ng-controller="ctrl">
		<div>
			<!--头部-->
			<!--<header class="back-header weui-flex">
				<span class="back-header-icon icon-chevron-left flex_item1" ng-click="goBack()">返回</span>
				<h1 class="back-header-h1 flex_item4">我的订单</h1>
				<a class="flex_item1 header-right"></a>
			</header>-->
			<!--导航栏-->
			<nav>
		        <div class="classify_nav">
		            <ul>
		                <!-- data-base 为看效果测试用，可删除-->
		                <li ng-class="{'header-checked theme-borBottom-color theme_sc':li_choose==-1}" ng-click="choseStatus(-1)">全部</li>
		                <li ng-class="{'header-checked theme-borBottom-color theme_sc':li_choose==0}" ng-click="choseStatus(0)">待支付</li>
		                <li ng-class="{'header-checked theme-borBottom-color theme_sc':li_choose==1}" ng-click="choseStatus(1)">半支付</li>
		                <li ng-class="{'header-checked theme-borBottom-color theme_sc':li_choose==2}" ng-click="choseStatus(2)">已支付</li>
		            </ul>
		
		        </div>
		    </nav>
			<div class="fix_containner mar-b0">
				<section class="section-pos" name="con">
					<article class="bg-white mar-b2" id="1"  ng-repeat="item in json.rows">
						<div class="order-top weui-flex">
							<div class="weui-flex__item flex_item3" id="order_topL">
								<div class="weui-cells mar-t0 cancle">
									<div class="weui-cell">
										<div class="weui-cell__bd">
											<p class="mar-l2 text-font2" ng-bind="'总单:'+item.p_order_sn"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="weui-flex__item text-r text-font2 pad-r3 sc-text-warning" id="order_topR" ng-if="item.order_status!=2 && item.pay_status==0">未支付</div>
							<div class="weui-flex__item text-r text-font2 pad-r3 sc-text-warning" id="order_topR" ng-if="item.order_status!=2 && item.pay_status==1">半支付</div>
							<div class="weui-flex__item text-r text-font2 pad-r3 sc-text-warning" id="order_topR" ng-if="item.order_status!=2 && item.pay_status==2">已支付</div>
							<div class="weui-flex__item text-r text-font2 pad-r3 sc-text-warning" id="order_topR" ng-if="item.order_status==2">已关闭</div>
						</div>
						<!--列表模块-->
						<div class="weui-cells s-dow mar-t0 cancle">
							<!---->
							<div class="weui-cells weui-cells-access bg-garyf5" style="margin-top:0">
								<a class="weui-cell weui-media-box weui-media-box_appmsg weui-media-box-trange main-header-c pad-t2 pad-b2" href="{{json_config.pre_url}}?id={{item.p_id}}">
									<div class="weui-media-box__hd order-img" id="Dimg">
										<img src="{{item.item_rows[0].icon}}" name="Dimg" alt="" class="order-img">
									</div>
									<div class="weui-cell__bd weui-cell__hd flex_item3">
										<p class="text-font3 text-family-hei text-astrict showLine-2" ng-bind="item.item_rows[0].name"></p>
										<p class="text-font2 sc-text-tab mar-t2"><b ng-bind="item.item_rows[0].attr_str"></b></p>
									</div>
									<div class="weui-cell__bd weui-cell__ft">
										<p class="text-font3">￥<b ng-bind="item.item_rows[0].price"></b></p>
										<p class="text-font2 mar-t2">x<b ng-bind="item.item_rows[0].number"></b></p>
									</div>
								</a>
							</div>
							<!---->
							<div class="weui-cell">
								<div class="weui-cell__bd text-font3"></div>
								<div class="weui-cell__ft text-font3 bc-text"><span ng-bind="back_pay(item.order_status,item.pay_status)"></span><b class="sc-text-warning" ng-bind="'￥'+item.p_real_price"></b></div>
							</div>

							<div class="weui-flex pad-t1 pad-b2 order-zj-borT">
								<div class="weui-flex__item"></div>
								<div class="weui-flex__item3 fr pad-r1">
									<!-- 								<a name="Cancel" ng-click="delOrder($index)" class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.pay_status==0">删除订单</a> -->
									<a name="Cancel" ng-click="applyRefund($index)" class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="(item.pay_status==1||item.pay_status==2)&& item.order_status!=2 && item.refund_check_status==0">申请退款</a>
									<a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.refund_check_status==1">退款审核中...</a>
									<a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.refund_check_status==2&&item.refund_status!=0">已退款</a>
									<a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.refund_check_status==3">退款失败</a>
									<a href="{{json_config.pre_url}}?id={{item.p_id}}" class="weui-btn weui-btn_mini btn-t text-font2 bg-waring mar-t0" ng-if="item.pay_status!=2&&item.order_status!=2&& item.refund_check_status==0">去支付</a>
									<!--
                                    <a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.delivery_status==0">未发货</a>
                                    <a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.delivery_status==1">已发货</a>
                                    <a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.delivery_status==2">已收货</a>
                                    <a name="Cancel"  class="weui-btn weui-btn_default weui-btn_mini text-font2 mar-r2 mar-t0" ng-if="item.delivery_status==3">已退货</a>
                                    -->
								</div>
							</div>
						</div>
					</article>
					<div class="weui-loadmore loadMore hide" style="margin-bottom:2rem;">
						<i class="weui-loading"></i>
						<span class="weui-loadmore__tips">正在加载</span>
					</div>
					<div class="weui-loadmore" ng-hide="has_data" style="margin-bottom:2rem;">
						<span class="weui-loadmore__tips">没有更多记录</span>
					</div>
				</section>
			</div>
		</div>
<script src="${oss_static_js_css_url}/src/js/haivitDealOrder.js?ver=201706291459"></script>


<!-- <script src="${oss_static_js_css_url}/src/js/haivitDealOrder.js"></script> -->

<script src="${json_config.oss_common_url}/jquery-weui/js/city-picker.js"></script>
<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
<#include "../inc/foot.ftl"/>
