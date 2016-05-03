<%@ page import="au.org.ala.collectory.CollectoryTagLib" %>
<div class="section">
    <g:set var="facet" value="${new CollectoryTagLib().getFacetForEntity(instance)}"/>
    %{--<h3 class="public-h3"><g:message code="dataAccess.title"/></h3>--}%
    <div class="dataAccess btn-group-vertical">
        %{--<p class="totalRecordCountLink"></p>--}%
        <a href="${grailsApplication.config.biocacheUiURL}/occurrences/search?q=${facet}:${instance.uid}" id="access-occ" class="btn"> <g:message code="dataAccess.view.records"/> <br /> <span class="totalRecordCountLink"></span></a>
        %{--<a href="${grailsApplication.config.biocacheServicesUrl}/occurrences/download?q=${facet}:${instance.uid}" class="btn"><i class="icon icon-download"></i> Download records</a>--}%

        <g:if test="${!grailsApplication.config.disableLoggerLinks.toBoolean() && grailsApplication.config.loggerURL}">
            <a href="${grailsApplication.config.loggerURL}/reasonBreakdownCSV?eventId=1002&entityUid=${instance.uid}" class="btn btn-default access-data"><i class="glyphicon glyphicon-download-alt"></i> <g:message code="dataAccess.download.stats"/></a>
        </g:if>

        %{-- <cl:createNewRecordsAlertsLink query="${facet}:${instance.uid}" displayName="${instance.name}"
            linkText="${g.message(code:'dataAccess.alert.records.alt')}" altText="${g.message(code:'dataAccess.alert.records')} ${instance.name}"/>

        <cl:createNewAnnotationsAlertsLink query="${facet}:${instance.uid}" displayName="${instance.name}"
            linkText="${g.message(code:'dataAccess.alert.annotations.alt')}" altText="${g.message(code:'dataAccess.alert.annotations')} ${instance.name}"/> --}%
    </div>
</div>