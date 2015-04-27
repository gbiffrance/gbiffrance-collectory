<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'institution.label', default: 'institution')}" />
        <title><g:message code="default.list.label" args="[entityName]" /><g:message code="default.list.label.end" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="default.list.label" args="[entityName]" /></h1>
        <div class="container-fluid">
            <div class="col-md-3 col-lg-3">
                <div class="region-menu-gauche">
                    <ul class="menu nav">
                        <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                        <li><g:link action="create"><g:message code="default.new.label" args="[entityName]"/></g:link> </li>  
                        %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                    </ul>
                </div>
            </div>
            <div id="instit" class="col-md-9">
                <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                </g:if>
                <g:render template="/shared/institutionList" model="[institutionInstanceList: institutionInstanceList, showALAPartner: 'false' ]" />

                <div class="pagination">
                    <g:paginate controller="institution" action="list" total="${institutionInstanceTotal}" />
                </div>
            </div>
        </div>
    </body>
</html>
