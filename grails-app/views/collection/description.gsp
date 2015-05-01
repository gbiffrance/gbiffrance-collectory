<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'collection.label.lower', default: 'collection')}"/>
        <title><g:message code="collection.base.label.desc" default="Description de la collection " args="[entityName]"/> <g:message code="default.list.label.end" /></title>
    </head>
    <body id="body-wrapper">
      <g:if test="${mode == 'create'}">
        <h1 id="metadata-header"><g:message code="collection.des.title" /></h1>
      </g:if>
      <g:else>
        <h1 id="metadata-header"><g:message code="collection.title.editing" /> <em>${command.name}</em></h1>
      </g:else>
      <div id="baseForm" >
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
              <input type="submit" name="_action_updateDescription" value="${message(code:"collection.button.update")}" class="save-btn btn btn-sm">
              <input type="submit" name="_action_cancel" value="${message(code:"collection.button.cancel")}" class="cancel-btn btn btn-sm">
            </div>
          </div>
          <div class="col-md-9">
            <!-- public description -->
            <div class="col-md-12 edit-contact-form" id="first-field">
              <div class="col-md-3">
                <label for="pubDescription"><g:message code="providerGroup.pubDescription.label" default="Public Description" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'pubDescription', 'errors')} first-field">
                <g:textArea name="pubDescription" class="form-control" rows="${cl.textAreaHeight(text:command.pubDescription)}" value="${command.pubDescription}" />
                <cl:helpText code="collection.pubDescription"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- tech description -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="techDescription"><g:message code="providerGroup.techDescription.label" default="Technical Description" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'techDescription', 'errors')}">
                <g:textArea name="techDescription"  class="form-control" rows="${cl.textAreaHeight(text:command.techDescription)}" value="${command?.techDescription}" />
                <cl:helpText code="collection.techDescription"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- focus -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="focus"><g:message code="providerGroup.focus.label" default="Focus" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'focus', 'errors')}">
                <g:textArea name="focus" class="form-control" rows="${cl.textAreaHeight(text:command.focus)}" value="${command?.focus}" />
                <cl:helpText code="collection.focus"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- type -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="collectionType"><g:message code="collection.collectionType.label" default="Collection Type" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'collectionType', 'errors')}">
                <cl:checkboxSelect name="collectionType" from="${command.collectionTypes}" value="${command.listCollectionTypes()}" multiple="yes" valueMessagePrefix="collection.collectionType" noSelection="['': '']" />
                 <cl:helpText code="collection.collectionType"/>
                <cl:helpTD/>
                %{-- <img class="helpButton" alt="help" src="${resource(dir:'images/skin', file:'help.gif')}" onclick="toggleHelp(this);"/> --}%
              </div>
            </div>
            <!-- growth status -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="active"><g:message code="providerGroup.sources.active.label" default="Status" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: infoSourceInstance, field: 'active', 'errors')}">
                <g:select name="active" from="${command.constraints.active.inList}" value="${command?.active}" valueMessagePrefix="infoSource.active" noSelection="['': '']" class="form-control"/>
                <cl:helpText code="collection.active"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- start date -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="startDate"><g:message code="collection.des.startdate" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'startDate', 'errors')}">
                <g:textField name="startDate" maxlength="45" value="${command?.startDate}" class="form-control" />
                <cl:helpText code="collection.startDate"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- end date -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="endDate"><g:message code="collection.des.enddate" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'endDate', 'errors')}">
                <g:textField name="endDate" maxlength="45" value="${command?.endDate}" class="form-control" />
                <cl:helpText code="collection.endDate"/>
                <cl:helpTD/>
              </div>
            </div>
            <!-- keywords -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="keywords"><g:message code="collection.keywords.label" default="Keywords" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'keywords', 'errors')}">
                  <g:textField name="keywords" value="${command?.listKeywords().join(',')}" class="form-control" />
                  <cl:helpText code="collection.keywords"/>
                  <cl:helpTD/>
              </div>
            </div>
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="subCollections"><g:message code="scope.subCollections.label" default="Sub-collections" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'scope.subCollections', 'errors')}">
                <p><g:message code="collection.des.des01" />.</p>
                <table class="shy"><colgroup><col width="50%"/><col width="50%"/></colgroup>
                  <tr><td><g:message code="collection.des.de02" /></td><td><g:message code="collection.des.des03" /></td></tr>
                    <g:set var="subcollections" value="${command.listSubCollections()}"/>
                    <g:each var="sub" in="${subcollections}" status="i">
                      <tr>
                        <td valign="top"><g:textField name="name_${i}" value="${sub.name.encodeAsHTML()}" /></td>
                        <td valign="top"><g:textField name="description_${i}" value="${sub.description.encodeAsHTML()}" /></td>
                      </tr>
                    </g:each>
                    <g:set var="j" value="${subcollections.size()}"/>
                    <g:each var="i" in="${[j, j+1, j+2]}">
                      <tr>
                        <td valign="top"><g:textField name="name_${i}" value="" /></td>
                        <td valign="top"><g:textField name="description_${i}" value="" /></td>
                      </tr>
                    </g:each>
                </table>
                <cl:helpText code="scope.subCollections"/>
                </td>
                  <cl:helpTD/>
                </tr>
            </div>
          </div>
        </g:form>
    </div>
  </body>
</html>
