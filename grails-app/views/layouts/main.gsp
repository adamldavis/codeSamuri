<html>
  <head>
    <title><g:layoutTitle default="Code SAMURI" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body class="yui-skin-sam">
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
  </div>
  <div class="logo">
  <img src="${resource(dir:'images',file:'Crystal_Clear_app_browser_32.png')}" alt="Code SAMURI" />
  Code SAMURI
  </div>
<g:if test="${session.userId}">
  <div id="userid">Logged in as: <span class="user">${session.userId}</span></div>
  <g:form controller="user" method="post" >
    <span id="logout" class="button"><g:actionSubmit action="logout" class="logout" value="Logout" /></span>
  </g:form>
</g:if>
<g:layoutBody />		
</body>	
</html>