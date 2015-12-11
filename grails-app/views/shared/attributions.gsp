r<%@ page import="au.org.ala.collectory.ProviderGroup" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
  <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
  <g:set var="entityNameLower" value="${command.ENTITY_TYPE.toLowerCase()}"/>
  <title>Edit ${entityNameLower} metadata</title>
</head>
<body onload="load();">
  <style>
  #mapCanvas {
    width: 300px;
    height: 300px;
    float: right;
  }
  </style>
  <div class="container-fluid">
    <h1 id="metadata-header"><g:message code="shared.title.editing" /> <em> ${fieldValue(bean: command, field: "name")} </em></h1>


  <g:if test="${message}">
    <div class="message">${message}</div>
  </g:if>
  <g:hasErrors bean="${command}">
    <div class="errors">
      <g:renderErrors bean="${command}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post" enctype="multipart/form-data" action="editCollection">
    <g:hiddenField name="id" value="${command?.id}"/>
    <g:hiddenField name="version" value="${command.version}"/>
    <div class="dialog">
      <div class="col-md-3">
        <div class="region-menu-gauche">
          <input type="submit" name="_action_updateAttributions" value="${message(code:"shared.images.button.update")}" class="save-btn btn btn-sm">
          <input type="submit" name="_action_cancel" value="${message(code:"shared.images.button.cancel")}" class="cancel-btn btn btn-sm">
        </div>
      </div>
      <div class="col-md-9">
        <div class="col-md-12 edit-contact-form" id="first-field">
          <div class="col-md-5">
            <label for="institution"><g:message code="shared.attributes.label04" /></label>
          </div>
          <div class="col-md-7 value">
            <g:checkBox disabled="true" name="institution" value="${true}"/>
            <cl:helpText code="providerGroup.attribution.institution"/>
          </div>
          <cl:helpTD/>
        </div>
      </div>
    </div>
  </g:form>
</div>

</body>
</html>
