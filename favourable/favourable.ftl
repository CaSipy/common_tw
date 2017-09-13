	<#include "../inc/head_base.ftl"/>
	<#include "../inc/head_jq.ftl"/>
	<#include "../inc/head_weui.ftl"/>
	<#include "../inc/head_ng.ftl"/>
	<#include "../inc/head_var.ftl"/>
	<!-- 在线使用 -->
	
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
    <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/favourable.css?ver=2017062611">
    
<!--     <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public.css"> -->
<!--     <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css"> -->
<!--     <link rel="stylesheet" href="${oss_static_js_css_url}/src/css/favourable.css"> -->
    
    <link rel="stylesheet" href="${json_config.oss_common_url}/animate/3.5.2/animate.min.css">

</head>
<body ng-controller="ctrl">
    <div  class="fix_containner mar-b0" style="margin-top:0;verflow:hidden">
        <center style="width:100%" >
            <div style="position:relative">
                <img src="${json_config.oss_common_url}/wap/images/haivit/favourable_head.png" alt="" style="width:100%;" class="animated bounceInDown">
                <div class="animated bounceInLeft" id="rule_award">
                    <div  class="rule_top"  ng-click="rule()">规则&奖励</div>
                </div>
            </div>


            <div style="width:20%;margin:0 auto">
                <img src="${json_config.oss_common_url}/wap/images/haivit/logo_haivit.png" alt="" style="width:100%;" class="animated bounceInDown">
            </div>
            <div class="comment">
                <div class="comment_order">
                    <div class="weui-col-30">
                       <div class="order_input mar-t3"><input type="text" placeholder="填写或复制粘贴订单号" id="order_sn" class="text-c text-font3" ng-model="orderSn" ng-blur="checkOrder()" ></div>
                    </div>
                    <div class="weui-row mar-all3">
                        <p class="sc-text-tab text-font3 margin-auto">上传评价时的截图</p>
                    </div>
                    <!--图片上传-->
                    <div class="img_container">
                        <div class="img_item" ng-repeat="item in thumb">
                            <div class="imglist" style="background-image:url({{item.imgSrc}})"></div>
                            <div class="del_icon icon-remove" ng-click="img_del($index)"></div>
                        </div>
                        <div class="weui-uploader__input-box img_item" ng-show="imglength==0" style="width:4rem;height:4rem;border-radius:5px;margin-right:0;border:none;display:inline-block;float:inherit">
                            <input type="file" id="uploaderInput94" class="weui-uploader__input" accept="image/*" file-model="images" onchange="angular.element(this).scope().img_preview(this.files)"/>
                        </div>
                    </div>
                    <div class="weui-btn text-font3 theme_bg bc-text-header" ng-click="doSubmit()">点击提交</div>
                </div>

            </div>

            <!--<div style="width:100%;text-align:center;margin:0.5rem 0">
                <p class="weui-footer__text"><a href="${json_config.footer_adv_url}">${json_config.is_show_footer_adv}</a>提供技术支持</p>
            </div>-->
        </center>

    <!--<footer class="fix_footer">-->
        <!--<div class="weui-flex">-->
            <!--<div class="weui-flex__item foot_item">联系客服</div>-->
            <!--<div class="weui-flex__item foot_item" ng-click="rule(1)"><p id="rule">活动规则</p></div>-->
            <!--<div class="weui-flex__item foot_item" ng-click="award_pop(2)"><p id="award">我的奖励</p></div>-->
        <!--</div>-->
    <!--</footer>-->

	    <!--活动规则-->
	    <div id="about" class="weui-popup__container" >
	        <div class="weui-popup__overlay"></div>
	        <div class="weui-popup__modal" style="background:rgba(0,0,0,0.8) !important;">
	            <div class="icon-remove text-font5 icon_close" ng-click="pop_close()"></div>
	            <div class="weui-flex pop_tab">
	                <div class="weui-flex__item" >
	                    <p ng-click="tab(1)">操作流程</p>
	                    <li ng-class="{'tab_active':tab_num==1}"></li>
	                </div>
	                <div class="weui-flex__item" ng-click="tab(2)">
	                    <p ng-click="tab(2)">奖品记录</p>
	                    <li ng-class="{'tab_active':tab_num==2}"></li>
	                </div>
	            </div>
	            <div id="rule1" >
	                     <div class="rule" style="margin-top:3rem" >
	                          <div class="bc-text-header mar-b3 "><span class="rule_title">操作流程</span></div>
	                            <!--<div class="weui-row rule_item" ng-repeat="item in json.process">-->
	                                <!--<div class="weui-col-15"><div class="num" ng-bind="$index+1">1</div></div>-->
	                                <!--<div class="weui-col-85"><span class="text-font3" ng-class="{'sc-text-warning':item.keynote==1}" ng-bind="item.content">登录淘宝\京东平台，确认收货</span></div>-->
	                            <!--</div>-->
	                            <div class="rule_msg">
	                                <p ng-class="{'sc-text-warning':item.keynote==1}" ng-bind="($index+1)+'、'+item.content" ng-repeat="item in json.process"></p>
	                            </div>
	                     </div>
	                    <div class="rule">
	                        <div class="bc-text-header mar-b3 "><span class="rule_title">活动规则</span></div>
	                        <div class="rule_msg">
	                            <p ng-repeat="item in json.rule" ng-bind="($index+1)+'、'+item.content"></p>
	                        </div>
	                    </div>
	            </div>
	            <div  id="rule2" class="hide">
	                <div class="rule">
	                    <div class="award_item" ng-repeat="item in reward">
	                        <div class="award_msg">
	                            <p class="text-font5 mar-b1" ng-bind="'订单号：'+item.order_sn"></p>
	                            <p class="text-font5 mar-b1" ng-bind="'奖品：'+item.deal_name" ng-show="item.reward_status==1">八等奖：5元无门槛优惠券</p>
	                            <p ng-bind="'评论日期：'+item.comment_time"></p>
	                            <p ng-bind="'原因：'+item.content" ng-show="item.check_status==2"></p>
	                        </div>
	                        <div class="award_status">
	                            <p class="active" ng-bind="'已下发'" ng-show="item.reward_status==1"></p>
	                            <p class="active" ng-bind="'正在审核'" ng-show="item.check_status==0"></p>
	                            <p class="active" ng-bind="'审核不通过'" ng-show="item.check_status==2"></p>
	                        </div>
	
	                    </div>
	                </div>
	                <div style="clear:both"></div>
				    <div class="weui-loadmore loadMore hide">
				        <i class="weui-loading"></i>
				        <span class="weui-loadmore__tips">正在加载</span>
				    </div>
				    <div class="weui-loadmore" ng-hide="has_data">
				        <span class="weui-loadmore__tips" style="color:white">没有更多商品了哦</span>
				    </div>
	            </div>
					
	        </div>
	    </div>
    </div>
    <!--成功-->
    <div class="weui-mask" id="pop_mask"></div>
    <div class="pop_sure">
        <div class="weui-msg">
            <div class="weui-msg__icon-area"><i class="weui-icon-success" style="font-size:4.5rem;color:#4CB5AA"></i></div>
            <div class="weui-msg__text-area">
                <h2 class="weui-msg__title">操作成功</h2>
                <p class="weui-msg__desc" ng-bind="success_msg"></p>
            </div>
            <div class="pop_sure_back" ng-click="pop_sure_back()">确定</div>

        </div>
    </div>
    <!--弹出框-->
<!--     <div id="order_type" class="weui-popup__container  popup-bottom"> -->
<!--         <div class="weui-popup__overlay weui-popup-overlay"></div> -->
<!--         <div class="weui-popup__modal" style="overflow:inherit;background:#F8F8F8"> -->
            <!--关闭按钮-->
            <!--<span class="toclose close-popup" ng-click="closePopup()">关闭</span>-->
            <!--头部区域-->
<!--             <div class="popup-title"> -->
<!--                 <span  >选择方式</span> -->
                <!--<span  ng-bind="'选择'+json.nav_title+'方式'"></span>-->
<!--             </div> -->
            <!--选择区域,可垂直滚动-->
<!--             <article class="weui-cells weui-cells_radio mar-t5"> -->
                <!--<label class="weui-cell weui-check__label" for="x1{{$index}}"  ng-repeat="item in json.payments" ng-click="closePopup()">-->
                    <!--<div class="weui-cell__hd"><img src="{{json_config.oss_common_url}}/{{item.logo}}" style="width:1.5rem; height:1.5rem;"></div>-->
                    <!--<div class="weui-cell__bd">-->
                        <!--<p ng-bind="item.name"></p >-->
                    <!--</div>-->
                    <!--<div class="weui-cell__ft" >-->
                        <!--<input type="radio" class="weui-check" name="radio1" id="x1{{$index}}" ng-click="chose(item.name,item.id)" ng-checked="$index==0">-->
                        <!--<span class="weui-icon-checked"></span>-->
                    <!--</div>-->
                <!--</label>-->
<!--                 <label class="weui-cell weui-check__label" for="x1"  ng-click="closePopup()"> -->
<!--                     <div class="weui-cell__hd"><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498549347&di=5398439d9aa5195503665ee338a7fab1&imgtype=jpg&er=1&src=http%3A%2F%2Fcdn2.image.apk.gfan.com%2Fasdf%2FPImages%2F2013%2F6%2F9%2F92461_2042e282f-1299-44f1-9b94-d33bac9a9911.png" style="width:1.5rem; height:1.5rem;"></div> -->
<!--                         <div class="weui-cell__bd"> -->
<!--                             <p>京东</p > -->
<!--                         </div> -->
<!--                         <div class="weui-cell__ft" > -->
<!--                         <input type="radio" class="weui-check" name="radio1" id="x1" ng-click="chose('jd')" ng-checked="$index==0"> -->
<!--                         <span class="weui-icon-checked"></span> -->
<!--                     </div> -->
<!--                 </label> -->
<!--                 <label class="weui-cell weui-check__label" for="x21"  ng-click="closePopup()"> -->
<!--                     <div class="weui-cell__hd"><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954688600&di=d166db028d12cd49177341cce00772ca&imgtype=0&src=http%3A%2F%2Fis3.mzstatic.com%2Fimage%2Fthumb%2FPurple1%2Fv4%2Fa7%2F79%2Fe5%2Fa779e5da-a268-326f-b691-9e2ace9340a0%2Fmzl.kkpxhdai.png%2F0x0ss-30.jpg" style="width:1.5rem; height:1.5rem;"></div> -->
<!--                     <div class="weui-cell__bd"> -->
<!--                         <p>淘宝</p > -->
<!--                     </div> -->
<!--                     <div class="weui-cell__ft" > -->
<!--                         <input type="radio" class="weui-check" name="radio1" id="x21" ng-click="chose('tb')" ng-checked="$index==0"> -->
<!--                         <span class="weui-icon-checked"></span> -->
<!--                     </div> -->
<!--                 </label> -->
<!--             </article> -->
            <!--底部按钮区域-->
            <!--<div class="footer-fixed">-->
                <!--<div class="btn-sure bg-green bc-text-header close-popup" ng-click="closePopup()">确认</div>-->
            <!--</div>-->

<!--         </div> -->

<!--     </div> -->
        <!--</div>-->

<script src="${json_config.oss_common_url}/angular/angular-sku.js"></script>
<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
<script type="text/javascript" src="${oss_static_js_css_url}/src/js/favourable.js?ver=20170721"></script>
<!-- <script type="text/javascript" src="${oss_static_js_css_url}/src/js/favourable.js?ver=201707201234"></script> -->
<#include "../inc/foot.ftl"/>