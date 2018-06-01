<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

</div> <!-- #wrapper-content -->

<footer role="contentinfo" class="cf mt5 pa3">
    <nav role="navigation" class="cf mb4">
       <ul id="header-nav" role="list" class="dt center">
           <#include "languageSelector.ftl">
           <li role="listitem" class="dib"><a href="${urls.index}" class="dib pv2 ph3" title="${i18n().identity_index}">${i18n().identity_index}</a></li>
           <#if user.loggedIn>
               <#-- COMMENTING OUT THE EDIT PAGE LINK FOR RELEASE 1.5. WE NEED TO IMPLEMENT THIS IN A MORE
                    USER FRIENDLY WAY. PERHAPS INCLUDE A LINK ON THE PAGES THEMSELVES AND DISPLAY IF THE
                    USER IS A SITE ADMIN. tlw72

                    <#if (page??) && (page?is_hash || page?is_hash_ex) && (page.URLToEditPage??) >
                       <li role="listitem"><a href="${page.URLToEditPage}" title="${i18n().identity_edit}">${i18n().identity_edit}</a></li>
                    </#if>
               -->
               <#if user.hasSiteAdminAccess>
                   <li role="listitem" class="dib"><a href="${urls.siteAdmin}" class="dib pv2 ph3" title="${i18n().identity_admin}">${i18n().identity_admin}</a></li>
               </#if>
                   <li class="dib">
                       <ul class="dropdown">
                           <li id="user-menu">
                              <a title="${i18n().identity_user}" class="dib pv2 pl3 pr5 no-underline">${user.loginName}</a>
                               <ul class="sub_menu w-100">
                                    <#if user.hasProfile>
                                        <li role="listitem" class="bt b--white-30"><a href="${user.profileUrl}" class="db pv2 ph2" title="${i18n().identity_myprofile}">${i18n().identity_myprofile}</a></li>
                                    </#if>
                                    <#if urls.myAccount??>
                                        <li role="listitem" class="bt b--white-30"><a href="${urls.myAccount}" class="db pv2 ph2" title="${i18n().identity_myaccount}">${i18n().identity_myaccount}</a></li>
                                    </#if>
                                    <li role="listitem" class="bt b--white-30"><a href="${urls.logout}" class="db pv2 ph2" title="${i18n().menu_logout}">${i18n().menu_logout}</a></li>
                               </ul>
                           </li>
                        </ul>
                    </li>

               ${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}
           <#else>
               <li role="listitem" class="dib"><a class="log-out dib pv2 ph3" title="${i18n().menu_loginfull}" href="${urls.login}">${i18n().menu_login}</a></li>
           </#if>
       </ul>
    </nav>
    <p class="copyright fl">
        <#if copyright??>
            <small>&copy;${copyright.year?c}
            <#if copyright.url??>
                <a href="${copyright.url}" title="${i18n().menu_copyright}">${copyright.text}</a>
            <#else>
                ${copyright.text}
            </#if>
             | <a class="terms" href="${urls.termsOfUse}" title="${i18n().menu_termuse}">${i18n().menu_termuse}</a></small> |
        </#if>
        <small>${i18n().menu_powered} <a class="powered-by-vivo" href="http://vivoweb.org" target="_blank" title="${i18n().menu_powered} VIVO"><strong>VIVO</strong></a></small>
        <#if user.hasRevisionInfoAccess>
             | ${i18n().menu_version} <a href="${version.moreInfoUrl}" title="${i18n().menu_version}">${version.label}</a>
        </#if>
    </p>

    <ul id="footer-nav" role="navigation" class="fr">
        <li role="listitem"><a href="${urls.about}" title="${i18n().menu_about}">${i18n().menu_about}</a></li>
        <#if urls.contact??>
            <li role="listitem"><a href="${urls.contact}" title="${i18n().menu_contactus}">${i18n().menu_contactus}</a></li>
        </#if>
        <li role="listitem"><a href="http://www.vivoweb.org/support" target="blank" title="${i18n().menu_support}">${i18n().menu_support}</a></li>
    </ul>
</footer>

<#include "scripts.ftl">
