<#include "../inc/head_base.ftl"/>
<script src="${json_config.oss_common_url}/jquery/jquery.min.js"></script>
<#include "../inc/head_weui.ftl"/>
	
<#include "../inc/head_ng.ftl"/>
<#include "../inc/head_var.ftl"/>

<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/getDealDetail.css?version=201708301206">
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/dateRange.css">
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap.css">
<link rel="stylesheet" href="${oss_static_js_css_url}/src/css/wap_public${json_config.css_theme_version}.css">


<script src="${oss_static_js_css_url}/src/js/MD5.js"></script>
<script src="${json_config.oss_common_url}/angular/angular-sku.js"></script>
<script src="${json_config.oss_common_url}/swiper/js/swiper.js"></script>
<script src="${oss_static_js_css_url}/src/js/haivitDeal_noticeDetail.js?ver=201708311705"></script>

</head>
<body ng-app="app" ng-controller="ctrl">
    <!--内容区-->
    <div  class="fix_containner" style="margin-top:0">
        
        
        <!--图文详情-->
        <div class="goods-detail" id="app">
        	<dl id="desciption"  style="min-height:480px;"></dl>
        </div>
    </div>
	

    <div class="back_top" ng-click="back_top()">
        <img src="${json_config.oss_common_url}/wap/images/haivit/backtop.png" alt="" style="width:130%;margin-top:-0.4rem;margin-left:-0.27rem;">
    </div>
    
</body>

<#include "../inc/foot.ftl"/>