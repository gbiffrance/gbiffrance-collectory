<%@ page import="au.org.ala.collectory.ProviderCode" %>


<div class="col-md-12 edit-contact-form">
   	<div class="col-md-2">
		<label for="code"><g:message code="providerCode.code.label" default="Code" /></label>
		<span class="required-indicator">*</span>
	</div>
 	<div class="${hasErrors(bean: contactInstance, field: 'fax', 'errors')} required col-md-10">
       	<g:textField name="code" id="code-field"  maxlength="200" value="${providerCodeInstance?.code}" />
	</div>
</div>

