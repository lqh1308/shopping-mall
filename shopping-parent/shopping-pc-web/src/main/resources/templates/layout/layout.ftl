<#macro h>
    <base target="_self" href="/">
    <link rel="stylesheet" href="/view/default/css/common.css">
    <link rel="stylesheet" href="/view/default/css/animate.min.css">
    <link rel="stylesheet" href="/view/default/css/layer.css" id="layui_layer_skinlayercss" style="">
    <#nested >
    <script src="/view/default/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="view/default/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="/view/default/js/main.js" type="text/javascript"></script>
    <script src="/view/default/js/layer.min.js" type="text/javascript"></script>
</#macro>
<#macro b hasNavRight>
    <#import "../header/header_template.ftl" as header_template>
    <@header_template.ht>
        <#if hasNavRight==true>
            <div class="navtitleright nb">
                <a href="/index.html">首页</a>  &gt;
                <#assign navRightJson>
                    ${navRightList}
                </#assign>
                <#assign json=navRightJson?eval>
                <#list json as nav>
                    <a href="${nav.url}">${nav.name}</a>  &gt;
                </#list>
            </div>
        </#if>
    </@header_template.ht>
    <#-- 这里是嵌入的内容 -->
    <#nested >
</#macro>