<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'datahub.label.lower', default: 'centres de donnée')}" />
        %{-- <g:set var="entityNameLower" value="${cl.controller(type: entityType)}"/> --}%
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
                <div class="list">
                    <table class="table table-striped table-bordered">
                        <colgroup><col width="45%"/><col width="20%"/><col width="35%"/></colgroup>
                        <thead>
                            <tr>
                                <g:sortableColumn property="name" title="${message(code: 'dataHub.name.label', default: 'Name')}" />
                                <g:sortableColumn property="uid" title="${message(code: 'providerGroup.uid.label', default: 'UID')}" />
                                <g:sortableColumn property="acronym" title="${message(code: 'dataHub.acronym.label', default: 'Acronym')}" />
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${instanceList}" status="i" var="instance">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td><g:link action="show" id="${instance.uid}">${fieldValue(bean: instance, field: "name")}</g:link></td>
                                    <td>${fieldValue(bean: instance, field: "uid")}</td>
                                    <td>${fieldValue(bean: instance, field: "acronym")}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="paginateButtons">
                    <g:paginate controller="dataProvider" action="list" total="${instanceTotal}" />
                </div>
            </div>
        </div>
    </body>
</html>
