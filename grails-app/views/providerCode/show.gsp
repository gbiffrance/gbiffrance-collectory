
<%@ page import="au.org.ala.collectory.ProviderCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}" />
		<g:set var="entityName" value="${message(code: 'providerCode.label', default: 'ProviderCode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<h1 id="admin-header"><g:message code="default.show.label" args="[entityName]" /></h1>
          	<div class="col-md-3 col-lg-3">
 				<div class="region-menu-gauche">
      				<ul class="menu nav">
                       	<li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                       	<li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link> </li>
                        <li><g:link action="create"><g:message code="default.new.masculin.label" args="[entityName]"/></g:link> </li>
						<li><g:link controller="providerMap">Créer / modifier un Provider Map</g:link></li>

                        %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                   	</ul>
               	</div>
          	</div>

          	<div class="col-md-9 col-lg-9">
          		<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered">
					<tbody>
						<g:if test="${providerCodeInstance?.code}">
							<tr>
								<td class="name"><g:message code="providerCode.code.label" default="Code" /></td>
								<td><g:fieldValue bean="${providerCodeInstance}" field="code"/></td>
							</tr>
						</g:if>
					</tbody>
				</table>
				 <div class="col-md-12">
				 	<div class="col-md-4"></div>
	     			<div class="col-md-5">
	 					<g:form>
	                		<g:hiddenField name="id" value="${providerCodeInstance?.id}" />
	             			<g:actionSubmit class="edit-btn btn btn-sm" action="edit" value="${message(code: 'default.button.edit.label', default: 'Editer')}" />
	                    	<g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label', args:[entityName], default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
	                   	</g:form>
	      			</div>
				</div>
			</div>
		</div>
	</body>
</html>
