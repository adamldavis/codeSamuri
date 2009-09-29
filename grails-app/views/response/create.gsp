

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create Response</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">Response List</g:link></span>
    </div>
    <div class="body">
      <h1>Create Response</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${responseInstance}">
        <div class="errors">
          <g:renderErrors bean="${responseInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <table>
            <tbody>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="text">Text:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:responseInstance,field:'text','errors')}">
                  <textarea rows="5" cols="40" name="text">${fieldValue(bean:responseInstance, field:'text')}</textarea>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="request">Request:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:responseInstance,field:'request','errors')}">
            <g:select optionKey="id" from="${Request.findById(responseInstance?.request?.id)}" name="request.id" value="${responseInstance?.request?.id}" ></g:select>
            </td>
            </tr>

            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button"><input class="save" type="submit" value="Create" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>
