

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Response</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Response List</g:link></span>
            
        </div>
        <div class="body">
            <h1>Edit Response</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${responseInstance}">
            <div class="errors">
                <g:renderErrors bean="${responseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${responseInstance?.id}" />
                <input type="hidden" name="version" value="${responseInstance?.version}" />
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
                                    <label for="comments">Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:responseInstance,field:'comments','errors')}">
                                    <g:select name="comments"
from="${Comment.list()}"
size="5" multiple="yes" optionKey="id"
value="${responseInstance?.comments}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="request">Request:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:responseInstance,field:'request','errors')}">
                                    ${responseInstance?.request}
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
