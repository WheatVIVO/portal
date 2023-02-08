
<#if surveyPopup?has_content && surveyPopup[0].surveyPopupEnabled?? && "true" == surveyPopup[0].surveyPopupEnabled 
       && (user.loggedIn || !surveyPopup[0].surveyPopupLoggedInOnly?? || "false" == surveyPopup[0].surveyPopupLoggedInOnly)>

  <#if sessionLength?? && surveyPopup[0].surveyPopupWaitTime??>
    <#assign toWait = surveyPopup[0].surveyPopupWaitTime?number - sessionLength>
  <#elseif sessionLength?? && !surveyPopup[0].surveyPopupWaitTime??>
    <#assign toWait = 30 - sessionLength />
  <#else>
    <#assign toWait = 30 />
  </#if>

  <#if toWait lt 0>
    <#assign toWait = 0>
  </#if>

  <#if surveyPopup[0].surveyPopupExpirationTime??>
    <#assign expirationTime = surveyPopup[0].surveyPopupExpirationTime?number />
  <#else>
    <#assign expirationTime = 3000 />
  </#if>

<style>
  #surveyPopup-close a {
    text-decoration: none;
    color: black;
    font-weight: 500;
    font-size: 1.4em;
  }
  #surveyPopup-close a:hover {
    font-weight: 900;
  }
</style>

<script type="text/javascript" language="javascript">

  <#if expirationTime??>
  var expirationTime = ${expirationTime?c};
  <#else>
  var expirationTime = 3000;
  </#if>

  if(localStorage.dismissPopup && (((new Date()).getTime() - localStorage.dismissPopup) / 60000 > expirationTime)) {
    localStorage.removeItem("dismissPopup");
  }

  if(!localStorage.dismissPopup) {
    setTimeout( function() { $("#surveyPopup").css("display", "block").show(); } , ${toWait?c}000);
  }

  function closeSurveyPopup() {
    $("#surveyPopup").hide();
    if (typeof(Storage) !== "undefined") {
        localStorage.dismissPopup = (new Date()).getTime();
    } else {
        // alert("no local storage!");
    }
    // record dismissal
  }

</script>

  <div id="surveyPopup" style="display: none; position: fixed; bottom: 0; width: 100%; background-color: #eee; font-size: 1.2em; border-top: 1px solid black;">
    <div id="surveyPopup-content" style="display: inline-block; width: 60%; margin-top: 2em; margin-bottom: 2em; margin-left: 2em;">
      <#if !surveyPopup[0].surveyPopupText??>Popup text not set<#else>${surveyPopup[0].surveyPopupText}</#if>
    </div>
    <div id="surveyPopup-close" style="float: right; margin-right: 1em; margin-top: 0.4em;">
      <a href="#" onclick="closeSurveyPopup(); return false;">x</a>
    </div>
  </div>

</#if>
