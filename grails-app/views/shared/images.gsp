<%@ page import="au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
        <g:set var="entityNameLower" value="${command.urlForm()}"/>
        <title><g:message code="collection.base.label" default="Edit ${entityName} image metadata" /></title>
    </head>
    <body>
        <h1 id="metadata-header"><g:message code="shared.images.title01" /> <em>${command.name}</em></h1>
        <div id="baseForm" class="body">
            <g:if test="${message}">
                <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post" name="imageForm" action="image">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <g:hiddenField name="target" value="${target}" />
                <div class="dialog">
                    <div class="col-md-3">
                        <div class="region-menu-gauche">
                            <input type="submit" name="_action_updateImages" value="${message(code:"shared.images.button.update")}" class="save-btn btn btn-sm">
                            <input type="submit" name="_action_removeImage" value="${message(code:"shared.images.button.remove")}" class="delete-btn btn btn-sm">
                            <input type="submit" name="_action_cancel" value="${message(code:"shared.images.button.cancel")}" class="cancel-btn btn btn-sm">
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class=" edit-contact-form" id="first-field">
                            %{-- <div class="col-md-3">
                              <g:if test="${target == 'logoRef'}"><g:message code="shared.images.des01" /></g:if>
                              <g:else><g:message code="shared.images.des02" /><br/>image</g:else>
                            </div> --}%
                            <div class="col-md-12 value ${hasErrors(bean: command, field: target, 'errors')}">
                              <g:if test="${target == 'logoRef'}">
                                <g:render template="/shared/attributableLogo" model="[command: command, directory: entityNameLower, action: 'editCollection']"/>
                              </g:if>
                              <g:else>
                                <g:render template="/shared/attributableImage" model="[command: command, directory: entityNameLower, action: 'editCollection']"/>
                              </g:else>
                            </div>
                        </div>
                    </div>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
