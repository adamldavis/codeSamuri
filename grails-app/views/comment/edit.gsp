

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Comment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Edit Comment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${commentInstance?.id}" />
                <input type="hidden" name="version" value="${commentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text">Text:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'text','errors')}">
                                  <input type="text" size="100"
                                           maxlength="200" id="text" name="text" value="${fieldValue(bean:commentInstance,field:'text')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="response">Response:</label>
                                </td>
                                <td valign="top" class="text">
                                    ${commentInstance?.response?.text}
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
