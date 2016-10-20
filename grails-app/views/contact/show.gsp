
<%@ page import="au.org.ala.collectory.Contact; au.org.ala.collectory.ProviderGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'contact')}" />
        <title><g:message code="default.show.label" args="[entityName]" /> <g:message code="default.list.label.end" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="contact.label" args="[entityName]" /> - ${fieldValue(bean: contactInstance, field: "title")} ${fieldValue(bean: contactInstance, field: "lastName")}</h1>
            <div class="container-fluid">
                <div class="col-md-3 col-lg-3">
                    <div class="region-menu-gauche">
                        <ul class="menu nav">
                            <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                            <li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link> </li>
                            <li><g:link action="create"><g:message code="default.new.masculin.label" args="[entityName]"/></g:link> </li>
                            %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">     
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>
                    <div class="dialog">
                        <table class="table table-bordered table-striped">
                            <tbody>                    
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.id.label" default="Id" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "id")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.title.label" default="Title" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "title")}</td>  
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.firstName.label" default="First Name" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "firstName")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.lastName.label" default="Last Name" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "lastName")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.phone.label" default="Phone" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "phone")}</td> 
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.mobile.label" default="Mobile" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "mobile")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.email.label" default="Email" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "email")}</td>  
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.fax.label" default="Fax" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "fax")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.notes.label" default="Notes" /></td>
                                    <td valign="top" class="value">${fieldValue(bean: contactInstance, field: "notes")}</td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.publish.label" default="Publish" /></td>
                                    <td valign="top" class="value"><g:formatBoolean boolean="${contactInstance?.publish}" /></td>
                                </tr>
        <!-- contact for -->    <tr class="prop">
                                    <td valign="top" class="name"><g:message code="contact.for.label" default="Contact for:" /></td>
                                    <td valign="top" style="text-align: left;" class="value">
                                        <ul>
                                            <g:each in="${contactInstance?.getContactsFor()}" var="entity">
                                                    <li><g:link controller="${cl.controller(type: entity?.entityType())}" action="show" id="${entity?.uid}">${entity?.name}</g:link></li>
                                            </g:each>
                                        </ul>
                                    </td>
                                </tr>
                            <!-- change history -->
                                <g:if test="${changes}">
                                    <tr class="prop">
                                        <td valign="top" class="name">Historique de modification</td>
                                        <td>
                                            <g:each var="ch" in="${changes}" status="row">
                                                <g:link controller='auditLogEvent' action='show' id='${ch.id}'>${ch.lastUpdated}: ${ch.actor}
                                                    <cl:changeEventName event="${ch.eventName}" highlightInsertDelete="true"/> <strong>${ch.propertyName}</strong>
                                                </g:link> <br />
                                            </g:each>
                                        </td>
                                    </tr>                  
                                </g:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-4"></div>
                        <div class="col-md-5">
                            <g:form>
                                <g:hiddenField name="id" value="${contactInstance?.id}" />
                               <g:actionSubmit class="edit-btn btn btn-sm" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                                <g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label', args:[entityName], default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </g:form>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
            </div>
    </body>
</html>
