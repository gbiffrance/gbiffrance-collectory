
<%@ page import="au.org.ala.collectory.ProviderMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'providerMap.label', default: 'ProviderMap')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1 id="admin-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
    <div class="col-md-3 col-lg-3">
        <div class="region-menu-gauche">
            <ul class="menu nav">
                <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>
    <div id="entete" class="col-md-9 col-lg-9">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${providerMapInstance}">
            <div class="errors">
                <g:renderErrors bean="${providerMapInstance}" as="list" />
            </div>
        </g:hasErrors>
            <g:render template="form" />
        </div>
    </body>
</html>
