

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Request</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">Request List</g:link></span>
      <span class="menuButton"><g:link class="create" action="create">New Request</g:link></span>
    </div>
    <div class="body">
      <h1>Show Request</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>


            <tr class="prop">
              <td valign="top" class="name">Title:</td>

              <td valign="top" class="title">${fieldValue(bean:requestInstance, field:'title')}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name">Text:</td>

              <td valign="top" class="text">${fieldValue(bean:requestInstance, field:'text')}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name">Created:</td>

              <td valign="top" class="date">${fieldValue(bean:requestInstance, field:'created')}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name">Created By:</td>

              <td valign="top" class="user"><g:link controller="user" action="show" id="${requestInstance?.createdBy?.id}">${requestInstance?.createdBy?.encodeAsHTML()}</g:link></td>

          </tr>

          <tr class="prop">
            <td valign="top" class="name">Rating:</td>

            <td valign="top" class="rating">${fieldValue(bean:requestInstance, field:'rating')}</td>

          </tr>

          <tr class="prop">
            <td valign="top" class="name">Responses:</td>

            <td  valign="top" style="text-align:left;" class="value">
              <ul>
                <g:each var="r" in="${requestInstance.responses}">
                  <li><g:link controller="response" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                </g:each>
              </ul>
            </td>

          </tr>

          </tbody>
        </table>
      </div>

      <h2>Responses</h2>
      <div class="list">
        <table>

          <tbody>
          <g:each in="${requestInstance.responses}" status="i" var="responseInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

              <td>
                <span class="detail date">
                  <g:link controller="response" action="show" id="${responseInstance.id}">${fieldValue(bean:responseInstance, field:'created')}</g:link>
                </span>
                <span class="detail user">
                  <g:link controller="user" action="show" id="${responseInstance.createdBy.id}">${fieldValue(bean:responseInstance, field:'createdBy')}</g:link>
                </span>
                <span class="detail rating">
                  ${fieldValue(bean:responseInstance, field:'rating')}
                </span>
              </td>

              <td>${fieldValue(bean:responseInstance, field:'text')}</td>

            </tr>
          </g:each>
          </tbody>
        </table>
        <g:link controller="response" params="['request.id':requestInstance?.id]" action="create">Add Response</g:link>
      </div>
      <div class="buttons">
        <g:form>
          <input type="hidden" name="id" value="${requestInstance?.id}" />
          <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
          <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
      </div>
    </div>
  </body>
</html>
