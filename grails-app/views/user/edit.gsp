

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit User</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
      <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
    </div>
    <div class="body">
      <h1>Edit User</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${userInstance}">
        <div class="errors">
          <g:renderErrors bean="${userInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form method="post" >
        <input type="hidden" name="id" value="${userInstance?.id}" />
        <input type="hidden" name="version" value="${userInstance?.version}" />
        <div class="dialog">
          <table>
            <tbody>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="userId">User Id:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'userId','errors')}">
                  <input type="text" maxlength="20" id="userId" name="userId" value="${fieldValue(bean:userInstance,field:'userId')}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="email">Email:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'email','errors')}">
                  <input type="text" maxlength="100" id="email" name="email" value="${fieldValue(bean:userInstance,field:'email')}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="password">Password:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                  <input type="password" maxlength="16" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="responses">Requests:</label>
                </td>
                <td>
                  <ul>
                    <g:each var="r" in="${userInstance?.requests?}">
                      <li><g:link controller="request" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                    </g:each>
                  </ul>
            <g:link controller="request" params="['user.id':userInstance?.id]" action="create">Add Request</g:link>

            </td>
            </tr>


            <tr class="prop">
              <td valign="top" class="name">
                <label for="responses">Responses:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:userInstance,field:'responses','errors')}">

                <ul>
                  <g:each var="r" in="${userInstance?.responses?}">
                    <li><g:link controller="response" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                  </g:each>
                </ul>
            <g:link controller="response" params="['user.id':userInstance?.id]" action="create">Add Response</g:link>

            </td>
            </tr>

            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button"><g:actionSubmit class="save" value="Update" /></span>
          <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>
