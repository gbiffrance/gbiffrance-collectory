<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder; java.text.DecimalFormat; au.org.ala.collectory.Collection; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><cl:pageTitle>${fieldValue(bean: instance, field: "name")}</cl:pageTitle></title>
        <script type="text/javascript" language="javascript" src="http://www.google.com/jsapi"></script>
        <r:require modules="jquery, fancybox, jquery_tools, jquery_jsonp, charts"/>
        <r:script type="text/javascript">
          biocacheServicesUrl = "${grailsApplication.config.biocacheServicesUrl}";
          biocacheWebappUrl = "${grailsApplication.config.biocacheUiURL}";
          loadLoggerStats = ${!grailsApplication.config.disableLoggerLinks.toBoolean()};
          $(document).ready(function() {
            $("a#lsid").fancybox({
                    'hideOnContentClick' : false,
                    'titleShow' : false,
                    'autoDimensions' : false,
                    'width' : 600,
                    'height' : 180
            });
            $("a.current").fancybox({
                    'hideOnContentClick' : false,
                    'titleShow' : false,
                        'titlePosition' : 'inside',
                    'autoDimensions' : true,
                    'width' : 300
            });
            $('#overviewTabs a:first').tab('show');
          });
        </r:script>
    </head>
    <body>
      <div id="content">
        <div id="header" class="collectory">
          <cl:pageOptionsPopup instance="${instance}"/>
          <cl:h1 value="${instance.name}" />
          <div class="row">
            <div class="col-md-8">
              <g:set var="inst" value="${instance.getInstitution()}"/>
              <g:if test="${inst}">
                <p>Institution <g:link action="show" id="${inst.uid}"> : ${inst.name}</g:link></p>
              </g:if>
              <span style="">
              <cl:valueOrOtherwise value="${instance.acronym}"><p><g:message code="public.show.header.acronym" /> : ${fieldValue(bean: instance, field: "acronym")}</p></cl:valueOrOtherwise>
              %{--<cl:valueOrOtherwise value="${instance.guid}"><p><g:message code="public.show.header.guid" /> : ${fieldValue(bean: instance, field: "guid")}</p></cl:valueOrOtherwise>--}%
                  %{-- <span class="lsid"><a href="#lsidText" id="lsid" class="local" title="Life Science Identifier (pop-up)"><g:message code="public.lsid" /></a></span> --}%
              </span>
            </div>
            <div class="col-md-4">
              <!-- institution logo -->
              <g:if test="${inst?.logoRef?.file}">
                <g:link action="showInstitution" id="${inst.id}">
                  <img class="institutionImage" src='${resource(absolute:"true", dir:"data/institution/",file:fieldValue(bean: inst, field: 'logoRef.file'))}' />
                </g:link>
              </g:if>
            </div>
          </div>
        </div><!--close header-->




        <div class="tabbable">
            <ul class="nav nav-tabs" id="overviewTabs">
                <li><a id="tab1" href="#overviewTab" data-toggle="tab"><g:message code="public.show.overviewtabs.overview" /></a></li>
                <li><a id="tab2" href="#recordsTab" data-toggle="tab"><g:message code="public.show.overviewtabs.records" /></a></li>
                %{--<li id="imagesTabEl" style="display:none;"><a id="tab3" href="#imagesTab" data-toggle="tab"><g:message code="public.show.overviewtabs.images" /></a></li>--}%
            </ul>
        </div>

        <div class="tab-content">
            <div id="overviewTab" class="tab-pane active row">
               <div id="overview-content" class="col-md-8">
                  <h2 class="admin-h2"><g:message code="public.des" /></h2>
                  <cl:formattedText body="${instance.pubDescription}"/>
                  <cl:formattedText>${fieldValue(bean: instance, field: "techDescription")}</cl:formattedText>
                  <g:if test="${instance.startDate || instance.endDate}">
                      <p><cl:temporalSpanText start='${fieldValue(bean: instance, field: "startDate")}' end='${fieldValue(bean: instance, field: "endDate")}'/></p>
                  </g:if>

                  <h2 class="admin-h2" ><g:message code="public.show.oc.label02" /></h2>
                  <g:if test="${fieldValue(bean: instance, field: 'focus')}">
                    <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>
                  </g:if>
                  <g:if test="${fieldValue(bean: instance, field: 'kingdomCoverage')}">
                    <p><g:message code="public.show.oc.des01" />: <cl:concatenateStrings values='${fieldValue(bean: instance, field: "kingdomCoverage")}'/>.</p>
                  </g:if>
                  <g:if test="${fieldValue(bean: instance, field: 'scientificNames')}">
                    <p><cl:collectionName name="${instance.name}" prefix="The "/> <g:message code="public.show.oc.des02" />:<br/>
                    <cl:JSONListAsStrings json='${instance.scientificNames}'/>.</p>
                  </g:if>

                  <g:if test="${instance?.geographicDescription || instance.states}">
                    <h2 class="admin-h2"><g:message code="public.show.oc.label03" /></h2>
                    <g:if test="${fieldValue(bean: instance, field: 'geographicDescription')}">
                      <p>${fieldValue(bean: instance, field: "geographicDescription")}</p>
                    </g:if>
                    <g:if test="${fieldValue(bean: instance, field: 'states')}">
                      <p><cl:stateCoverage states='${fieldValue(bean: instance, field: "states")}'/></p>
                    </g:if>
                    <g:if test="${instance.westCoordinate != -1}">
                      <p><g:message code="public.show.oc.des03" />: <cl:showDecimal value='${instance.westCoordinate}' degree='true'/></p>
                    </g:if>
                    <g:if test="${instance.eastCoordinate != -1}">
                      <p><g:message code="public.show.oc.des04" />: <cl:showDecimal value='${instance.eastCoordinate}' degree='true'/></p>
                    </g:if>
                    <g:if test="${instance.northCoordinate != -1}">
                      <p><g:message code="public.show.oc.des05" />: <cl:showDecimal value='${instance.northCoordinate}' degree='true'/></p>
                    </g:if>
                    <g:if test="${instance.southCoordinate != -1}">
                      <p><g:message code="public.show.oc.des06" />: <cl:showDecimal value='${instance.southCoordinate}' degree='true'/></p>
                    </g:if>
                  </g:if>

                  <g:set var="nouns" value="${cl.nounForTypes(types:instance.listCollectionTypes())}"/>
                  <h2 class="admin-h2"><g:message code="public.show.oc.label04" /> <cl:nounForTypes types="${instance.listCollectionTypes()}"/> <g:message code="public.show.oc.label05" /></h2>
                  <g:if test="${fieldValue(bean: instance, field: 'numRecords') != '-1'}">
                    <p><g:message code="public.show.oc.des07" /> ${nouns} dans <cl:collectionName prefix="la " name="${instance.name}"/><g:message code="public.show.oc.des08" /> ${fieldValue(bean: instance, field: "numRecords")}.</p>
                  </g:if>
                  <g:if test="${fieldValue(bean: instance, field: 'numRecordsDigitised') != '-1'}">
                    <p><g:message code="public.show.oc.des09" /> ${fieldValue(bean: instance, field: "numRecordsDigitised")} <g:message code="public.show.oc.des10" />.
                    <g:message code="public.show.oc.des11" /> <cl:percentIfKnown dividend='${instance.numRecordsDigitised}' divisor='${instance.numRecords}' /> <g:message code="public.show.oc.des12" />.</p>
                  </g:if>
                  <p><g:message code="public.show.oc.des13" />.</p>

                  <g:if test="${instance.listSubCollections()?.size() > 0}">
                    <h2 class="admin-h2"><g:message code="public.show.oc.label06" /></h2>
                    <p><cl:collectionName prefix="The " name="${instance.name}"/> <g:message code="public.show.oc.des14" />:</p>
                    <cl:subCollectionList list="${instance.subCollections}"/>
                  </g:if>

                  <g:if test="${biocacheRecordsAvailable && !grailsApplication.config.disableLoggerLinks?.asBoolean()}">
                  <div id='usage-stats' style="">
                    <h2 class="admin-h2"><g:message code="public.show.oc.label07" /></h2>
                    <div id='usage'></div>
                  </div>
                  </g:if>

                  <cl:lastUpdated date="${instance.lastUpdated}"/>
               </div>
               <div id="overview-sidebar" class="col-md-4">
                  <g:if test="${fieldValue(bean: instance, field: 'imageRef') && fieldValue(bean: instance, field: 'imageRef.file')}">
                    <div class="section">
                      <img style="max-width:100%;max-height:350px;" alt="${fieldValue(bean: instance, field: "imageRef.file")}"
                              src="${resource(absolute:"true", dir:"data/collection/", file:instance.imageRef.file)}" />
                      <cl:formattedText pClass="caption">${fieldValue(bean: instance, field: "imageRef.caption")}</cl:formattedText>
                      <cl:valueOrOtherwise value="${instance.imageRef?.attribution}"><p class="caption">${fieldValue(bean: instance, field: "imageRef.attribution")}</p></cl:valueOrOtherwise>
                      <cl:valueOrOtherwise value="${instance.imageRef?.copyright}"><p class="caption">${fieldValue(bean: instance, field: "imageRef.copyright")}</p></cl:valueOrOtherwise>
                    </div>
                  </g:if>

                  <div id="dataAccessWrapper" style="display:none;">
                      <g:render template="dataAccess" model="[instance:instance]"/>
                  </div>

                  <div class="section">
                    <h3 class="public-h3"><g:message code="public.location" /></h3>
                    <!-- use parent location if the collection is blank -->
                    <g:set var="address" value="${instance.address}"/>
                    <g:if test="${address == null || address.isEmpty()}">
                      <g:if test="${instance.getInstitution()}">
                        <g:set var="address" value="${instance.getInstitution().address}"/>
                      </g:if>
                    </g:if>

                    <g:if test="${!address?.isEmpty()}">
                      <p>
                        <cl:valueOrOtherwise value="${address?.street}">${address?.street}<br/></cl:valueOrOtherwise>
                        <cl:valueOrOtherwise value="${address?.city}">${address?.city}<br/></cl:valueOrOtherwise>
                        <cl:valueOrOtherwise value="${address?.state}">${address?.state}</cl:valueOrOtherwise>
                        <cl:valueOrOtherwise value="${address?.postcode}">${address?.postcode}<br/></cl:valueOrOtherwise>
                        <cl:valueOrOtherwise value="${address?.country}">${address?.country}<br/></cl:valueOrOtherwise>
                      </p>
                    </g:if>

                    <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
                    <cl:ifNotBlank value='${fieldValue(bean: instance, field: "phone")}'/>
                  </div>

                  <!-- contacts -->
                  <g:render template="contacts" bean="${instance.getPublicContactsPrimaryFirst()}"/>

                  <!-- web site -->
                  <g:if test="${instance.websiteUrl || instance.institution?.websiteUrl}">
                    <div class="section">
                      <h3 class="public-h3"><g:message code="public.website" /></h3>
                      <g:if test="${instance.websiteUrl}">
                        <div class="webSite">
                          <a class='external' rel='nofollow' target="_blank" href="${instance.websiteUrl}"><g:message code="public.show.osb.link01" /></a>
                        </div>
                      </g:if>
                      <g:if test="${instance.institution?.websiteUrl}">
                        <div class="webSite">
                          <a class='external' rel='nofollow' target="_blank" href="${instance.institution?.websiteUrl}">
                            <g:message code="public.show.osb.link02" /> <cl:institutionType inst="${instance.institution}"/><g:message code="public.show.osb.link03" /></a>
                        </div>
                      </g:if>
                    </div>
                  </g:if>

                  <!-- network membership -->
                  <g:if test="${instance.networkMembership}">
                    <div class="section">
                      <h3 class="public-h3"><g:message code="public.network.membership.label" /></h3>
                      <g:if test="${instance.isMemberOf('CHAEC')}">
                        <p><g:message code="public.network.membership.des01" /></p>
                        <img src="${resource(absolute:"true", dir:"data/network/",file:"chaec-logo.png")}"/>
                      </g:if>
                      <g:if test="${instance.isMemberOf('CHAH')}">
                        <p><g:message code="public.network.membership.des02" /></p>
                        <a target="_blank" href="http://www.chah.gov.au"><img src="${resource(absolute:"true", dir:"data/network/",file:"CHAH_logo_col_70px_white.gif")}"/></a>
                      </g:if>
                      <g:if test="${instance.isMemberOf('CHAFC')}">
                        <p><g:message code="public.network.membership.des03" /></p>
                        <img src="${resource(absolute:"true", dir:"data/network/",file:"chafc.png")}"/>
                      </g:if>
                      <g:if test="${instance.isMemberOf('CHACM')}">
                        <p><g:message code="public.network.membership.des04" /></p>
                        <img src="${resource(absolute:"true", dir:"data/network/",file:"chacm.png")}"/>
                      </g:if>
                    </div>
                  </g:if>

                  <!-- attribution -->
                  <g:set var='attribs' value='${instance.getAttributionList()}'/>
                  <g:if test="${attribs.size() > 0}">
                    <div class="section" id="infoSourceList">
                      <h3 class="public-h3"><g:message code="public.show.osb.label04" /></h3>
                      <ul class="list-group">
                        <g:each var="a" in="${attribs}">
                          <g:if test="${a.url}">
                            <li class="list-group-item list-contrib"><cl:wrappedLink href="${a.url}">${a.name}</cl:wrappedLink></li>
                          </g:if>
                          <g:else>
                            <li class="list-group-item list-contrib">${a.name}</li>
                          </g:else>
                        </g:each>
                      </ul>
                    </div>
                  </g:if>
               </div>
            </div>
            <div id="recordsTab" class="tab-pane">
              <h2 class="admin-h2"><g:message code="public.show.rt.title" /></h2>
              <div class="row">
                  <div class="col-md-8">
                    <g:if test="${instance.numRecords != -1}">
                      <p><cl:collectionName prefix="La " name="${instance.name}"/> has an estimated ${fieldValue(bean: instance, field: "numRecords")} ${nouns}.
                        <g:if test="${instance.numRecordsDigitised != -1}">
                          <br/><g:message code="public.show.rt.des01" /> <cl:percentIfKnown dividend='${instance.numRecordsDigitised}' divisor='${instance.numRecords}'/> <g:message code="public.show.rt.des02" /> (${fieldValue(bean: instance, field: "numRecordsDigitised")} <g:message code="public.show.rt.des03" />).
                        </g:if>
                      </p>
                    </g:if>
                    <g:if test="${biocacheRecordsAvailable}">
                      <p><span id="numBiocacheRecords"><g:message code="public.show.rt.des04" /></span> <g:message code="public.show.rt.des05" />.</p>
                      <cl:warnIfInexactMapping collection="${instance}"/>
                      <cl:recordsLink entity="${instance}">
                      <g:message code="public.show.rt.des06" /> <cl:collectionName name="${instance.name}"/></cl:recordsLink>
                    </g:if>
                    <g:else>
                      <p><g:message code="public.show.rt.des07" />.</p>
                    </g:else>
                    <g:if test="${biocacheRecordsAvailable}">
                        <div style="clear:both;"></div>
                          <g:if test="${!grailsApplication.config.disableOverviewMap?.asBoolean()}">
                              <div id="collectionRecordsMapContainer">
                                  <h3><g:message code="public.show.crmc.title" /> ${grailsApplication.config.disableOverviewMap?.asBoolean()}</h3>
                                  <cl:recordsMapDirect uid="${instance.uid}"/>
                              </div>
                          </g:if>
                          <div id="charts"></div>
                          <div id="iehack"></div>
                    </g:if>
                  </div>
                  <div class="col-md-4">
                    <div id="progress" class="well">
                        <div class="progress">
                          <div id="progressBar" class="progress-bar progress-bar-success" style="width: 0%;"><span></span></div>
                        </div>
                        <p class="caption"><span id="speedoCaption"><g:message code="public.show.speedocaption" />.</span></p>
                    </div>
                  </div>
              </div>
            </div>
            %{-- <div id="imagesTab" class="tab-pane">
               <style type="text/css">
                   #imagesList { margin:0; }
                   #imagesList .imgCon { display: inline-block;
                    margin-right: 8px;
                    text-align: center;
                    line-height: 1.3em;
                    background-color: #DDD;
                    color: #DDD;
                    padding: 5px;
                    margin-bottom: 8px;
                   }
                   #imagesList .imgCon img { max-height:150px; }
               </style>
               <h2 class="admin-h2"><g:message code="public.show.it.title"/></h2>
               <div id="imagesSpiel"></div>
               <div id="imagesList"></div>
            </div> --}%
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
          instanceUid: "${instance.uid}",
          /* the list of charts to be drawn (these are specified in the one call because a single request can get the data for all of them) */
          charts: ['country','state','species_group','assertions','type_status',
              'biogeographic_region','data_resource_uid','state_conservation','occurrence_year']
          /* override default options for individual charts */
      }
      var taxonomyChartOptions = {
          /* base url of the collectory */
          collectionsUrl: "${grailsApplication.config.grails.serverURL}",
          /* base url of the biocache */
          biocacheServicesUrl: biocacheServicesUrl,
          /* base url of the biocache webapp*/
          biocacheWebappUrl: biocacheWebappUrl,
          /* support drill down into chart - default is true */
          drillDown: true,
          /* a uid or list of uids to chart - either this or query must be present */
          instanceUid: "${instance.uid}",
          /* threshold value to use for automagic rank selection - defaults to 55 */
          threshold: 55,
          rank: "${instance.startingRankHint()}"
      }
/************************************************************\
*
\************************************************************/
var queryString = '';
var decadeUrl = '';
var initial = -120;
var imageWidth = 240;
var eachPercent = (imageWidth/2)/100;

$('img#mapLegend').each(function(i, n) {
  // if legend doesn't load, then it must be a point map
  $(this).error(function() {
    $(this).attr('src',"${resource(dir:'images/map',file:'single-occurrences.png')}");
  });
  // IE hack as IE doesn't trigger the error handler
  /*if ($.browser.msie && !n.complete) {
    $(this).attr('src',"${resource(dir:'images/map',file:'single-occurrences.png')}");
  }*/
});
/************************************************************\
* initiate ajax calls
\************************************************************/
function onLoadCallback() {

  if(loadLoggerStats){
    loadDownloadStats("${grailsApplication.config.loggerURL}", "${instance.uid}","${instance.name}", "1002");
  }

  // records
  $.ajax({
    url: urlConcat(biocacheServicesUrl, "/occurrences/search.json?pageSize=0&q=") + buildQueryString("${instance.uid}"),
    dataType: 'jsonp',
    timeout: 20000,
    complete: function(jqXHR, textStatus) {
        if (textStatus == 'timeout') {
            noBiocacheData();
            alert('Sorry - the request was taking too long so it has been cancelled.');
        }
        if (textStatus == 'error') {
            noBiocacheData();
            alert('Sorry - the records breakdowns are not available due to an error.');
        }
    },
    success: function(data) {
        // check for errors
        if (data.length == 0 || data.totalRecords === undefined || data.totalRecords == 0) {
            noBiocacheData();
        } else {
            setPercentAgeNumbers(data.totalRecords, ${instance.numRecords});
            // draw the charts
            drawFacetCharts(data, facetChartOptions);
            if(data.totalRecords > 0){
                $('#dataAccessWrapper').css({display:'block'});
                $('#totalRecordCountLink').html(data.totalRecords.toLocaleString() + ' enregistrements');
            }
        }
    }
  });

  // images
  var wsBase = "/occurrences/search.json";
  var uiBase = "/occurrences/search";
  var imagesQueryUrl = "?facets=type_status&fq=multimedia%3AImage&pageSize=100&q=" + buildQueryString("${instance.uid}");
  $.ajax({
    url: urlConcat(biocacheServicesUrl, wsBase + imagesQueryUrl),
    dataType: 'jsonp',
    timeout: 20000,
    complete: function(jqXHR, textStatus) {
        if (textStatus == 'timeout') {
            noBiocacheData();
        }
        if (textStatus == 'error') {
            noBiocacheData();
        }
    },
    success: function(data) {
        // check for errors
        if (data.length == 0 || data.totalRecords == undefined || data.totalRecords == 0) {
            //noBiocacheData();
        } else {
            if(data.totalRecords > 0){
                $('#imagesTabEl').css({display:'block'});
                var description = ""
                if(data.facetResults.length>0 && data.facetResults[0].fieldResult !== undefined){
                    description = "Of these images there: ";
                    $.each(data.facetResults[0].fieldResult, function(idx, facet){
                        if(idx>0){
                            description += ', '
                        }
                        var queryUrl = biocacheWebappUrl + uiBase + imagesQueryUrl + '&fq=' + data.facetResults[0].fieldName + ':' + facet.label;
                        description += '<a href="' + queryUrl + '">' + (facet.count + ' ' + facet.label) + '</a>';
                    })
                }
                $('#imagesSpiel').html('<p><a href="'+biocacheWebappUrl + uiBase + imagesQueryUrl +'">' + data.totalRecords + ' images</a> have been made available from the ${instance.name}. <br/> ' + description + '</p>');
                $.each(data.occurrences, function(idx, item){
                    var imageText = item.scientificName;
                    if(item.typeStatus !== undefined){
                       imageText = item.typeStatus + " - " + imageText;
                    }
                    $('#imagesList').append('<div class="imgCon"><a href="'+biocacheWebappUrl + '/occurrences/' + item.uuid + '"><img src="' + item.smallImageUrl+'"/><br/>'+ imageText + '</a></div>');
                })
            }
        }
    }
  });

  // taxon chart
  loadTaxonomyChart(taxonomyChartOptions);
}
/************************************************************\
* Handle biocache records response
\************************************************************/
function biocacheRecordsHandler(response) {
  if (response.error == undefined) {
    setNumbers(response.totalRecords, ${instance.numRecords});
    if (response.totalRecords < 1) {
      noBiocacheData();
    }
    drawDecadeChart(response.decades, "${instance.uid}", {
      width: 100,
      chartArea:  {left: 50, width:"88%", height: "75%"}
    });
  } else {
    noBiocacheData();
  }
}
/************************************************************\
* Set biocache record numbers to none and hide link and chart
\************************************************************/
function noBiocacheData() {
  setNumbers(0);
  $('a.recordsLink').css('visibility','hidden');
  $('div#decadeChart').css("display","none");
}
/************************************************************\
* Set total and percent biocache record numbers
\************************************************************/
function setPercentAgeNumbers(totalBiocacheRecords, totalRecords) {
  var recordsClause = "";
  switch (totalBiocacheRecords) {
    case 0: recordsClause = "No records"; break;
    case 1: recordsClause = "1 record"; break;
    default: recordsClause = addCommas(totalBiocacheRecords) + " enregistrements";
  }
  $('#numBiocacheRecords').html(recordsClause);

  if (totalRecords > 0) {

    var percent = totalBiocacheRecords/totalRecords * 100;
    if (percent > 100 && ${instance.isInexactlyMapped()}) {
      // don't show greater than 100 if the mapping is not exact as the estimated num records may be correct
      percent = 100;
    }
    setProgress(percent);
  } else {
    // to update the speedo caption
    setProgress(0);
  }
}
/************************************************************\
* Add commas to number display
\************************************************************/
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
/************************************************************\
* DEPRECATED
\************************************************************/
function decadeBreakdownRequestHandler(response) {
  var data = new google.visualization.DataTable(response);
  if (data.getNumberOfRows() > 0) {
    draw(data);
  }
}

/************************************************************\
* Draw % digitised bar (progress bar)
\************************************************************/
function setProgress(percentage){
  var captionText = "";
  if (${instance.numRecords < 1}) {
    captionText = "Il n'y a pas d'estimation du nombre total de ${nouns} dans cette collection";
  } else if (percentage == 0) {
    captionText = "Aucun enregistrement sont accessibles via l'Altas.";
  } else {
    var displayPercent = percentage.toFixed(1);
    if (percentage < 0.1) {displayPercent = percentage.toFixed(2)}
    if (percentage > 20) {displayPercent = percentage.toFixed(0)}
    if (percentage > 100) {displayPercent = "over 100"}
    captionText = "Approximativement, " + displayPercent + "%  des enregistrements de ${nouns} de cette collection sont accessibles sur l'atlas.";
  }
  $('#speedoCaption').html(captionText);
  if (percentage > 100) {
    $('#progressBar').removeClass('percentImage1');
    $('#progressBar').addClass('percentImage4');
    percentage = 101;
  }
  //var newProgress = eval(initial)+eval(percentageWidth)+'px';
  $('#progressBar').css('width', percentage +'%');
}
/************************************************************\
* Load charts
\************************************************************/

    // define biocache server
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