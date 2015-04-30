<%@ page import="au.org.ala.collectory.ProviderCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}" />
		<g:set var="entityName" value="${message(code: 'providerCode.label', default: 'ProviderCode')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<h1 id="admin-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
          	<div class="col-md-3 col-lg-3">
 				<div class="region-menu-gauche">
      				<ul class="menu nav">
                       	<li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                       	<li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link> </li>
                        <li><g:link action="create"><g:message code="default.new.masculin.label" args="[entityName]"/></g:link> </li>
                        %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
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
				<g:form method="post" >
					<g:hiddenField name="id" value="${providerCodeInstance?.id}" />
					<g:hiddenField name="version" value="${providerCodeInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<div class="col-md-12 edit-contact-form">
                   	    <div class="col-md-8">
              	            <g:actionSubmit class="edit-btn btn btn-sm" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          	                <g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label.masc', args: [entityName], default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
   	                    </div>
                    </div>
				</g:form>
			</div>
		</div>
	</body>
</html>
