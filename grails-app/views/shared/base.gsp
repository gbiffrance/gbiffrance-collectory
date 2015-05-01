<%@ page import="au.org.ala.collectory.DataResource; au.org.ala.collectory.DataProvider; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
        <g:set var="entityNameLower" value="${command.urlForm()}"/>
        <title><g:message code="collection.base.label" args="[entityNameLower]" default="Edit ${entityNameLower}  metadata" /></title>
    </head>
    <body>
      <g:if test="${mode == 'create'}">
        <h1>Creating a new collection</h1>
      </g:if>
      <g:else>
        <h1 id="metadata-header">Modification de <em>${command.name}</em></h1>
      </g:else>
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
              <input type="submit" name="_action_updateBase" value="Mettre à jour" class="save-btn btn btn-sm">
              <input type="submit" name="_action_cancel" value="Annuler" class="cancel-btn btn btn-sm">
            </div>
          </div>
          <div class="col-md-9">
            <div class="col-md-12 edit-contact-form" id="first-field">
              <div class="col-md-3">
                <label for="guid"><g:message code="collection.guid.label" default="Guid" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'guid', 'errors')} first-field">
                <g:textField name="guid" maxlength="100" value="${command?.guid}" class="form-control"/>
                <cl:helpText code="${entityNameLower}.guid"/>
                <cl:helpTD/>
              </div>
            </div>
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="name"><g:message code="collection.name.label" default="Name" />
                <br/><span class=hint>* required field</span>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'name', 'errors')}">
                <g:textField name="name" class="form-control" value="${command?.name}"/>
                <cl:helpText code="${entityNameLower}.name"/>
                <cl:helpTD/>
              </div>
            </div>
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="acronym"><g:message code="collection.acronym.label" default="Acronym" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'acronym', 'errors')}">
                <g:textField name="acronym" maxlength="45" value="${command?.acronym}" class="form-control"/>
                <cl:helpText code="providerGroup.acronym"/>
                <cl:helpTD/>
              </div>
            </div>
            <g:if test="${command.ENTITY_TYPE == 'DataResource'}">
              <div class="col-md-12 edit-contact-form">
                <div class="col-md-3">
                  <label for="resourceType"><g:message code="collection.resourceType.label" default="Resource type" /></label>
                </div>
                <div class="col-md-9 value ${hasErrors(bean: command, field: 'resourceType', 'errors')}">
                  <g:select name="resourceType" from="${DataResource.resourceTypeList}" value="${command.resourceType}" class="input-xlarge"/>
                  <cl:helpText code="providerGroup.resourceType"/>
                  <cl:helpTD/>
                </div>
              </div>
            </g:if>
            <g:if test="${command.ENTITY_TYPE == 'Collection'}">
              <div class="col-md-12 edit-contact-form">
                <div class="col-md-3">
                  <label for="institution.id"><g:message code="collection.institution.label" default="Institution"/></label>
                </div>
                <div class="col-md-9 value ${hasErrors(bean: command, field: 'institution', 'errors')}">
                  <g:select name="institution.id"  from="${Institution.list([sort:'name'])}" optionKey="id" noSelection="${['null':'Select an institution']}" value="${command.institution?.id}" class="form-control"/>
                  <cl:helpText code="collection.institution"/>
                  <cl:helpTD/>
                </div>
              </div>
            </g:if>
            <g:if test="${command.ENTITY_TYPE == 'DataResource'}">
              <!-- institution -->
              <div class="col-md-12 edit-contact-form">
                <div class="col-md-3">
                  <label for="dataProvider.id"><g:message code="dataResource.dataProvider.label" default="Data provider"/></label>
                </div>
                <div class="col-md-9 value ${hasErrors(bean: command, field: 'dataProvider', 'errors')}">
                  <g:select name="dataProvider.id" from="${DataProvider.list([sort:'name'])}"  optionKey="id" noSelection="${['null':'Select a data provider']}" value="${command.dataProvider?.id}" class="form-control"/>
                  <cl:helpText code="dataResource.dataProvider"/>
                  <cl:helpTD/>
                </div>
              </div>
              <div class="col-md-12 edit-contact-form">
                <div class="col-md-3">
                  <label for="institution.id"><g:message code="institution.dataProvider.label" default="Institution"/></label>
                </div>
                <div class="col-md-9 value ${hasErrors(bean: command, field: 'institution', 'errors')}">
                  <g:select name="institution.id" from="${Institution.list([sort:'name'])}" optionKey="id" noSelection="${['null':'Select an institution']}" value="${command.institution?.id}" class="form-control"/>
                  <cl:helpText code="dataResource.institution"/>
                  <cl:helpTD/>
                </div>
              </div>
            </g:if>
            <!-- web site url -->
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="websiteUrl"><g:message code="providerGroup.websiteUrl.label" default="Website Url" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'websiteUrl', 'errors')}">
                <g:textField name="websiteUrl" class="form-control" value="${command?.websiteUrl}" />
                <cl:helpText code="providerGroup.websiteUrl"/>
                <cl:helpTD/>
              </div>
            </div>
            <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="notes"><g:message code="providerGroup.notes.label" default="Notes" /></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'notes', 'errors')}">
                <g:textArea name="notes" cols="40" class="form-control" rows="${cl.textAreaHeight(text:command.notes)}" value="${command?.notes}" />
                <cl:helpText code="collection.notes"/>
                <cl:helpTD/>
              </div>
            </div>
          </div>
        </g:form>
      </div>
    </body>
</html>
