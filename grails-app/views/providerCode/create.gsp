<%@ page import="au.org.ala.collectory.ProviderCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}" />
		<g:set var="entityName" value="${message(code: 'providerCode.label', default: 'ProviderCode')}" />
		<title><g:message code="default.create.label" args="[entityName]" /> <g:message code="default.list.label.end" /></title>
	</head>
	<body>
		<h1 id="admin-header"><g:message code="default.create.label" args="[entityName]" /></h1>
		<div class="col-md-3 col-lg-3">
 			<div class="region-menu-gauche">
      			<ul class="menu nav">
                	<li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                  	<li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link> </li>
                </ul>
            </div>
      	</div>
      	 <div id="entete" class="col-md-9 col-lg-9">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${providerCodeInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${providerCodeInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<div class="buttons button-ext">
						<span class="button button-int"><g:submitButton name="create" class="edit-btn btn btn-sm" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
