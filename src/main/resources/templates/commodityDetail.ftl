<!DOCTYPE html>
<html>
<#include "/include/head.ftl">
<body>
<#include "/include/support.ftl">
<#include "/include/header.ftl">
<div class="g-doc">
    <#if commodity?exists>
        <div class="n-show f-cb" id="showContent">
            <div class="img"><img src="${commodity.picUrl}" alt=""></div>
            <div class="cnt">
                <h2>${commodity.title}</h2>
                <p class="summary">${commodity.comAbstract}</p>
                <div class="price">
                    <span class="v-unit">¥</span><span class="v-value">${commodity.perPrice?c}</span>
                </div>
                <div class="num">购买数量：
                    <span id="plusNum" class="lessNum"><a>-</a></span
                    ><span class="totalNum" id="allNum">1</span>
                    <span id="addNum" class="moreNum"><a>+</a></span>
                </div>
                <div class="oprt f-cb">
                    <#if user?exists && user.type==1>
                        <a href="/commodity/page/edit/${commodity.id}" class="u-btn u-btn-primary">编 辑</a>
                    <#else>
                        <#if user?exists && user.type == 0 && (commodity.purchasedQuantity > 0)>
                            <span class="u-btn u-btn-primary z-dis">已购买</span>
                            <span class="buyprice">购买单价：¥${commodity.perPriceSnapshot?c}</span>

                        <#else>

                            <#if user?exists && user.type == 0 && (commodity.purchasedQuantity == 0)>
                                <button class="u-btn u-btn-primary" id="add" data-id="${commodity.id?c}" data-title="北京">
                                    加入购物车</button>
                            <#else>
                                <button class="u-btn u-btn-primary" id="add" data-id="1" data-title="北京">
                                    加入购物车</button>
                            </#if>
                        </#if>
                    </#if>
                </div>
            </div>
        </div>
        <div class="m-tab m-tab-fw m-tab-simple f-cb">
            <h2>详细信息</h2>
        </div>
        <div class="n-detail">
        ${commodity.detail}
        </div>

    <#else>
        <div class="n-result">
            <h3>内容不存在！</h3>
        </div>
    </#if>

</div>
<#include "/include/footer.ftl">
<script type="text/javascript" src="/js/global.js"></script>
<script type="text/javascript" src="/js/pageShow.js"></script>
</body>
</html>