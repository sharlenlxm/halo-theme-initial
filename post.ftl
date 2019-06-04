<#include "header.ftl">
<@header title="${post.title!} - ${options.blog_title!}" keywords="${options.seo_keywords!},${tagWords!}" description="${post.summary!}" />
<div id="main">
    <?php if (!empty($this->options->Breadcrumbs) && in_array('Postshow', $this->options->Breadcrumbs)): ?>
    <div class="breadcrumbs">
        <a href="${context!}">首页</a> &raquo; <?php $this->category(); ?>
        &raquo; <?php if (!empty($this->options->Breadcrumbs) && in_array('Text', $this->options->Breadcrumbs)): ?>正文<?php else: $this->title(); endif; ?>
    </div>
    <?php endif; ?>
    <article class="post<?php if ($this->options->PjaxOption && $this->hidden): ?> protected<?php endif; ?>">
        <h1 class="post-title"><a href="${context!}/archives/${post.url!}">${post.title!}</a></h1>
        <ul class="post-meta">
            <li>${post.createTime?string('yyyy-MM-dd')}</li>
            <li>
                <#if categories?? && categories?size gt 0>
                    <#list categories as category>
                        ${category.name!}&nbsp;
                    </#list>
                <#else>
                    未分类
                </#if>
            </li>
            <li>
<#--                <a href="${context!}/archives/${post.url!}#comments">-->
<#--                    <#if comments?? && comments.getTotalElements gt 0>-->
<#--                        ${comments.getTotalElements} 条评论-->
<#--                    <#else>-->
<#--                        暂无评论-->
<#--                    </#if>-->
<#--                </a>-->
            </li>
            <li>
                <#if post.visits gt 0>
                    ${post.visits?c} 次阅读
                <#else>
                    暂无阅读
                </#if>
            </li>
        </ul>
        <div class="post-content">
            ${post.formatContent!}
        </div>
        <?php if ($this->options->WeChat || $this->options->Alipay): ?>
        <p class="rewards">打赏: <?php if ($this->options->WeChat): ?>
            <a><img src="<?php $this->options->WeChat(); ?>" alt="微信收款二维码"/>微信</a><?php endif;
                    if ($this->options->WeChat && $this->options->Alipay): ?>, <?php endif;
                    if ($this->options->Alipay): ?>
            <a><img src="<?php $this->options->Alipay(); ?>" alt="支付宝收款二维码"/>支付宝</a><?php endif; ?>
        </p>
        <?php endif; ?>
        <p class="tags">标签: <?php $this->tags(', ', true, 'none'); ?></p>
        <p class="license"><?php echo $this->options->LicenseInfo ? $this->options->LicenseInfo : '本作品采用 <a rel="license nofollow" href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank">知识共享署名-相同方式共享 4.0 国际许可协议</a> 进行许可。' ?></p>
    </article>
    <?php $this->need('comments.php'); ?>
    <ul class="post-near">
        <li>上一篇:
            <#if prePost??>
                <a href="${context!}/archives/${prePost.url}" title="${prePost.title}">${prePost.title}</a>
            <#else>
                没有了
            </#if>
        </li>
        <li>下一篇:
            <#if nextPost??>
                <a href="${context!}/archives/${nextPost.url}" title="${nextPost.title}">${nextPost.title}</a>
            <#else>
                没有了
            </#if>
        </li>
    </ul>
</div>
<#include "sidebar.ftl">
<#include "footer.ftl">