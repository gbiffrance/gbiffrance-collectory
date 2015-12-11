<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="collection.base.label" default="Edit taxonomy hints" /></title>
    </head>
    <body>
    <div class="container-fluid">
        <h1 id="metadata-header"><g:message code="shared.eth.title01" /> <em>${command.name}</em></h1>
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
            <div class="dialog">
                <div class="col-md-3">
                    <div class="region-menu-gauche">
                        <input type="submit" name="_action_updateTaxonomyHints" value="${message(code:"shared.eth.button.update")}" class="save-btn btn btn-sm">
                        <input type="submit" name="_action_cancel" value="${message(code:"shared.eth.button.cancel")}" class="cancel-btn btn btn-sm">
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-12 edit-contact-form" id="first-field">
                        <div class="col-md-4">
                            <label for="taxonomyHints"><g:message code="taxonomyHints.label" default="Taxonomy hints" /></label>

                        </div>
                        <div class="col-md-8">
                            <p><g:message code="shared.eth.des01" /> <g:message code="shared.scontact02.cell0101.fem" /> ${command.urlForm()}.</p>
                        </div>
                    </div>
                    <div class="col-md-12 edit-contact-form">
                        <div class="button-ext">
                            <div class="button-int">
                                <div class="col-md-8">
                                    <table class="table table-bordered value ${hasErrors(bean: command, field: 'taxonomyHints', 'errors')}" id="taxonomyHints">
                                        <tr>
                                            <th><g:message code="shared.eth.th01" /></th>
                                            <th><g:message code="shared.eth.th02" /></th>
                                        </tr>
                                        <tbody>
                                        <g:set var="hints" value="${command.listTaxonomyHints()}"/>
                                        <g:each var="hint" in="${hints}" status="i">
                                            <tr>
                                                <td valign="top"><g:textField name="rank_${i}" value="${hint.rank.encodeAsHTML()}" class="taxo-hint"/></td>
                                                <td valign="top"><g:textField name="name_${i}" value="${hint.name.encodeAsHTML()}" class="taxo-hint" /></td>
                                            </tr>
                                        </g:each>
                                        <g:set var="j" value="${hints.size()}"/>
                                        <g:each var="i" in="${[j, j+1, j+2]}">
                                            <tr>
                                                <td><g:textField name="rank_${i}" value="" class="taxo-hint"/></td>
                                                <td><g:textField name="name_${i}" value="" class="taxo-hint"/></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                    <cl:helpText code="taxonomyHints"/>
                                    <cl:helpTD/>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </g:form>
        </div>
    </body>
</html>
