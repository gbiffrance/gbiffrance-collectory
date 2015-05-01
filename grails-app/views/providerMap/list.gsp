
<%@ page import="au.org.ala.collectory.ProviderMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'providerMap.label', default: 'provider map')}" />
        <title><g:message code="default.list.label" args="[entityName]" /> <g:message code="default.list.label.end" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="default.list.label" args="[entityName]" /></h1>
        <div class="col-md-3 col-lg-3">
            <div class="region-menu-gauche">
                <ul class="menu nav">
                    <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                    <li><g:link class="create" action="create" params="[returnTo: returnTo]"><g:message code="default.new.masculin.label" args="[entityName]" /></g:link></li>
                    <g:if test="${returnTo}"><li><cl:returnLink uid="${returnTo}"/></li></g:if>
                </ul>
            </div>
        </div>
        <div id="entete" class="col-md-9 col-lg-9">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'providerMap.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="collectionName" title="${message(code: 'collection.label', default: 'Collection')}" />

                            <g:sortableColumn property="exact" title="${message(code: 'providerMap.exact.label', default: 'Exact')}" />
                        
                            <g:sortableColumn property="matchAnyCollectionCode" title="${message(code: 'providerMap.matchAnyCollectionCode.label', default: 'Match Any Collection Code')}" />
                        
                            <th><g:message code="providerMap.institutionCodes.label"/></th>
                        
                            <th><g:message code="providerMap.collectionCodes.label"/></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${providerMapInstanceList}" status="i" var="providerMapInstance">
                        <tr>
                        
                            <td><g:link action="show" id="${providerMapInstance.id}" params="[returnTo: returnTo]">${fieldValue(bean: providerMapInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: providerMapInstance, field: "collection")}</td>
                        
                            <td><g:formatBoolean boolean="${providerMapInstance.exact}" /></td>
                        
                            <td><g:formatBoolean boolean="${providerMapInstance.matchAnyCollectionCode}" /></td>
                        
                            <td>${providerMapInstance.getInstitutionCodes().join(' ')}</td>
                        
                            <td>${providerMapInstance.getCollectionCodes().join(' ')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <g:paginate total="${providerMapInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
