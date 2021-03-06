<!DOCTYPE html>
<html>
<#include "/include/head.ftl">
<body>
<#include "/include/support.ftl">
<#include "/include/header.ftl">
<div class="g-doc">
    <div class="m-tab m-tab-fw m-tab-simple f-cb">
        <div class="tab">
            <ul>
                <li <#if !showType?exists || showType == 1>class="z-sel"</#if> ><a href="/">所有内容</a></li>
                <#if user?exists && user.type == 0><li <#if showType == 1>class="z-sel"</#if> ><a href="/page/notbuy">未购买的内容</a></li></#if>
            </ul>
        </div>
    </div>
    <#if !commodities?exists || !commodities?has_content>
    <div class="n-result">
        <h3>暂无内容！</h3>
    </div>
    <#else>
    <div class="n-plist">
        <ul class="f-cb" id="plist">
            <#--显示未购买的内容 -->
        <#if user?exists && user.type == 0 && showType == 1>
            <#list commodities as x>
                <li id="p-${x.id}">
                    <a href="/commodity/page/show/${x.id}" class="link">
                        <div class="img"><img src="${x.picUrl}" alt="${x.title}"></div>
                        <h3>${x.title}</h3>
                        <h3>已售(件)：${x.soldQuantity?c}</h3>
                        <div class="price"><span class="v-unit">单价(¥)：</span><span class="v-value">${x.perPrice?c}</span></div>
                    </a>
                </li>
            </#list>
        <#else>
        <#--显示所有内容 -->
            <#list commodities as x>
                <li id="p-${x.id}">
                    <a href="/commodity/page/show/${x.id}" class="link">
                        <div class="img"><img src="${x.picUrl}" alt="${x.title}"></div>
                        <h3>${x.title}</h3>
                        <h3>已售(件)：${x.soldQuantity?c}</h3>
                        <div class="price"><span class="v-unit">单价(¥)：</span><span class="v-value">${x.perPrice?c}</span></div>
                        <#if user?exists && user.type==0 && (x.purchasedQuantity > 0)><span class="had"><b>已购买</b></span></#if>
                        <#if user?exists && user.type==1 && (x.soldQuantity > 0)><span class="had"><b>已售出</b></span></#if>
                    </a>
                    <#if user?exists && user.type==1 && (x.soldQuantity == 0)><span class="u-btn u-btn-normal u-btn-xs del" data-del="${x.id}">删除</span></#if>
                </li>
            </#list>
        </#if>
        </ul>
    </div>
    </#if>
</div>
<#include "/include/footer.ftl">
<script type="text/javascript" src="/js/global.js"></script>
<script type="text/javascript" src="/js/pageIndex.js"></script>
</body>
</html>