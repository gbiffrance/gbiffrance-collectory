
<%@ page import="au.org.ala.collectory.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'contact')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="default.edit.label" args="[entityName]" /> - ${fieldValue(bean: contactInstance, field: "title")} ${fieldValue(bean: contactInstance, field: "lastName")}</h1>
            <div class="container-fluid">
                <div class="col-md-3 col-lg-3">
                    <div class="region-menu-gauche">
                        <ul class="menu nav">
                            <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                            <li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link> </li>
                            %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                        </ul>
                    </div>
                </div>

                <div class="col-md-9">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${contactInstance}">
                        <div class="errors">
                             <g:renderErrors bean="${contactInstance}" as="list" />
                        </div>
                    </g:hasErrors>
                    <g:form method="post" >
                        <g:hiddenField name="id" value="${contactInstance?.id}" />
                        <g:hiddenField name="version" value="${contactInstance?.version}" />
                        <g:hiddenField name="returnTo" value="${returnTo}" />
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                <label for="title"><g:message code="contact.title.label" default="Title" /></label>
                            </div>
                            <div class="col-md-10">
                                <g:select name="title" from="${contactInstance.constraints.title.inList}" value="${contactInstance?.title}" valueMessagePrefix="contact.title" noSelection="['': '']" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                <label for="firstName"><g:message code="contact.firstName.label" default="First Name" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'firstName', 'errors')} col-md-10">
                                <g:textField name="firstName" class="input-xlarge" value="${contactInstance?.firstName}" />
                             </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                <label for="lastName"><g:message code="contact.lastName.label" default="Last Name" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'lastName', 'errors')} col-md-10">
                                <g:textField name="lastName" class="input-xlarge" value="${contactInstance?.lastName}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                 <label for="phone"><g:message code="contact.phone.label" default="Phone" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'phone', 'errors')} col-md-10">
                                <g:textField name="phone" maxlength="45" value="${contactInstance?.phone}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                 <label for="mobile"><g:message code="contact.mobile.label" default="Mobile" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'contactInstance', 'errors')} col-md-10">
                                <g:textField name="mobile" maxlength="45" value="${contactInstance?.mobile}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                 <label for="email"><g:message code="contact.email.label" default="Email" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'email', 'errors')} col-md-10">
                                <g:textField name="email" value="${contactInstance?.email}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                 <label for="fax"><g:message code="contact.fax.label" default="Fax" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'fax', 'errors')} col-md-10">
                               <g:textField name="fax"  maxlength="45" value="${contactInstance?.fax}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                 <label for="notes"><g:message code="contact.notes.label" default="Notes" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'notes', 'errors')} col-md-10">
                               <g:textArea name="notes" class="input-xxlarge" cols="40" rows="5" value="${contactInstance?.notes}" />
                            </div>
                        </div>
                         <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2">
                                  <label for="publish"><g:message code="contact.publish.label" default="Publish" /></label>
                            </div>
                            <div class="value ${hasErrors(bean: contactInstance, field: 'publish', 'errors')} col-md-10">
                               <g:checkBox name="publish" value="${contactInstance?.publish}" />
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <g:actionSubmit class="edit-btn btn btn-sm" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                <g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label.masc', args: [entityName], default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </g:form>
                </div>
            </div>
    </body>
</html>
