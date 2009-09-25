

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Request</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Request List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Request</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Request</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${requestInstance}">
            <div class="errors">
                <g:renderErrors bean="${requestInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${requestInstance?.id}" />
                <input type="hidden" name="version" value="${requestInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'title','errors')}">
                                    <input type="text" maxlength="50" id="title" name="title" value="${fieldValue(bean:requestInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text">Text:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'text','errors')}">
                                    <textarea rows="5" cols="40" name="text">${fieldValue(bean:requestInstance, field:'text')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created">Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'created','errors')}">
                                    <g:datePicker name="created" value="${requestInstance?.created}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createdBy">Created By:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'createdBy','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="createdBy.id" value="${requestInstance?.createdBy?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rating">Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'rating','errors')}">
                                    <input type="text" id="rating" name="rating" value="${fieldValue(bean:requestInstance,field:'rating')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="responses">Responses:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:requestInstance,field:'responses','errors')}">
                                    <g:select name="responses"
from="${Response.list()}"
size="5" multiple="yes" optionKey="id"
value="${requestInstance?.responses}" />

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
