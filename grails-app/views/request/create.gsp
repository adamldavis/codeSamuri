

<html>
    <head>
    	<gui:resources components="richEditor, dialog"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Request</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Request List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Request</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${requestInstance}">
            <div class="errors">
                <g:renderErrors bean="${requestInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
				    <gui:richEditor id="text" name="text" value="${fieldValue(bean:requestInstance, field:'text')}"/>
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
