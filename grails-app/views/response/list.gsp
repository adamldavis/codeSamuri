

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Response List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Response</g:link></span>
        </div>
        <div class="body">
            <h1>Response List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="text" title="Text" />
                        
                   	        <g:sortableColumn property="created" title="Created" />
                        
                   	        <th>Created By</th>
                   	    
                   	        <g:sortableColumn property="rating" title="Rating" />
                        
                   	        <th>Request</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${responseInstanceList}" status="i" var="responseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${responseInstance.id}">${fieldValue(bean:responseInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:responseInstance, field:'text')}</td>
                        
                            <td>${fieldValue(bean:responseInstance, field:'created')}</td>
                        
                            <td>${fieldValue(bean:responseInstance, field:'createdBy')}</td>
                        
                            <td>${fieldValue(bean:responseInstance, field:'rating')}</td>
                        
                            <td>${fieldValue(bean:responseInstance, field:'request')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${responseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
