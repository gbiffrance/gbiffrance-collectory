<%@ page import="au.org.ala.collectory.ProviderGroup" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
  <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
  <g:set var="entityNameLower" value="${command.ENTITY_TYPE.toLowerCase()}"/>
  <title><g:message code="collection.base.label" default="Edit ${entityNameLower} metadata" /> <g:message code="default.list.label.end" /></title>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=false"></script>
</head>
<body onload="load();">
  <style>
    #mapCanvas {
      width: 350px;
      height: 350px;
      float: right;
    }

    #long-lat{
      margin-left: 0;
    }
  </style>
  <h1 id="metadata-header"><g:message code="shared.location.main.title01" /> <em> ${fieldValue(bean: command, field: "name")} </em></h1>
  <div class="body">
    <g:if test="${message}">
      <div class="message">${message}</div>
    </g:if>
    <g:hasErrors bean="${command}">
      <div class="errors">
        <g:renderErrors bean="${command}" as="list"/>
      </div>
    </g:hasErrors>
    <g:form method="post" enctype="multipart/form-data" action="editCollection">
      <g:hiddenField name="id" value="${command?.id}"/>
      <g:hiddenField name="version" value="${command.version}"/>
      <div class="dialog">
        <div class="col-md-3">
          <input type="submit" name="_action_updateLocation" value="${message(code:"shared.location.button.update")}" class="save-btn btn btn-sm">
          <input type="submit" name="_action_cancel" value="${message(code:"shared.location.button.cancel")}" class="cancel-btn btn btn-sm">
        </div>
        <div class="col-md-9">
          <!-- state -->
          <div class="col-md-12 edit-contact-form" id="first-field">
            <div class="col-md-3">
              <label for="state"><g:message code="providerGroup.state.label" default="State"/>
                <br/><span class=hint>(où la ${entityNameLower} est physiquement située)</span>
              </label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'state', 'errors')}">
              <g:select id="state" name="state" from="${ProviderGroup.statesList}" value="${command?.state}" valueMessagePrefix="providerGroup.state" noSelection="['': '']" class="form-control"/>
              <cl:helpText code="${entityNameLower}.state"/>
              <cl:helpTD/>
            </div>
          </div>

          <!-- email -->
          <div class="col-md-12 edit-contact-form">
              <div class="col-md-3">
                <label for="email"><g:message code="providerGroup.email.label" default="Email"/></label>
              </div>
              <div class="col-md-9 value ${hasErrors(bean: command, field: 'email', 'errors')}">
                <g:textField name="email" maxLength="256" value="${command?.email}" class="form-control"/>
                <cl:helpText code="collection.email"/>
                <cl:helpTD/>
              </div>
          </div>

          <!-- phone -->
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="phone"><g:message code="providerGroup.phone.label" default="Phone"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'phone', 'errors')}">
              <g:textField name="phone" maxlength="45" value="${command?.phone}" class="form-control"/>
              <cl:helpText code="collection.phone"/>
              <cl:helpTD/>
            </div>      
          </div>

          <!-- address -->
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.street"><g:message code="providerGroup.address.street.label" default="Street"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.street', 'errors')}">
              <g:textField id="street" name="address.street" maxlength="128" value="${command?.address?.street}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.city"><g:message code="providerGroup.address.city.label" default="City"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.city', 'errors')}">
              <g:textField id="city" name="address.city" maxlength="128" value="${command?.address?.city}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.state"><g:message code="providerGroup.address.state.label" default="State or territory" class="form-control"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.state', 'errors')}">
              <g:textField id="state" name="address.state" maxlength="128" value="${command?.address?.state}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.postcode"><g:message code="providerGroup.address.postcode.label" default="Postcode"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.street', 'errors')}">
              <g:textField name="address.postcode" maxlength="128" value="${command?.address?.postcode}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.country"><g:message code="providerGroup.address.country.label" default="Country"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.country', 'errors')}">
              <g:textField id="country" name="address.country" maxlength="128" value="${command?.address?.country}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 edit-contact-form">
            <div class="col-md-3">
              <label for="address.postBox"><g:message code="providerGroup.address.postBox.label" default="Postal address"/></label>
            </div>
            <div class="col-md-9 value ${hasErrors(bean: command, field: 'address.postBox', 'errors')}">
              <g:textField name="address.postBox" maxlength="128" value="${command?.address?.postBox}" class="form-control"/>
            </div>
          </div>

        <!-- latitude -->
        <div class="col-md-12 edit-contact-form">
          <div class="row" id="long-lat">
            <div class="col-md-6">
              <label for="latitude">
                <g:message code="providerGroup.latitude.label" default="Latitude"/><span class=hint> (degré décimal)</span>
              </label>
              <div class="value ${hasErrors(bean: command, field: 'latitude', 'errors')}">
                <g:textField id="latitude" name="latitude" value="${cl.numberIfKnown(number:command.latitude)}" class="form-control"/>
                <cl:helpText code="collection.latitude"/>
                <cl:helpTD/>
              </div>
              <label for="longitude">
                <g:message code="providerGroup.longitude.label" default="Longitude"/><span class=hint> (degré décimal)</span>
              </label>
              <div class="value ${hasErrors(bean: command, field: 'longitude', 'errors')}">
                <g:textField id="longitude" name="longitude" value="${cl.numberIfKnown(number:command.longitude)}" class="form-control"/>
                <cl:helpText code="collection.longitude"/>
                <cl:helpTD/>
              </div>
              <input type="button" class="edit-btn btn" onclick="return codeAddress();" value="Lookup"/> <g:message code="shared.location.lookup" />. <br /> <g:message code="shared.location.main.des01" /> ${entityNameLower}.<g:message code="shared.location.main.des02" />.
              <g:if test="${command.ENTITY_TYPE == 'Collection'}">
                <g:if test="${(command.latitude == -1 || command.longitude == -1) && command.inheritedLatLng()}">
                  <input type="button" class="classicButton" onclick="return useInherited();" value="Use inherited"/> <g:message code="shared.location.button.useinherited" />.<div style="width:100%;"></div>
                </g:if>
              </g:if>
            </div>
            <div class="col-md-6" id="mapCanvas">
          </div>
        </div> 
      </div>
    </div>    
  </g:form>
</div>

<script type="text/javascript">
  function codeAddress() {
    var address = document.getElementById('street').value + "," + document.getElementById('city').value + "," + document.getElementById('state').value + "," + document.getElementById('country').value
    var geocoder = new google.maps.Geocoder();
    if (geocoder) {
      geocoder.geocode({ 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var lat = results[0].geometry.location.lat();
          var lng = results[0].geometry.location.lng();
          $('input#latitude').val(lat);
          $('input#longitude').val(lng);
          map.setCenter(results[0].geometry.location);
          marker.setPosition(results[0].geometry.location);
          return true;
        } else {
          return false;
        }
      });
    }
  }

</script>

<g:if test="${command.ENTITY_TYPE == 'Collection'}">
  <g:if test="${(command.latitude == -1 || command.longitude == -1) && command.inheritedLatLng()}">
    <script type="text/javascript">
      function useInherited() {
        var latLng = new google.maps.LatLng(${command.inheritedLatLng()?.lat}, ${command.inheritedLatLng()?.lng})
        $('input#latitude').val(latLng.lat());
        $('input#longitude').val(latLng.lng());
        map.setCenter(latLng);
        marker.setPosition(latLng);
      }
    </script>
  </g:if>
</g:if>

<script type="text/javascript">
var map;
var marker;

function load() {
    initialize();
}

function updateMarkerPosition(latLng) {
  $('input#latitude').val(latLng.lat());
  $('input#longitude').val(latLng.lng());
}

function initialize() {
  var lat = ${command.latitude}
  if (lat == undefined || lat == 0 || lat == -1 ) {lat = -35.294325779329654}
  var lng = ${command.longitude}
  if (lng == undefined || lng == 0 || lng == -1 ) {lng = 149.10602960586547}
  var latLng = new google.maps.LatLng(lat, lng);
  map = new google.maps.Map(document.getElementById('mapCanvas'), {
    zoom: 12,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false
  });
  marker = new google.maps.Marker({
    position: latLng,
    title: 'my collection',
    map: map,
    draggable: true
  });

  // Add dragging event listeners.
  google.maps.event.addListener(marker, 'drag', function() {
    updateMarkerPosition(marker.getPosition());
  });

  google.maps.event.addListener(marker, 'dragend', function() {
    updateMarkerPosition(marker.getPosition());
  });
}

</script>
</body>
</html>
