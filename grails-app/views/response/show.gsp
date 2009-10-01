

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Response</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">Response List</g:link></span>

    </div>
    <div class="body">
      <h1>Show Response</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>


            <tr class="prop">
              <td valign="top" class="name">Text:</td>

              <td valign="top" class="text">${fieldValue(bean:responseInstance, field:'text')}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name">Created:</td>

              <td valign="top" class="date value">${fieldValue(bean:responseInstance, field:'created')}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name">Created By:</td>

              <td valign="top" class="user value"><g:link controller="user" action="show" id="${responseInstance?.createdBy?.id}">${responseInstance?.createdBy?.encodeAsHTML()}</g:link></td>

          </tr>

          <tr class="prop">
            <td valign="top" class="name">Rating:</td>

            <td valign="top" class="rating value">
          <g:form method="post">
            <input type="hidden" name="id" value="${responseInstance?.id}" />
            <span class="button"><g:actionSubmit class="up" value="up" /></span>${fieldValue(bean:responseInstance, field:'rating')}
            <span class="button"><g:actionSubmit class="down" value="down" /></span>
          </g:form>
          </td>

          </tr>

          <tr class="prop">
            <td valign="top" class="name">Request:</td>

            <td valign="top" class="value"><g:link controller="request" action="show" id="${responseInstance?.request?.id}">${responseInstance?.request?.encodeAsHTML()}</g:link></td>

          </tr>

          <tr class="prop">
            <td valign="top" class="name">Comments:</td>

            <td  valign="top" style="text-align:left;" class="value">
              <ul>
                <g:each var="c" in="${responseInstance.comments}">
                  <li>
                    <span class="rating">${c.rating}</span>
                    <span class="user">${c.createdBy}</span>
                    <span class="date"><g:formatDate format="yyyy-MM-dd" date="${c.created}"/></span>
                  <g:link controller="comment" action="edit" id="${c.id}">${c?.encodeAsHTML()}</g:link>
                  </li>
                </g:each>
              </ul>
          <g:link controller="comment"
                  params="['response.id':responseInstance?.id]" action="create">Add Comment</g:link>
          </td>

          </tr>

          </tbody>
        </table>
      </div>
      <div class="buttons">
        <g:form>
          <input type="hidden" name="id" value="${responseInstance?.id}" />
          <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
          <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
      </div>
    </div>
  </body>
</html>
