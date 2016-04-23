<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
    <title><g:message code="public.datasets.title" /> | ${grailsApplication.config.projectName} </title>
    <r:require modules="datasets, jquery_json, bbq, rotate, jquery_tools"/>
    <r:script type="text/javascript">
      var altMap = true;
      $(document).ready(function() {
        $('#nav-tabs > ul').tabs();
        loadResources("${grailsApplication.config.biocacheUiURL}");
        //loadResources("${grailsApplication.config.grails.serverURL}","${grailsApplication.config.biocacheUiURL}");
        $('select#per-page').change(onPageSizeChange);
        $('select#sort').change(onSortChange);
        $('select#dir').change(onDirChange);
      });
    </r:script>
  </head>

  <body id="page-datasets" class="nav-datasets">
    <div id="content">
        <div id="header">
        <div class="full-width">
          <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
          </g:if>
          <div>
            <h2 id="metadata-header"><g:message code="public.datasets.header.title" /></h2>
            <p><g:message code="public.datasets.header.message01" /> ${grailsApplication.config.projectName}, <g:message code="public.datasets.header.message02" />.</p>
            <p><g:message code="public.datasets.header.message03" /> <img style="vertical-align:middle;" src="${resource(dir:'/images/skin',file:'ExpandArrow.png')}"/><g:message code="public.datasets.header.message04" />.</p>
          </div><!--close hrgroup-->
        </div><!--close section-->
      </div><!--close header-->

      <noscript>
          <div class="noscriptmsg">
            <g:message code="public.datasets.noscript.message01" />.
          </div>
      </noscript>

      <div class="collectory-content">
          <div id="sidebarBoxXXX" class="col-md-3 facets dataset-search">
            <div id="facetWell" class="sidebar-header">
              <h3><g:message code="public.datasets.sidebar.header" /></h3>
            </div>
            <hr />
            <div id="currentFilterHolder">
            </div>

            <div id="dsFacets">
            </div>
          </div>

          %{--<div id="sidebarBoxXXX" class="col-md-3 facets well well-small">--}%
              %{--<div class="sidebar-header">--}%
                  %{--<h3><g:message code="public.datasets.sidebar.header" /></h3>--}%
              %{--</div>--}%

              %{--<div id="currentFilterHolder">--}%
              %{--</div>--}%

              %{--<div id="dsFacets">--}%
              %{--</div>--}%
          %{--</div>--}%

          <div id="data-set-list" class="col-md-9">
            <div class="dataset-search">
                <div class="row">
                           <div class="form-inline">
                              <div class="controls">
                                  <div class="input-group">
                                      <input type="text" class="form-control" name="dr-search" id="dr-search"/>
                                      <span class="input-group-btn">
                                          <a href="javascript:void(0);"  id="dr-search-link" class="btn btn-default search-occurrence"><g:message code="public.datasets.drsearch.search" /></a>
                                      </span>
                                  </div>
                                  <a href="javascript:void(0);" id="reset">
                                  <a href="javascript:reset()" title="Remove all filters and sorting options" class="btn btn-default advanced-search-occurrence"><g:message code="public.datasets.drsearch.resetlist" /></a></a>
                                  <a href="#" id="downloadLink" class="btn btn-default advanced-search-occurrence" title="Download metadata for datasets as a CSV file">
                                     <i class="glyphicon glyphicon-download-alt"></i>
                                    <g:message code="public.datasets.downloadlink.label" /></a>
                              </div>
                          </div>
                      
                </div>
                <hr/>
                <div id="searchControls">
                  <div id="sortWidgets" class="row">
                      <div class="col-md-4">
                          <label for="per-page"><g:message code="public.datasets.sortwidgets.rpp" /></label>
                          <g:select id="per-page" name="per-page" from="${[10,20,50,100,500]}" value="${pageSize ?: 20}"/>
                      </div>
                      <div class="col-md-4">
                          <label for="sort"><g:message code="public.datasets.sortwidgets.sb" /></label>
                          <g:select id="sort" name="sort" from="${['nom','type','licence']}"/>
                      </div>
                      <div class="col-md-4">
                          <label for="dir"><g:message code="public.datasets.sortwidgets.so" /></label>
                          <g:select id="dir" name="dir" from="${['ascendant','descendant']}"/>
                      </div>
                  </div>
                </div><!--drop downs-->
            </div>
            <div class="resultsReturnedDataset">
                <span id="resultsReturned"><g:message code="public.datasets.resultsreturned.message02" />.</span>
            </div>


          <div id="results">
              <div id="loading"><g:message code="public.datasets.loading" /> ..</div>
            </div>

            <div id="searchNavBar" class="clearfix">
              <div id="navLinks" class="button-ext">
              </div>
            </div>
          </div>

    </div><!-- close collectory-content-->

    </div><!--close content-->

  </body>
</html>