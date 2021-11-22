<#if showCookieConsent?? && showCookieConsent>
  <div style="min-height: 47px; width:100%; background-color: #eee; font-family: 'Helvetica Neue',Helvetica,Sans-serif; border: 1px solid black;" class="cookie-consent-bar">
    <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 15px;">
      <div><p class="paddingr-right: 1em;">${i18n().cookie_consent_bar_text}</p></div>
      <div><button style="border: 1px solid #444;" onclick="acceptCookies();">${i18n().cookie_consent_bar_button}</div>
    </div>
  </div>

  <script type="text/javascript">

    var urlsBase = "${urls.base}";

    function acceptCookies() {
      $.post(urlsBase + "/acceptCookies?accept=true");
      $(".cookie-consent-bar").hide();
    }

  </script>

</#if>
