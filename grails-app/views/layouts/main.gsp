<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
  </div>
  <div class="logo"><img src="${resource(dir:'images',file:'grails_logo.jpg')}" alt="Grails" /></div>
<g:if test="${session.userId}">
  <div id="userid">Logged in as: ${session.userId}</div>
  <g:form controller="user" method="post" >
    <span id="logout" class="button"><g:actionSubmit action="logout" class="logout" value="Logout" /></span>
  </g:form>
</g:if>
<g:layoutBody />		
</body>	
</html>