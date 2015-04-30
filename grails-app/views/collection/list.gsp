<%@ page import="au.org.ala.collectory.Collection" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="${grailsApplication.config.skin.layout}" />
    <g:set var="entityName" value="${message(code: 'collection.label.lower', default: 'collection')}" />
    %{-- <g:set var="entityNameLower" value="${message(code: 'collection.label', default: 'collection')}" /> --}%
    <title><g:message code="default.list.label" args="[entityName]" /> <g:message code="default.list.label.end" /></title>
</head>
<body>
    <div class="body">
        <h1 id="admin-header"><g:message code="default.list.label" args="[entityName]" /></h1>

        <div class="container-fluid">
            <div class="col-md-3 col-lg-3">
                <div class="region-menu-gauche">
                    <ul class="menu nav">
                        <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                        <li><g:link action="create"><g:message code="default.new.label" args="[entityName]"/></g:link> </li>  
                        %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                    </ul>
                </div>
            </div>


            <div class="col-md-9">
                 <div id="index"></div>
                <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
                <g:if test="${message}"><div class="message">${message}</div></g:if>
                <div class="list">
                    <table class="table table-striped table-bordered">
                        <colgroup><col width="45%"/><col width="10%"/><col width="35%"/><col width="10%"/></colgroup>
                        <thead>
                           <tr>
                                <g:sortableColumn property="name" title="${message(code: 'collection.name.label', default: 'Nom')}" params="${params}"/>
                                <g:sortableColumn property="acronym" title="${message(code: 'collection.acronym.label', default: 'Acronyme')}" params="${params}"/>
                                <g:sortableColumn property="institution" title="${message(code: 'collection.institution.label', default: 'Institution')}" />
                                <g:sortableColumn property="keywords" title="${message(code: 'collection.class.label', default: 'Classe')}" />
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${collInstanceList}" status="i" var="instance">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td>
                                        <a name="${instance.name[0]}"></a>
                                        <g:link controller="collection" action="show" id="${instance.uid}">${fieldValue(bean: instance, field: "name")}</g:link>
                                    </td>
                                    <td>${fieldValue(bean: instance, field: "acronym")}</td>
                                    <td><g:link controller="institution" action="show" id="${instance.institution?.uid}">${instance.institution?.name}</g:link></td>
                                    <td><cl:reportClassification keywords="${instance.keywords}"/></td>

                                </tr>
                            </g:each>
                         </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
var sort = "${params.sort}";
if (sort == undefined || sort == "name") {
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var html = "";
    for (var i = 0; i < 26; i++) {
      var letter = letters[i];
      var selector = "a[name='" + letter + "']";
      if ($(selector).length == 0) {
        html += "<span>" + letter + "</span> ";
    } else {
        html += "<a href='#" + letter + "'>" + letter + "</a> ";
    }
}
$('div#index').html(html);
}
</script>
</body>
</html>
