<%@ page import="au.org.ala.collectory.Contact; au.org.ala.collectory.ProviderGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="reports.title" /></title>
    </head>
    <body>
    <h1 id="admin-header"><g:message code="reports.contacts.title01"/></h1>

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
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>


            <div id="full">
                <p>
                    <g:message code="reports.contacts.full.tr01" />. <br />
                    <a href="#" onclick="document.getElementById('names-only').style.display='block';document.getElementById('full').style.display='none'">
                        <g:message code="reports.contacts.full.link01" />
                    </a>
                </p>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr class="reportGroupTitle">
                            <td><g:message code="reports.contacts.full.table0201" /></td>
                            <td><g:message code="reports.contacts.full.table0202" /></td>
                            <td>Téléphone</td>
                        </tr>
                    </thead>
                    <g:each var='c' in="${Contact.list([sort: 'lastName'])}">
                        <tr>
                            <td><g:link controller="contact" action="show" id="${c.id}">${c.buildName()}</g:link></td>
                            <td>${c.email?'O':' '}</td>
                            <td>${c.phone?'O':' '}</td>
                        </tr>
                    </g:each>
                </table>
            </div>
            <div id="names-only" style="display:none;">
                <p>
                    <g:message code="reports.contacts.namesonly.table0101" /> <br />
                    <a href="#"
                       onclick="document.getElementById('names-only').style.display='none';document.getElementById('full').style.display='block'">
                        (Afficher attributs)</a>
                </p>


                <table class="table table-striped table-bordered">
                    <thead>
                    <tr class="reportGroupTitle">
                        <td colspan="3"><g:message code="reports.contacts.namesonly.table0201" /></td>
                    </tr>
                    </thead>
                    <g:each var='c' in="${Contact.list([sort: 'lastName'])}">
                        <tr>
                            <td>${c.buildName()}</td>
                        </tr>
                    </g:each>
                </table>
            </div>
        </div>
    </div>

        %{--<div class="body">--}%


            %{--<div class="dialog">--}%
              %{--<div id="full">--}%
                %{--<table class="table table-striped table-bordered">--}%
                  %{--<colgroup><col width="80%"/><col width="10%"/><col width="10%"/></colgroup>--}%
                  %{--<tr><td><g:message code="reports.contacts.full.tr01" />.</td>--}%
                    %{--<td colspan="2"><a href="#"--}%
                          %{--onclick="document.getElementById('names-only').style.display='block';document.getElementById('full').style.display='none'">--}%
                    %{--<g:message code="reports.contacts.full.link01" /></a></td></tr>--}%
                  %{--<tr class="reportGroupTitle"><td><g:message code="reports.contacts.full.table0201" /></td><td><g:message code="reports.contacts.full.table0202" /></td><td>Phone</td></tr>--}%
                  %{--<g:each var='c' in="${Contact.list([sort: 'lastName'])}">--}%
                    %{--<tr>--}%
                      %{--<td><g:link controller="contact" action="show" id="${c.id}">${c.buildName()}</g:link></td>--}%
                      %{--<td>${c.email?'Y':' '}</td>--}%
                      %{--<td>${c.phone?'Y':' '}</td>--}%
                    %{--</tr>--}%
                  %{--</g:each>--}%
                %{--</table>--}%
              %{--</div>--}%
              %{--<div id="names-only" style="display:none;">--}%
                %{--<table>--}%
                  %{--<colgroup><col width="80%"/><col width="10%"/><col width="10%"/></colgroup>--}%
                  %{--<tr><td><g:message code="reports.contacts.namesonly.table0101" /></td>--}%
                    %{--<td colspan="2"><a href="#"--}%
                          %{--onclick="document.getElementById('names-only').style.display='none';document.getElementById('full').style.display='block'">--}%
                    %{--(Show attributes)</a></td></tr>--}%
                  %{--<tr class="reportGroupTitle"><td colspan="3"><g:message code="reports.contacts.namesonly.table0201" /></td></tr>--}%
                  %{--<g:each var='c' in="${Contact.list([sort: 'lastName'])}">--}%
                    %{--<tr>--}%
                      %{--<td>${c.buildName()}</td>--}%
                      %{--<td></td>--}%
                      %{--<td></td>--}%
                    %{--</tr>--}%
                  %{--</g:each>--}%
                %{--</table>--}%
              %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    </body>
</html>
