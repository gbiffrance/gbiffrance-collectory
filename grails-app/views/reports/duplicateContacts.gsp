<%@ page import="au.org.ala.collectory.Classification; au.org.ala.collectory.Collection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="reports.title" /> - <g:message code="reports.dc.title" /></title>
    </head>
    <body>
        <h1 id="admin-header"><g:message code="reports.dc.title01" /></h1>
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
                    <p><g:message code="reports.dc.des01" />.</p>
                    <h2 class="admin-h2"><g:message code="reports.dc.title02" /></h2>
                    <p><g:message code="reports.dc.des02" />.</p>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr class="reportGroupTitle">
                                <td><g:message code="reports.dc.table0101" /></td>
                                <td><g:message code="reports.dc.table0102" /></td>
                            </tr>
                        </thead>
                        <col width="35%"><col width="65%">
                        <g:each in="${dupEmails}" var="de">
                            <tr>
                                <td>${de.email}</td>
                                <td>
                                    <g:each in="${de.contacts}" var="c">
                                        ${c.firstName} ${c.lastName} - (id=${c.id})
                                            <g:link controller="contact" action="show" id="${c.id}">View</g:link>
                                        <br/>
                                    </g:each>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                    <h2 class="admin-h2"><g:message code="reports.dc.title03" /></h2>
                    <p><g:message code="reports.dc.des03" />.</p>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr class="reportGroupTitle">
                                <td><g:message code="reports.dc.table0201" /></td>
                                <td><g:message code="reports.dc.table0202" /></td>
                            </tr>
                        </thead>
                        <col width="35%"><col width="65%">
                        <g:each in="${dupNames}" var="dn">
                            <tr>
                                <td>${dn.firstName} ${dn.lastName}</td>
                                <td>
                                    <g:each in="${dn.contacts}" var="c">
                                        ${c.email} - (id=${c.id})
                                            <g:link controller="contact" action="show" id="${c.id}">View</g:link>
                                        <br/>
                                    </g:each>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </div>
         </div>
    </body>
</html>