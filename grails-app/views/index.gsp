<html>
    <head>
        <title>Welcome to Code Samari</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <h1 style="margin-left:20px;">Welcome to Code Samari</h1>
        <p id="intro" style="margin-left:20px;width:80%">
          A place for coders.
        </p>
        <div id="links" class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>