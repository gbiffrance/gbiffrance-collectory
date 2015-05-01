
<%@ page import="au.org.ala.collectory.ProviderMap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'providerMap.label', default: 'ProviderMap')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		 <h1 id="admin-header"><g:message code="default.show.label" args="[entityName]" /></h1>
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
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: providerMapInstance, field: "id")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="collection.label" default="Collection" /></td>
                            <td valign="top" class="value"><g:link controller="collection" action="show" id="${providerMapInstance?.collection?.uid}">${providerMapInstance?.collection?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.institutionCodes.label" default="Institution Codes" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                    <g:each in="${providerMapInstance.institutionCodes}" var="i">
                                    <li><g:link controller="providerCode" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.collectionCodes.label" default="Collection Codes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${providerMapInstance.collectionCodes}" var="c">
                                    <li><g:link controller="providerCode" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.exact.label" default="Exact" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${providerMapInstance?.exact}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.warning.label" default="Warning" /></td>

                            <td valign="top" class="value">${fieldValue(bean: providerMapInstance, field: "warning")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.matchAnyCollectionCode.label" default="Match Any Collection Code" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${providerMapInstance?.matchAnyCollectionCode}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${providerMapInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="providerMap.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${providerMapInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
                <div class="col-md-4"></div>
                <div class="col-md-5">
                    <g:form>
                        <g:hiddenField name="id" value="${providerMapInstance?.id}" />
                        <g:hiddenField name="returnTo" value="${returnTo}" />
                        <g:actionSubmit class="edit-btn btn btn-sm" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        <g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label.masc', args:[entityName], default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
