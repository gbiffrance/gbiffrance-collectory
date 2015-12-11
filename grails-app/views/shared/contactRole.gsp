<%@ page import="au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
        <g:set var="entityNameLower" value="${command.ENTITY_TYPE.toLowerCase()}"/>
        <title><g:message code="${entityNameLower}.base.label" default="Edit ${entityNameLower} metadata" /></title>
    </head>
    <body>
        <div class="container-fluid">
            <h1 id="metadata-header"><g:message code="shared.title.editing" /> <em>${command.name}</em></h1>
            <g:if test="${message}">
                <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
                <div class="errors">
                    <g:renderErrors bean="${command}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" name="baseForm" action="base">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <g:hiddenField name="contactForId" value="${cf.id}" />
                <g:hiddenField name="returnTo" value="${returnTo}" />
                <div class="dialog">
                    <div class="col-md-3">
                        <div class="region-menu-gauche">
                            <input type="submit" name="_action_updateContactRole" value="${message(code:"shared.images.button.update")}" class="save-btn btn btn-sm">
                            <input type="submit" name="_action_cancel" value="${message(code:"shared.images.button.cancel")}" class="cancel-btn btn btn-sm">
                        </div>
                    </div>
                    <div class="col-md-9">
                        <h2 class="admin-h2"><g:message code="shared.cr.table0101" /> ${cf.contact?.buildName()} pour ${command.name}</h2>
                        <div class="col-md-12 edit-contact-form" id="first-field">
                            <div class="col-md-3">
                                <label for="role"><g:message code="shared.cr.table0201" /></label>
                            </div>
                            <div class="col-md-9 value">
                                <g:textField name="role" value="${cf?.role}" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-3">
                                <label for="administrator"><g:message code="shared.cr.table0301" /></label>
                            </div>
                            <div class="col-md-1 value">
                                <g:checkBox  name="administrator" value="${cf?.administrator}"/>
                            </div>
                            <div class="col-md-8">
                                <g:message code="shared.cr.table0302" /> ${entityNameLower}.
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-3">
                                <label for="notify"><g:message code="shared.cr.table0401" /></label>
                            </div>
                            <div class="col-md-1 value">
                                <g:checkBox name="notify" value="${cf?.notify}"/>
                            </div>
                            <div class="col-md-8">
                                <g:message code="shared.cr.table0402" /> ${entityNameLower}.
                            </div>
                        </div>
                        <div class="col-md-12 edit-contact-form">
                            <div class="col-md-3">
                                <label for="primaryContact"><g:message code="shared.cr.table0501" /></label>
                            </div>
                            <div class="col-md-1 value">
                                <g:checkBox name="primaryContact" value="${cf?.primaryContact}"/>
                            </div>
                            <div class="col-md-8">
                                <g:message code="shared.cr.table0502" /> ${entityNameLower}.
                            </div>
                        </div>
                    </div>
            </g:form>
        </div>
    </body>
</html>
