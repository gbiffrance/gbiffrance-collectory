
<div class="col-md-12 edit-contact-form" id="first-field">
  <div class="col-md-4">
    <g:if test="${fieldValue(bean: command, field: 'imageRef.file', 'errors')}">
      <img id="logo" alt="${command.imageRef.file}" title="${command.imageRef.file}"
           src="${resource(absolute: 'true', dir:'data/'+directory, file:command.imageRef.file)}" />

    </g:if>
  </div>
</div>
<div class="col-md-12 edit-contact-form" id="first-field">
  <div class="col-md-4">
    <g:if test="${fieldValue(bean: command, field: 'imageRef.file')}">
      <g:message code="shared.mes01" /> <g:message code="shared.mes02" />
    </g:if>
    <g:else>
      <g:message code="shared.mes03" /> <g:message code="shared.mes04" />
    </g:else>
  </div>
  <div class="col-md-8 value ${hasErrors(bean: command, field: 'imageRef.file', 'errors')}">
    <input type="file" name="imageFile" value="${command?.imageRef?.file}"/>
  </div>
</div>
<div class="col-md-12 edit-contact-form">
  <div class="col-md-4">
    <label for="imageRef.caption"><g:message code="providerGroup.imageRef.filename.label" default="Caption" /></label>
  </div>
  <div class="col-md-8 value ${hasErrors(bean: command, field: 'imageRef.caption', 'errors')}">
    <g:textField name="imageRef.caption" maxlength="128" value="${command?.imageRef?.caption}" class="form-control" />
  </div>
</div>
<div class="col-md-12 edit-contact-form">
  <div class="col-md-4">
    <label for="imageRef.attribution"><g:message code="providerGroup.imageRef.attribution.label" default="Attribution" /></label>
  </div>
  <div class="col-md-8 value ${hasErrors(bean: command, field: 'imageRef.attribution', 'errors')}" >
    <g:textField name="imageRef.attribution" maxlength="128" value="${command?.imageRef?.attribution}" class="form-control" />
  </div>
</div>
<div class="col-md-12 edit-contact-form">
  <div class="col-md-4">
    <label for="imageRef.copyright"><g:message code="providerGroup.imageRef.copyright.label" default="Copyright" /></label>
  </div>
  <div class="col-md-8 value ${hasErrors(bean: command, field: 'imageRef.copyright', 'errors')}" >
    <g:textField name="imageRef.copyright" maxlength="128" value="${command?.imageRef?.copyright}" class="form-control"/>
  </div>
</div>

