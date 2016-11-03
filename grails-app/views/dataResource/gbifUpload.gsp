<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataProvider" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="${grailsApplication.config.skin.layout}" />

    <title><g:message code="upload.gbif.archive" /></title>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=false"></script>
    <r:require modules="fileupload"/>
</head>
<body>

<h1 id="admin-header"><g:message code="dataresource.gbifupload.title" /></h1>
<div class="col-md-3 col-lg-3">
    <div class="region-menu-gauche">
        <ul class="menu nav">
            <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
            %{--<li><g:link class="list" action="list"><g:message code="reports.li.reports" /></g:link> </li>--}%
            %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
        </ul>
    </div>
</div>
<div class="col-md-9 col-lg-9">
    <div id="BoxY">
        <p>
            <g:message code="dataresource.gbifupload.des01" />
            <a href="http://www.gbif.org/"><g:message code="dataresource.gbifupload.link.gbifportal" /></a>.
            <g:message code="dataresource.gbifupload.des02" />.
        </p>
        <p>
            <b><g:message code="dataresource.gbifupload.des03" /></b>: <g:message code="dataresource.gbifupload.des04" />. <g:message code="dataresource.gbifupload.des05" />.
        </p>
        <p>
            <g:message code="dataresource.gbifupload.info0"/> <strong>http://api.gbif.org/v1/occurrence/download/request/0001008-150512124619364.zip</strong> <g:message code="dataresource.gbifupload.info1"/>
        </p>
    </div>

    <div id="BoxX">
        <div class="input-group">
            <span class="input-group-addon edit-btn" id="basic-addon1"><g:message code="dataresource.gbifupload.label" /></span>
            <input type="text" class="form-control" id="url" name="url" placeholder="" aria-describedby="basic-addon1">
        </div>
        <div>
            <div class="col-md-3"></div>
            <button class="edit-btn btn btn-default" id="downloadArchiveBtn">
                <r:img class="spinner-progress hide" uri="/images/spinner.gif"></r:img>
                <g:message code="dataresource.gbifupload.btn"/>
            </button>
        </div>
        <div id="download-result" class="hide BoxY">
            <g:message code="dataresource.gbifupload.success0"/>:<br/>
            <strong><span id="new-resource-name"></span></strong>.<br/>
            <a href="#" id="new-resource-link" class="btn btn-default access-data"><g:message code="dataresource.gbifupload.success1"/></a>
        </div>
    </div>
</div>


<r:script>

    var dataResourceUrlBase = '${g.createLink([controller:"dataResource",action:"show"])}/';

    function downloadFile(){

        $('#download-result').addClass("hide");
        $('.spinner-progress').removeClass("hide")

        $('#downloadArchiveBtn').prop('disabled', true);
        $.ajax( "downloadGBIFFile?url=" +  $('#url').val() )
        .done(function(data) {
            //alert( "success - " + data.dataResourceUid );
            $('#download-result').removeClass("hide");
            $('#new-resource-name').html(data.dataResourceName );
            $('#new-resource-link').attr('href', dataResourceUrlBase + data.dataResourceUid );
        })
        .fail(function() {
            alert( "error" );
        })
        .always(function() {
            $('.spinner-progress').addClass("hide");
            $('#downloadArchiveBtn').prop('disabled', false);
        });
    }

    $('#downloadArchiveBtn').click(downloadFile);

</r:script>


</body>
</html>