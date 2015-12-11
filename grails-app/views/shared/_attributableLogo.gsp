
  <div class="col-md-12 edit-contact-form" id="first-field">
    <div class="col-md-4">
      <g:if test="${fieldValue(bean: command, field: 'logoRef.file')}">
        <img id="logo" alt="${fieldValue(bean: command, field: "logoRef.file")}"
             src="${resource(absolute: 'true', dir:'data/'+directory, file:command.logoRef.file)}" />
        ${command.logoRef.file}
      </g:if>
    </div>
  </div>
  <div class="col-md-12 edit-contact-form">
    <div class="col-md-4">
      <g:if test="${fieldValue(bean: command, field: 'logoRef.file')}">
        <label for="logoFile"> <g:message code="shared.mes01" /> <g:message code="shared.mes02" /></label>
      </g:if>
      <g:else>
        <label for="logoFile"> <g:message code="shared.mes03" /> <g:message code="shared.mes04" /></label>
      </g:else>
    </div>
    <div class="col-md-8 value ${hasErrors(bean: command, field: 'logoRef.file', 'errors')}">
      <input id="logoFile" type="file" name="logoFile" value="${command?.logoRef?.file}" />
    </div>
  </div>
  <div class="col-md-12 edit-contact-form">
    <div class="col-md-4">
      <label for="logoRef.caption"><g:message code="providerGroup.logoRef.filename.label" default="Caption" /></label>
    </div>
    <div class="col-md-8 value ${hasErrors(bean: command, field: 'logoRef.caption', 'errors')}}">
      <g:textField name="logoRef.caption" maxlength="128" value="${command?.logoRef?.caption}" class="form-control"/>
    </div>
  </div>
  <div class="col-md-12 edit-contact-form">
    <div class="col-md-4">
      <label for="logoRef.attribution"><g:message code="providerGroup.logoRef.attribution.label" default="Attribution" /></label>
    </div>
    <div class="col-md-8 value ${hasErrors(bean: command, field: 'logoRef.attribution', 'errors')}}">
      <g:textField name="logoRef.attribution" maxlength="128" value="${command?.logoRef?.attribution}" class="form-control"/>
    </div>
  </div>
  <div class="col-md-12 edit-contact-form">
    <div class="col-md-4">
      <label for="logoRef.copyright"><g:message code="providerGroup.logoRef.copyright.label" default="Copyright" /></label>
    </div>
    <div class="col-md-8 value ${hasErrors(bean: command, field: 'logoRef.copyright', 'errors')}}">
      <g:textField name="logoRef.copyright" maxlength="128" value="${command?.logoRef?.copyright}" class="form-control"/>
    </div>
  </div>

