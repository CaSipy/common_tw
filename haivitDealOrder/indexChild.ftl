	<#include "../inc/head_base.ftl"/>
		<#include "../inc/head_jq.ftl"/>
		<#include "../inc/head_weui.ftl"/>		
		<#include "../inc/head_ng.ftl"/>
		<#include "../inc/head_var.ftl"/>
		<!--oss库资源引用-->

	    <!--当前项目样式引用-->
		<!--/${json_config.project_name_common}-->
		
		<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
	    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/order.css">
	    <script src="${oss_static_js_css_url}/src/js/haivitDealOrder.js"></script>
		<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css"/>
	   	

<!-- 	   	<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css"> -->
<!-- 		<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public.css"/> -->
<!-- 	    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/order.css">	     -->
<!-- 	    <script src="${oss_static_js_css_url}/src/js/dealOrder.js"></script> -->

	</head>
	<body  ng-app="app" ng-controller="ctrl">
		<!--头部-->
		<!--<header class="back-header weui-flex">
			<span class="back-header-icon icon-chevron-left flex_item1" onclick="javascript:window.history.go(-1);">返回</span>
			<h1 class="back-header-h1 flex_item4">订单详情</h1>
			<a class="flex_item1 header-right"></a>
		</header>-->
		<div class="fix_containner mar-t0">
		<section>
			<header class="cIndex-header theme_bg weui-flex">
				<div class="weui-cell weui-check__label pad-t0 pad-b0 width100">
			
					<div class="weui-panel__bd commodity pad-t0 pad-b0">
						<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg pad-all0 weui-flex commodity">
							
							<!--完成状态-->
							<div class="commodity_showHei flex_item2 pad-l4" style="padding-top: 1rem;">
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].pay_status==2 && json.rows[0].refund_check_status==0">交易成功</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].pay_status==1 && json.rows[0].refund_check_status==0">半支付</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].pay_status==0 && json.rows[0].refund_check_status==0">未支付</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].refund_check_status==1">退款审核中</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].refund_check_status==2">退款成功</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status!=2 && json.rows[0].refund_check_status==3">退款失败</h4>
								<h4 class="text-weight text-font4 bc-text-header" ng-if="json.rows[0].order_status==2">已关闭</h4>
								<p class="weui-media-box__desc text-font2 bc-text-header mar-t1 mar-b2">
									<span ng-if="json.rows[0].delivery_status!=0">发货时间<i ng-bind="json.rows[0].delivery_time"></i></span>
									<!--<span>21:32:21</span>-->
								</p>
								<p class="weui-media-box__desc text-font2 bc-text-header mar-t1 mar-b2">
									<span ng-if="json.rows[0].order_status!=2 && json.rows[0].pay_status==2">支付时间<i  ng-bind="json.rows[0].pay_time"></i></span>
									<!--<span>21:32:21</span>-->
								</p>
							</div>
							<div class="weui-media-box__hd commodity_img flex_item1">
								<img class="weui-media-box__thumb" src="{{json_config.oss_common_url}}/wap/images/haivit/logistics.png">
							</div>	
						</a>
					</div>
				</div>
			</header>
			<section>
				
				<article ng-if="json.rows[0].item_rows[0].is_virtual==0">
					
					<!--个人信息-->
					<figure> 
						<div class="weui-cells cancle mar-t0" style="border-bottom:.05rem solid #F4F4F4">
							<a class="weui-cell weui-cell_access pad-t1 pad-b1 cIndex-figure" href="javascript:;">
								<div class="weui-cell__hd"><img src="{{json_config.oss_common_url}}/wap/images/location.png" alt="" style="width:20px;margin-right:.5rem;display:block"></div>
								<div class="weui-cell__bd mar-l2">
									<p class="text-font3 weui-flex">
										<span class=" mar-r2 flex_item3">收货人：<b class="text-font4" ng-bind="json.rows[0].receiver_name"></b></span>
										<span class="text-font3 flex_item2 text-r" ng-bind="json.rows[0].mobile"></span></p>
									<p class="text-font2 sc-text-tab mar-t1">收货地址 :
										<span ng-bind="json.rows[0].address"></span>
									</p>
								</div>
							</a>
						</div>
					</figure>
				</article>
				<!--子单列表-->
				<article class="mar-t4">
					
					<!--商品块-->
					<div class="weui-cells weui-cells_checkbox mar-t0 cancle  bg-wechat">
					    <!--第一块-->
					    <figure class="mar-b1" name="details" ng-repeat="item in json.rows[0].item_rows">
					    	<div class="weui-cell__hd bg-white pad-l5 text-font3 pad-t2 pad-b2">
							        单号:<span ng-bind="item.order_sn"></span>
							</div>
						    <div class="weui-cell weui-check__label commodity_bg pad-r3 pad-t1 pad-b1 ">
							    
							    <div class="weui-panel__bd commodity">
									<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg pad-all1 pad-r0">
										<div class="weui-media-box__hd commodity_img">
											<img class="weui-media-box__thumb commodity_img" src="{{item.icon}}">
										</div>
										<!--完成状态-->
										<div class="weui-media-box__bd commodity_showHei" name="accomplish">
											<h4 class="text-weight text-font2 text-astrict showLine-2"  ng-bind="item.name"></h4>
											<p class="weui-media-box__desc text-font1  mar-t1 mar-b2" >
												<span ng-bind="item.attr_str"></span>												
											</p>
											<p class="weui-media-box__desc text-font2">
												<span class="bc-text" name="price">￥:<i class="text-font3" ng-bind="item.price"></i></span>
											</p>
											<p class="text-font3 text-r width100 commodity_num">x<b ng-bind="item.number"></b></p>
										</div>
									</a>
								</div>
						    </div>
<!-- 						    <div class="weui-cells cancle mar-t0" style="border-bottom:.05rem solid #F4F4F4"> -->
<!-- 								<a class="weui-cell weui-cell_access weui-flex" href="javascript:;"> -->
<!-- 									<div class="weui-cell__hd" ng-if="item.is_virtual==0"><img src="{{json_config.oss_common_url}}/wap/images/location.png" alt="" style="width:20px;margin-right:.5rem;display:block"></div> -->
<!-- 									<div class="weui-cell__bd mar-l2 flex_item2" ng-if="item.is_virtual==0"> -->
<!-- 										<p class="text-font2">快递公司：<span ng-bind="item.express_name"></span></p> -->
<!-- 										<p class="text-font1 sc-text-gray text-astrict showLine-1">快递单号：<span ng-bind="item.express_num"></span></p> -->
<!-- 									</div> -->
<!-- 									<div class="flex_item1 text-r"> -->
										<!--<span href="javascript:;" class="order-btn weui-btn_default">签收</span>-->
<!-- 										<span href="javascript:;" class="order-btn weui-btn_disabled weui-btn_default" ng-if="item.is_virtual==1">虚拟商品</span> -->
<!-- 										<span href="javascript:;" class="order-btn weui-btn_disabled weui-btn_default" ng-if="item.is_virtual==0 && item.delivery_status==0">准备发货</span> -->
<!-- 										<span href="javascript:;" class="order-btn weui-btn_disabled weui-btn_default" ng-if="item.is_virtual==0 && item.delivery_status==1">已发货</span> -->
<!-- 										<span href="javascript:;" class="order-btn weui-btn_disabled weui-btn_default" ng-if="item.is_virtual==0 && item.delivery_status==2">已签收</span> -->
<!-- 										<span href="javascript:;" class="order-btn weui-btn_disabled weui-btn_default" ng-if="item.is_virtual==0 && item.delivery_status==3">已退货</span> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
					    </figure>
						</div>
					  
				</article>
				
				<!--选择支付方式-->
				<!--
				<article class="weui-cells weui-cells_radio mar-t2">
						<label class="weui-cell weui-check__label" for="x{{payment.id}}" ng-repeat="payment in json.payment_list" ng-click="selectPayment($index)" >
						  	<div class="weui-cell__hd"><img src="{{json_config.oss_common_url}}/{{payment.logo}}" style="width:1.5rem; height:1.5rem;"></div>
						    <div class="weui-cell__bd text-font4">
						      	<p ng-bind="payment.name"> </p>
						    </div>
						    <div class="weui-cell__ft">
						      	<input type="radio" class="weui-check" name="radio1" id="x{{payment.id}}">
						      	<span class="weui-icon-checked"></span>
						    </div>
						</label>						
				</article>
				-->
				<article class="mar-t3 pad-b5">
					<div class="text-font2 pad-l5 pad-r5 pad-t2 pad-b2 bg-white">
						<p class="weui-flex">
							<span class="flex_item1 text-l">商品数量</span>
							<span class="flex_item1 text-r sc-text-tab" ng-bind="'x'+json.rows[0].p_number"></span>
						</p>
						<p class="weui-flex text-font3">
							<span class="flex_item1 text-l">订单总价</span>
							<span class="flex_item1 text-r sc-text-warning text-font2">￥<b class="text-font4" ng-bind="json.rows[0].p_real_price"></b></span>
						</p>
						<p class="weui-flex text-font3">
							<span class="flex_item1 text-l">订单时间</span>
							<span class="flex_item1 text-r sc-text-tab text-font2"><b class="text-font4" ng-bind="json.rows[0].create_time"></b></span>
						</p>
					</div>
				</article>
			</section>
		</section>
		<footer id="goods_lan" class="weui-flex con_footer" ng-if="json.rows[0].order_status!=2&&json.rows[0].pay_status!=2">
	            <div class="flex_item2 text-r pad-r5">
	               <p class="mar-l5  bc-text-header"> 
	               		<span class="text-font4">共计: </span>
	               		<span class="text-font4" ng-bind="'￥'+json.rows[0].p_real_price"></span>
	               </p>
	            </div>
	            <div class="flex_item1 text-c" ng-click="rePayment()">
	                <p class="theme_bg bc-text-header text-font4" style="height:3rem; line-height:3rem;">继续支付</p>
	            </div>
	       </footer>   
		</div>
<#include "../inc/foot.ftl"/>

