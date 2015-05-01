<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="dataProvider.base.label" default="Edit data provider metadata" /></title>
    </head>
    <body>
        <h1 id="metadata-header"><g:message code="collection.title.editing" /> <em> ${command.name} </em></h1>
        <div id="baseForm" class="body">
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
                <div class="col-md-3">
                    <div class="region-menu-gauche">
                        <input type="submit" name="_action_updateDescription" value="${message(code:"collection.button.update")}" class="save-btn btn btn-sm"></span>  
                       <input type="submit" name="_action_cancel" value="${message(code:"collection.button.cancel")}" class="cancel-btn btn btn-sm"></span>
                    </div>
                </div>
                <div class="dialog">
                     <div class="col-md-9">
                        <!-- public description -->
                        <div class="col-md-12 edit-contact-form" id="first-field">
                            <div class="col-md-3">
                                <label for="pubDescription"><g:message code="providerGroup.pubDescription.label" default="Public Description" /></label>
                            </div>
                            <div class="col-md-9 value ${hasErrors(bean: command, field: 'pubDescription', 'errors')}">
                                <g:textArea name="pubDescription" cols="40" rows="${cl.textAreaHeight(text:command.pubDescription)}" value="${command.pubDescription}" class="form-control"/>
                                <cl:helpText code="providerGroup.pubDescription"/>
                                <cl:helpTD/>
                            </div>
                        </div>

                        <!-- tech description -->
                        <div class="col-md-12 edit-contact-form" id="first-field">
                            <div class="col-md-3">
                              <label for="techDescription"><g:message code="providerGroup.techDescription.label" default="Technical Description" /></label>
                            </div>
                            <div class="col-md-9 value ${hasErrors(bean: command, field: 'techDescription', 'errors')}">
                                <g:textArea name="techDescription" cols="40" rows="${cl.textAreaHeight(text:command.techDescription)}" value="${command?.techDescription}" class="form-control"/>
                                <cl:helpText code="providerGroup.techDescription"/>
                                <cl:helpTD/>
                            </div>
                        </div>
   


                        <!-- focus -->
                        <div class="col-md-12 edit-contact-form" id="first-field">
                            <div class="col-md-3">
                              <label for="focus"><g:message code="providerGroup.focus.label" default="Contribution" /></label>
                            </div>
                            <div class="col-md-9 value ${hasErrors(bean: command, field: 'focus', 'errors')}">
                                <g:textArea name="focus" cols="40" rows="${cl.textAreaHeight(text:command.focus)}" value="${command?.focus}" class="form-control"/>
                                <cl:helpText code="providerGroup.focus"/>
                                <cl:helpTD/>
                            </div>
                        </div>
                    </div>
                </div>  
            </g:form>
        </div>
    </body>
</html>
