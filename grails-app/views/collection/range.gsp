<%@ page import="au.org.ala.collectory.Collection;" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="collection.base.label" default="Edit collection metadata" /></title>
    </head>
    <body>
        <div class="body-wrapper">
          <g:if test="${mode == 'create'}">
            <h1 id="metadata-header"><g:message code="collection.range.title01" /></h1>
          </g:if>
          <g:else>
            <h1 id="metadata-header"><g:message code="collection.title.editing" /> <em>${command.name}</em></h1>
          </g:else>
        </div>
        <div id="baseForm" class="body">
            <g:if test="${message}">
                <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
                <div class="errors">
                    <g:renderErrors bean="${command}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" name="baseForm" action="range">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <div class="col-md-3">
                    <div class="region-menu-gauche">
                        <input type="submit" name="_action_updateRange" value="${message(code:"collection.button.update")}" class="save-btn btn btn-sm">
                        <input type="submit" name="_action_cancel" value="${message(code:"collection.button.cancel")}" class="cancel-btn btn btn-sm">
                    </div>
                </div>
                <div class="col-md-9">
                    <!-- geographic range -->
                    <h2 class="admin-h2"><g:message code="collection.range.title"  /></h2>
                    <div class="col-md-12 edit-contact-form" id="first-field">
                        <div class="col-md-5">
                            <label for="geographicDescription"><g:message code="collection.range.label01" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'geographicDescription', 'errors')} first-field">
                            <g:textField name="geographicDescription" class="input-xxlarge" value="${command.geographicDescription}" />
                            <cl:helpText code="collection.geographicDescription"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form" id="first-field">
                        <div class="col-md-5">
                            <label for="states"><g:message code="collection.range.label02" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'states', 'errors')} first-field">
                            <g:textField name="states" value="${command?.states}" />
                            <cl:helpText code="collection.states"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <p><g:message code="collection.range.label03" />.</p>
                    <div class="col-md-12 edit-contact-form">
                        <div class="col-md-5">
                            <label for="eastCoordinate"><g:message code="collection.range.label04" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'eastCoordinate', 'errors')} first-field">
                            <g:textField name="eastCoordinate" value="${cl.showDecimal(value: command.eastCoordinate)}" />
                            <cl:helpText code="collection.eastCoordinate"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form">
                        <div class="col-md-5">
                            <label for="westCoordinate"><g:message code="collection.range.label05" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'westCoordinate', 'errors')} first-field">
                            <g:textField name="westCoordinate" value="${cl.showDecimal(value: command.westCoordinate)}" />
                            <cl:helpText code="collection.westCoordinate"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form">
                        <div class="col-md-5">
                            <label for="northCoordinate"><g:message code="collection.range.label06" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'northCoordinate', 'errors')} first-field">
                            <g:textField name="northCoordinate" value="${cl.showDecimal(value: command.northCoordinate)}" />
                            <cl:helpText code="collection.northCoordinate"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form">
                        <div class="col-md-5">
                            <label for="southCoordinate"><g:message code="collection.range.label07" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'southCoordinate', 'errors')} first-field">
                            <g:textField name="southCoordinate" value="${cl.showDecimal(value: command.southCoordinate)}" />
                            <cl:helpText code="collection.southCoordinate"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <!-- taxonomic range -->
                    <h2 class="admin-h2"><g:message code="collection.range.title02"  /></h2>
                    <div class="col-md-12 edit-contact-form" >
                        <div class="col-md-5">
                            <label for="kingdomCoverage"><g:message code="collection.range.label08" /></label>
                        </div>
                        <div class="col-md-7 checkbox">
                            <cl:checkBoxList name="kingdomCoverage" from="${Collection.kingdoms}" value="${command?.kingdomCoverage}" />
                            <cl:helpText code="collection.kingdomCoverage"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form" >
                        <div class="col-md-5">
                            <label for="scientificNames"><g:message code="collection.range.label09" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'scientificNames', 'errors')} first-field">
                            <g:textArea name="scientificNames" value="${command.listScientificNames().join(',')}"/>
                            <cl:helpText code="collection.scientificNames"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <!-- stats -->
                    <h2 class="admin-h2"><g:message code="collection.range.title03"  /></h2>
                    <div class="col-md-12 edit-contact-form" >
                        <div class="col-md-5">
                            <label for="numRecords"><g:message code="collection.numRecords.label" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'numRecords', 'errors')} first-field">
                            <g:textField name="numRecords" value="${cl.showNumber(value: command.numRecords)}" />
                            <cl:helpText code="collection.numRecords"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form" >
                        <div class="col-md-5">
                            <label for="numRecordsDigitised"><g:message code="collection.numRecordsDigitised.label" /></label>
                        </div>
                        <div class="col-md-7 value ${hasErrors(bean: command, field: 'numRecordsDigitised', 'errors')} first-field">
                            <g:textField name="numRecordsDigitised" value="${cl.showNumber(value: command.numRecordsDigitised)}" />
                            <cl:helpText code="collection.numRecordsDigitised"/>
                            <cl:helpTD/>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
