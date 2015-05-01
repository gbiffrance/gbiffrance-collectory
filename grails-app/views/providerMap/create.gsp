
<%@ page import="au.org.ala.collectory.ProviderMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'providerMap.label', default: 'ProviderMap')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1 id="admin-header"><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save" method="post" >
                <g:hiddenField name="returnTo" value="${returnTo}" />
                <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="collection"><g:message code="providerMap.providerGroup.label" default="Provider Group" /></label>
                    </div>
                    <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'providerGroup', 'errors')}">
                        <g:select name="collection.id" from="${au.org.ala.collectory.Collection.list([sort: 'name'])}" optionKey="id" value="${providerMapInstance?.collection?.id}"  />
                    </div>
                 </div>
                 <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="institutionCodes"><g:message code="providerMap.institutionCodes.label" default="Institution Codes" /></label>
                    </div>
                     <div class="col-md-9  value ${hasErrors(bean: providerMapInstance, field: 'institutionCodes', 'errors')}">
                        <g:select name="institutionCodes" from="${au.org.ala.collectory.ProviderCode.list([sort:'code'])}" multiple="yes" optionKey="id" size="5" value="${providerMapInstance?.institutionCodes*.id}" />
                    </div>
                </div>
                <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="collectionCodes"><g:message code="providerMap.collectionCodes.label" default="Collection Codes" /></label>
                    </div>
                     <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'collectionCodes', 'errors')}">
                        <g:select name="collectionCodes" from="${au.org.ala.collectory.ProviderCode.list([sort:'code'])}" multiple="yes" optionKey="id" size="5" value="${providerMapInstance?.collectionCodes*.id}" />
                    </div>
                </div>
                <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="exact"><g:message code="providerMap.exact.label" default="Exact" /></label>
                    </div>
                    <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'exact', 'errors')}">
                        <g:checkBox name="exact" value="${providerMapInstance?.exact}" />
                    </div>
                </div>
                <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="warning"><g:message code="providerMap.warning.label" default="Warning" /></label>
                    </div>
                    <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'warning', 'errors')}">
                        <g:textField name="warning" value="${providerMapInstance?.warning}" />
                    </div>
                </div>
                 <div class="col-md-12 edit-contact-form">
                    <div class="col-md-3">
                        <label for="matchAnyCollectionCode"><g:message code="providerMap.matchAnyCollectionCode.label" default="Match Any Collection Code" /></label>
                    </div>
                    <div>
                         <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'matchAnyCollectionCode', 'errors')}">
                            <g:checkBox name="matchAnyCollectionCode" value="${providerMapInstance?.matchAnyCollectionCode}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-12 edit-contact-form">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    <div class="button">
                        <g:submitButton name="create" class="edit-btn btn btn-sm" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
