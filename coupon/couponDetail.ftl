<#include "../inc/head_base.ftl"/>
<#include "../inc/head_jq.ftl"/>
<#include "../inc/head_weui.ftl"/>
<#include "../inc/head_ng.ftl"/>
<#include "../inc/head_var.ftl"/>

<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">

<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/coupon.css">
<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css"/>

<#--
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
<link rel="stylesheet" type="text/css" href="${oss_static_js_css_url}/src/css/wap_public.css"/>
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/coupon.css">
-->
</head>
<body  ng-controller="ctrl">
	<header class="coupon_msg">
		<article class="coupon_header theme_bg">
			<div class="weui-row">
				<div class="weui-col-75"><p></p></div>
				<div class="weui-col-25 text-r"><#--<i class="icon-remove"></i>--></div>
			</div>
			<center>
				<p class="name" ng-bind="coupon.money + '元' + coupon.title"></p>
				<p class="text-font2"></p>
				<#--<span class="coupon_ticket_collect">收藏兑换券</span>-->
			</center>
		</article>
		<div class="coupon_status" ng-show="coupon.is_overdue==1">
			<span class="bg-qgray sc-text-gray">已过期</span>
		</div>
	</header>
	<div class="fix_containner mar-t0">
		<section class="coupon_detail">
			<header class="msg_title">
				优惠券使用规则
			</header>
			<article>
				<div class="weui-row">
					<div class="weui-col-75" ng-bind="'使用次数剩余：' + json.coupon.times + '次'"></div>
				</div>
				<div class="weui-row" ng-repeat="item in rules">
					<div class="weui-col-75" ng-bind="item"></div>
				</div>
			</article>
		</section>
	</div>
	<footer class="footer" style="background:white">
		<a href="javascript:;" class="weui-btn theme_bg text-font5" ng-click="local()"
			style="width:95%;margin:0.5rem auto;border-radius:5px">兑换卡券中心</a>
	</footer>

<#--
<script src="${oss_static_js_css_url}/src/js/couponDetail.js" type="text/javascript" charset="utf-8"></script>
-->
<script src="${oss_static_js_css_url}/src/js/couponDetail.js?ver=20170730" type="text/javascript" charset="utf-8"></script>

	<div class="weui-footer mar-t5" id="foot_public">
		<p class="weui-footer__text"><a href="${json_config.footer_adv_url}">${json_config.is_show_footer_adv}</a>提供技术支持</p>
	</div>
	<script>
        var wheight = window.screen.height;
        var wh;
        if($('#footer').hasClass('weui-tabbar') || $('#footer').hasClass('footer-fixed')){
            wh = wheight - 250;
            $('#foot_public').css('margin-bottom','4rem');
            $('.fix_containner').css('min-height',wh).addClass('mar-b0');
        }else{
            wh = wheight - 220;
            $('#foot_public').css('margin-bottom','4rem');
            $('.fix_containner').css('min-height',wh).addClass('mar-b0');
        }
        kmy_app.controller('ctrlshare',function ($scope,$http) {
            var init_url="${domain_url}/${json_config.project_name_weixin}/js/getShareMassage.do?action=${json_config.module}/${json_config.action}";
            $http({
                method: 'post',
                url: init_url,
                headers:{'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function successCallback(data) {
                // 请求成功执行代码
                console.log(share_title,share_desc,share_url);
                if(share_title=='' || share_title==undefined){
                    share_title=data.data.title;
                }
                if(share_desc==''|| share_desc==undefined){
                    share_desc=data.data.desc;
                }
                if(share_url==''|| share_url==undefined){
                    share_url=data.data.icon;
                }
                var head = document.getElementsByTagName("head")[0];
                var jsbase = document.createElement("SCRIPT");
                var href = location.href.replace(/&/g,'%26');
                var js = document.createElement("SCRIPT");
                var href = location.href.replace(/&/g,'%26');
                js.type= 'text/javascript';
                js.onload = js.onreadystatechange = function() {
                    if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete" ) {
                        js.onload = js.onreadystatechange = null;
                    } };
                js.src="${domain_url}/${json_config.project_name_weixin}/js/getJsTicket.do?currentUrl="+href+"&jsApiList='onMenuShareAppMessage','onMenuShareTimeline'";
                head.appendChild(js);
                var js2 = document.createElement("SCRIPT");
                js2.type= 'text/javascript';
                js2.onload = js.onreadystatechange = function() {
                    if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete" ) {
                        js2.onload = js2.onreadystatechange = null;
                    } };

                js2.src="${domain_url}/${json_config.project_name_weixin}/js/share.do?title="+share_title+"&desc="+share_desc+"&link="+href+"&imgUrl="+share_url;
                head.appendChild(js2);
            }, function errorCallback(data) {
                // 请求失败执行代码
                console.log("error:"+data);

            });

        });
	</script>
</body>
</html>
	<!--<#include "../inc/foot.ftl"/>
	<script>
        var wheight = window.screen.height;
        var wh;
        wh = wheight - 250;
        $('#foot_public').css('margin-bottom','3.5rem');
        $('.fix_containner').css('min-height',wh).addClass('mar-b0');
	</script>-->
