<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Default individual search view -->

<#import "lib-properties.ftl" as p>

<a href="${individual.profileUrl}" title="${i18n().name}">${individual.name}</a>

<#if user.loggedIn>
  <#if firstTimestamp?has_content && firstTimestamp.firstTimestamp??>
    ${firstTimestamp[0].firstTimestamp}
  </#if>
</#if>

<@p.mostSpecificTypes individual />

<p class="snippet">${individual.snippet}</p>
