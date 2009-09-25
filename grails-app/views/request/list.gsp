

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Request List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Request</g:link></span>
        </div>
        <div class="body">
            <h1>Request List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="text" title="Text" />
                        
                   	        <g:sortableColumn property="created" title="Created" />
                        
                   	        <th>Created By</th>
                   	    
                   	        <g:sortableColumn property="rating" title="Rating" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${requestInstanceList}" status="i" var="requestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${requestInstance.id}">${fieldValue(bean:requestInstance, field:'title')}</g:link></td>
                        
                            <td>${fieldValue(bean:requestInstance, field:'text')}</td>
                        
                            <td>${fieldValue(bean:requestInstance, field:'created')}</td>
                        
                            <td>${fieldValue(bean:requestInstance, field:'createdBy')}</td>
                        
                            <td>${fieldValue(bean:requestInstance, field:'rating')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${requestInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
