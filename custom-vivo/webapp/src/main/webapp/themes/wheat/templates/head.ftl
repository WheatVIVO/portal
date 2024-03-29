<#include "gtag.ftl">

<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<meta charset="utf-8" />
<!-- Google Chrome Frame open source plug-in brings Google Chrome's open web technologies and speedy JavaScript engine to Internet Explorer-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="VIVO ${version.label}" />

<title>${(title?html)!siteName!}</title>

<#-- VIVO OpenSocial Extension by UCSF -->
<#if openSocial??>
    <#if openSocial.visible>
        <#-- Required to add these BEFORE stylesheets.flt and headScripts.ftl are processed -->
        ${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/openSocial/gadgets.css" />')}
        ${headScripts.add('<script type="text/javascript" src="${openSocial.containerJavascriptSrc}"></script>',
                          '<script type="text/javascript" language="javascript">${openSocial.gadgetJavascript}</script>',
                          '<script type="text/javascript" src="${urls.base}/js/openSocial/orng.js"></script>')}
    </#if>
</#if>


<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic" />

<#include "stylesheets.ftl">
<link rel="stylesheet" href="${urls.theme}/css/screen.css?v=20210908b" />

<link rel="shortcut icon" href="https://www.wheatinitiative.org/sites/all/themes/wheatinitiative/favicon.ico" type="image/vnd.microsoft.icon" />

<#include "headScripts.ftl">

<#if metaTags??>
    ${metaTags.list()}
</#if>


<#-- add meta for mobile viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<#-- Inject head content specified in the controller. Currently this is used only to generate an rdf link on
an individual profile page. -->
${headContent!}

<link rel="shortcut icon" type="image/x-icon" href="${urls.base}/favicon.ico">
<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
