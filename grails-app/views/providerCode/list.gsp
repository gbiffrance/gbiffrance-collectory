
<%@ page import="au.org.ala.collectory.ProviderCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}" />
		<g:set var="entityName" value="${message(code: 'providerCode.label', default: 'provider code')}" />
		<title><g:message code="default.list.label" args="[entityName]" /> <g:message code="default.list.label.end" /></title>
	</head>
	<body>
		<h1 id="admin-header"><g:message code="default.list.label" args="[entityName]" /></h1>
            <div class="container-fluid">
                <div class="col-md-3 col-lg-3">
                    <div class="region-menu-gauche">
                        <ul class="menu nav">
                            <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                            <li><g:link action="create"><g:message code="default.new.masculin.label" args="[entityName]"/></g:link> </li>
                            %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                        </ul>
                    </div>
                </div>
                <div class="col-md-9 col-lg-9">
                	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
	                <table class="table table-condensed">
						<thead>
							<tr>
								<g:sortableColumn property="code" title="${message(code: 'providerCode.code.label', default: 'Code')}" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${providerCodeInstanceList}" status="i" var="providerCodeInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td>
										<g:link action="show" id="${providerCodeInstance.id}">${fieldValue(bean: providerCodeInstance, field: "code")}</g:link>
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${providerCodeInstanceTotal}" />
					</div>
				</div>
			</div>
	</body>
</html>
