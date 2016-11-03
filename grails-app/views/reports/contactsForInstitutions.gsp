<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="reports.title" /> - <g:message code="reports.cfi.title" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="reports.cfi.title01" /> (${contacts.size()})</h1>
        <div class="container-fluid">
            <div class="col-md-3 col-lg-3">
                <div class="region-menu-gauche">
                    <ul class="menu nav">
                        <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
                        <li><g:link class="list" action="list"><g:message code="reports.li.reports" /></g:link> </li>
                        %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="body reports">
                <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                </g:if>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr class="reportGroupTitle">
                            <td><g:message code="reports.cfi.table0101" /></td>
                            <td><g:message code="reports.cfi.table0102" /></td>
                            <td><g:message code="reports.cfi.table0103" /></td>
                            <td><g:message code="reports.cfi.table0104" /></td>
                        </tr>
                    </thead>
                    <colgroup>
                        <col width="45%"/><col width="5%"/><col width="23%"/><col width="27%"/>
                    </colgroup>
                    <g:each var="cfc" in="${contacts}">
                        <tr>
                            <td><g:link controller="institution" action="show" id="${cfc.entityUid}">${cfc.entityName}</g:link></td>
                            <td>${cfc.entityAcronym}</td>
                            <td style="color:blue;">${cfc.contactName}</td>
                            <td>${cfc.contactEmail}</td>
                        </tr>
                     </g:each>
                 </table>
             </div>
        </div>
    </body>
</html>
