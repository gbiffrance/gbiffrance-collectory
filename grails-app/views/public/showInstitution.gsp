<%@ page contentType="text/html;charset=UTF-8" import="au.org.ala.collectory.DataResource; au.org.ala.collectory.Institution" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
    <title><cl:pageTitle>${fieldValue(bean: instance, field: "name")}</cl:pageTitle></title>
    <script type="text/javascript" language="javascript" src="http://www.google.com/jsapi"></script>
    <r:require modules="jquery, fancybox, jquery_tools, jquery_jsonp, charts"/>
    <r:script type="text/javascript">
      biocacheServicesUrl = "${grailsApplication.config.biocacheServicesUrl}";
      biocacheWebappUrl = "${grailsApplication.config.biocacheUiURL}";
      loadLoggerStats = ${!grailsApplication.config.disableLoggerLinks.toBoolean()};
      $(document).ready(function () {
        $("a#lsid").fancybox({
            'hideOnContentClick': false,
            'titleShow': false,
            'autoDimensions': false,
            'width': 600,
            'height': 180
        });
        $("a.current").fancybox({
            'hideOnContentClick': false,
            'titleShow': false,
            'titlePosition': 'inside',
            'autoDimensions': true,
            'width': 300
        });
        $('#overviewTabs a:first').tab('show');
      });
    </r:script>
</head>

<body>
<div id="content">
    <div id="header" class="collectory">
        <cl:pageOptionsPopup instance="${instance}"/>
        <cl:h1 value="${instance.name}"/>
        <div class="row">

            <div class="col-md-8" id="row-public">
                <g:set var="parents" value="${instance.listParents()}"/>
                <g:each var="p" in="${parents}">
                    <p><g:link action="show" id="${p.uid}">${p.name}</g:link></p>
                </g:each>
                <cl:valueOrOtherwise value="${instance.acronym}">
                    <p>Acronym: ${fieldValue(bean: instance, field: "acronym")}</p>
                </cl:valueOrOtherwise>
                %{--<cl:valueOrOtherwise value="${instance.guid}">--}%
                    %{--<p><g:message code="public.show.header.guid" /> : ${fieldValue(bean: instance, field: "guid")}</p>--}%
                %{--</cl:valueOrOtherwise>--}%
            </div>
         </div>

            %{--<div class="col-md-4">--}%
                %{--<g:if test="${fieldValue(bean: instance, field: 'logoRef') && fieldValue(bean: instance, field: 'logoRef.file')}">--}%
                    %{--<img class="institutionImage"--}%
                         %{--src='${resource(absolute: "true", dir: "data/institution/", file: fieldValue(bean: instance, field: 'logoRef.file'))}'/>--}%
                %{--</g:if>--}%
            %{--</div>--}%

    </div><!--close header-->

    <div class="tabbable tabbable-institution">
        <ul class="nav nav-tabs" id="overviewTabs">
            <li><a id="tab1" href="#overviewTab" data-toggle="tab"><g:message code="public.show.overviewtabs.overview" /></a></li>
            <li><a id="tab2" href="#statTab" data-toggle="tab"><g:message code="public.show.overviewtabs.stat" /></a></li>
            %{--<li id="imagesTabEl" style="display:none;"><a id="tab3" href="#imagesTab" data-toggle="tab"><g:message code="public.show.overviewtabs.images" /></a></li>--}%
        </ul>
    </div>

    <div class="tab-content">
        <div id="overviewTab"  class="tab-pane active row">
            <div id="overview-content" class="col-md-8">
                    <g:if test="${instance.pubDescription}">
                        <h2 class="admin-h2"><g:message code="public.des" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "pubDescription")}</cl:formattedText>
                        <cl:formattedText>${fieldValue(bean: instance, field: "techDescription")}</cl:formattedText>
                    </g:if>
                    <g:if test="${instance.focus}">
                        <h2 class="admin-2"><g:message code="public.si.content.label02" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>
                    </g:if>
                    <h2 class="admin-h2"><g:message code="public.si.content.label03" /></h2>
                    <ol>
                        <g:each var="c" in="${instance.listCollections().sort { it.name }}">
                            <li><g:link controller="public" action="show"
                                        id="${c.uid}">${c?.name}</g:link> <br /> <p class="desc-coll">${c?.makeAbstract(400)}</p></li>
                        </g:each>
                    </ol>

                    %{--<div id='usage-stats'>--}%
                        %{--<h2 class="admin-h2"><g:message code="public.usagestats.label" /></h2>--}%

                        %{--<div id='usage'>--}%
                            %{--<p><g:message code="public.usage.des" />...</p>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                 </div>
            <div id="overview-sidebar" class="col-md-4">
                    <g:if test="${fieldValue(bean: instance, field: 'logoRef') && fieldValue(bean: instance, field: 'logoRef.file')}">
                        <div>
                            <img class="institutionImage"
                                 src='${resource(absolute: "true", dir: "data/institution/", file: fieldValue(bean: instance, field: 'logoRef.file'))}'/>
                        </div>
                    </g:if>
                    <g:if test="${fieldValue(bean: instance, field: 'imageRef') && fieldValue(bean: instance, field: 'imageRef.file')}">
                        <div class="section">
                            <img alt="${fieldValue(bean: instance, field: "imageRef.file")}"
                                 src="${resource(absolute: "true", dir: "data/institution/", file: instance.imageRef.file)}"/>
                            <cl:formattedText
                                    pClass="caption">${fieldValue(bean: instance, field: "imageRef.caption")}</cl:formattedText>
                            <cl:valueOrOtherwise value="${instance.imageRef?.attribution}"><p
                                    class="caption">${fieldValue(bean: instance, field: "imageRef.attribution")}</p></cl:valueOrOtherwise>
                            <cl:valueOrOtherwise value="${instance.imageRef?.copyright}"><p
                                    class="caption">${fieldValue(bean: instance, field: "imageRef.copyright")}</p></cl:valueOrOtherwise>
                        </div>
                    </g:if>

                    <div id="dataAccessWrapper" style="display:none;">
                        <g:render template="dataAccess" model="[instance:instance]"/>
                    </div>

                    <div class="section">
                        <h3 class="public-h3"><g:message code="public.location" /></h3>
                        <g:if test="${instance.address != null && !instance.address.isEmpty()}">
                            <p>
                                <cl:valueOrOtherwise
                                        value="${instance.address?.street}">${instance.address?.street}<br/></cl:valueOrOtherwise>
                                <cl:valueOrOtherwise
                                        value="${instance.address?.city}">${instance.address?.city}<br/></cl:valueOrOtherwise>
                                <cl:valueOrOtherwise
                                        value="${instance.address?.state}">${instance.address?.state}</cl:valueOrOtherwise>
                                <cl:valueOrOtherwise
                                        value="${instance.address?.postcode}">${instance.address?.postcode}<br/></cl:valueOrOtherwise>
                                <cl:valueOrOtherwise
                                        value="${instance.address?.country}">${instance.address?.country}<br/></cl:valueOrOtherwise>
                            </p>
                        </g:if>
                        <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
                        <cl:ifNotBlank value='${fieldValue(bean: instance, field: "phone")}'/>
                    </div>

                    <!-- contacts -->
                    <g:render template="contacts" bean="${instance.getPublicContactsPrimaryFirst()}"/>

                    <!-- web site -->
                    <g:if test="${instance.websiteUrl}">
                        <div class="section">
                            <h3 class="public-h3"><g:message code="public.website" /></h3>
                            <div class="webSite">
                                <a class='external' target="_blank"
                                   href="${instance.websiteUrl}"><g:message code="public.si.website.link01" /> <g:message code="public.si.website.link02.voy" /><cl:institutionType value="${instance.name}"/></a>
                            </div>
                        </div>
                    </g:if>

                </div>
        </div>
        <div id="statTab" class="tab-pane row">
                %{--<h2 class="admin-h2"><g:message code="public.si.content.label04" /></h2>--}%
            <div id="stat-content" class="col-md-8">
                %{--<div>--}%
                    %{--<p style="padding-bottom:8px;"><span--}%
                            %{--id="numBiocacheRecords"><g:message code="public.numbrs.des01" /></span> <g:message code="public.numbrs.des02" />.--}%
                    %{--</p>--}%

                %{--</div>--}%

                <div id="recordsBreakdown" class="section vertical-charts">
                    <div id="charts"></div>
                </div>

                <cl:lastUpdated date="${instance.lastUpdated}"/>
            </div>
            <div id="stat-sidebar" class="col-md-4">
                %{--<cl:recordsLink--}%
                        %{--entity="${instance}"><g:message code="public.numbrs.link" /> ${instance.name}.</cl:recordsLink>--}%

                <g:render template="dataAccess" model="[instance:instance]"/>

            </div>
        </div><!--close section-->
    </div>
</div>
<r:script type="text/javascript">
      // configure the charts
      var facetChartOptions = {
          /* base url of the collectory */
          collectionsUrl: "${grailsApplication.config.grails.serverURL}",
          /* base url of the biocache ws*/
          biocacheServicesUrl: biocacheServicesUrl,
          /* base url of the biocache webapp*/
          biocacheWebappUrl: biocacheWebappUrl,
          /* a uid or list of uids to chart - either this or query must be present
            (unless the facet data is passed in directly AND clickThru is set to false) */
          instanceUid: "${instance.descendantUids().join(',')}",
          /* the list of charts to be drawn (these are specified in the one call because a single request can get the data for all of them) */
          charts: ['country','state','species_group','assertions','type_status',
              'biogeographic_region','state_conservation','occurrence_year']
      }
      var taxonomyChartOptions = {
          /* base url of the collectory */
          collectionsUrl: "${grailsApplication.config.grails.serverURL}",
          /* base url of the biocache ws*/
          biocacheServicesUrl: biocacheServicesUrl,
          /* base url of the biocache webapp*/
          biocacheWebappUrl: biocacheWebappUrl,
          /* a uid or list of uids to chart - either this or query must be present */
          instanceUid: "${instance.descendantUids().join(',')}",
          /* threshold value to use for automagic rank selection - defaults to 55 */
          threshold: 55,
          rank: "${instance.startingRankHint()}"
      }

    /************************************************************\
    * Actions when page is loaded
    \************************************************************/
    function onLoadCallback() {

      // stats
      if(loadLoggerStats){
        loadDownloadStats("${grailsApplication.config.loggerURL}", "${instance.uid}","${instance.name}", "1002");
      }

      // records
      $.ajax({
        url: urlConcat(biocacheServicesUrl, "/occurrences/search.json?pageSize=0&q=") + buildQueryString("${instance.descendantUids().join(',')}"),
        dataType: 'jsonp',
        timeout: 20000,
        complete: function(jqXHR, textStatus) {
            if (textStatus == 'timeout') {
                noData();
                alert('Sorry - the request was taking too long so it has been cancelled.');
            }
            if (textStatus == 'error') {
                noData();
                alert('Sorry - the records breakdowns are not available due to an error.');
            }
        },
        success: function(data) {
            // check for errors
            if (data.length == 0 || data.totalRecords == undefined || data.totalRecords == 0) {
                noData();
            } else {
                setNumbers(data.totalRecords);
                // draw the charts
                drawFacetCharts(data, facetChartOptions);
                if(data.totalRecords > 0){
                    $('#dataAccessWrapper').css({display:'block'});
                    $('.totalRecordCountLink').html(data.totalRecords.toLocaleString() + ' enregistrements');
                }
            }
        }
      });

      // taxon chart
      loadTaxonomyChart(taxonomyChartOptions);
    }
    /************************************************************\
    *
    \************************************************************/

    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(onLoadCallback);

    // perform JavaScript after the document is scriptable.
    $(function() {
      // setup ul.tabs to work as tabs for each div directly under div.panes
      $("ul#nav-tabs").tabs("div.panes > div", {history: true, effect: 'fade', fadeOutSpeed: 200});
    });

</r:script>
</body>
</html>