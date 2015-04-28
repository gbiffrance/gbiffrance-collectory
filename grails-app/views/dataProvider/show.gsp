<%@ page import="au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${instance.ENTITY_TYPE}" />
        <g:set var="entityNameLower" value="${cl.controller(type: instance.ENTITY_TYPE)}"/>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=false"></script>
    </head>
    <body onload="initializeLocationMap('${instance.canBeMapped()}',${instance.latitude},${instance.longitude});">
    <div class="container-fluid">
      <h1 id="metadata-header">
        <g:message code="collection.label" /> : ${fieldValue(bean: instance, field: "name")}
          <cl:valueOrOtherwise value="${instance.acronym}"> (${fieldValue(bean: instance, field: "acronym")})
          </cl:valueOrOtherwise>
      </h1>
      <div class="col-md-3 col-lg-3">
        <div class="region-menu-gauche">
          <ul class="menu nav">
            <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
            <li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li> 
            %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
            <li><g:link action="create"><g:message code="default.new.label" args="[entityName]"/></g:link> </li> 
            <li><g:link controller="public" action="show" id="${instance?.uid}"><g:message code="default.show.public.label" args="[entityName]"/></g:link> </li>  
            <li><cl:jsonSummaryLink uid="${instance.uid}"/></li>
            <li><cl:jsonDataLink uid="${instance.uid}"/></li>
          </ul>
        </div>
        <div class="buttons">
          <g:form class="form-delete">
            <g:hiddenField name="id" value="${instance?.id}"/>
            %{-- <cl:ifGranted role="${ProviderGroup.ROLE_ADMIN}"> --}%
            <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', args: [entityName], default: 'Supprimer la collection')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes vous sur ?')}');"/>
            %{-- </cl:ifGranted> --}%
          </g:form>
        </div>  
      </div>
        <div class="col-md-9">
          <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
          </g:if>  
           <div class="dialog emulate-public">
              <!-- base attributes -->
              <div class="show-section well"> 
                              <!-- GUID    -->
                <p id="first-section"><span class="category"><g:message code="collection.show.span.lsid" /> :</span> <cl:guid target="_blank" guid='${fieldValue(bean: instance, field: "guid")}'/></p>

                <!-- UID    -->
                <p><span class="category"><g:message code="providerGroup.uid.label" /> :</span> ${fieldValue(bean: instance, field: "uid")}</p>

                <!-- Web site -->
                <p><span class="category"><g:message code="collection.show.span.cw" /> :</span> <cl:externalLink href="${fieldValue(bean:instance, field:'websiteUrl')}"/></p>

                <!-- Networks -->
                <g:if test="${instance.networkMembership}">
                  <p><cl:membershipWithGraphics coll="${instance}"/></p>
                </g:if>

                <!-- Notes -->
                <g:if test="${instance.notes}">
                  <p><cl:formattedText>${fieldValue(bean: instance, field: "notes")}</cl:formattedText></p>
                </g:if>

                <!-- last edit -->
                <p><span class="category"><g:message code="datahub.show.lastchange" /> :</span> ${fieldValue(bean: instance, field: "userLastModified")} on ${fieldValue(bean: instance, field: "lastUpdated")}</p>

                <cl:editButton uid="${instance.uid}" page="/shared/base"/>
              </div>  
                            <!-- description -->
              <div class="show-section well">
                <!-- Pub Desc -->
                <h2 class="admin-h2"><g:message code="collection.show.title.description" /></h2>
                <span class="category"><g:message code="collection.show.span04" /></span><br/>
                <cl:formattedText body="${instance.pubDescription?:'Not provided'}"/>

                <!-- Tech Desc -->
                <span class="category"><g:message code="collection.show.span05" /></span><br/>
                <cl:formattedText body="${instance.techDescription?:'Not provided'}"/>

                <!-- Contribution -->
                <span class="category"><g:message code="dataprovider.show.span06" /></span><br/>
                <cl:formattedText body="${instance.focus?:'Not provided'}"/>

                <cl:editButton uid="${instance.uid}" page="description"/>
              </div>  
              <div class="well">
                <!-- Resources -->
                <h2 class="admin-h2">Data resources</h2>
                <ul class='fancy'>
                  <g:each in="${instance.getResources().sort{it.name}}" var="c">
                      <li><g:link controller="dataResource" action="show" id="${c.uid}">${c?.name}</g:link></li>
                  </g:each>
                </ul>
                <p>
                    <g:link controller="dataResource"  class="btn" action="create" params='[dataProviderUid: "${instance.uid}"]'><g:message code="dataprovider.show.link01" /></g:link>
                </p>
              </div> 
              <!-- images -->
              <g:render template="/shared/images" model="[target: 'logoRef', image: instance.logoRef, title:'Logo', instance: instance]"/>
              <g:render template="/shared/images" model="[target: 'imageRef', image: instance.imageRef, title:'Representative image', instance: instance]"/>

              <!-- location -->
              <g:render template="/shared/location" model="[instance: instance]"/>

              <!-- Record consumers -->
              <g:render template="/shared/consumers" model="[instance: instance]"/>

              <!-- Contacts -->
              <g:render template="/shared/contacts" model="[contacts: contacts, instance: instance]"/>

              <!-- Attributions -->
              <g:render template="/shared/attributions" model="[instance: instance]"/>

              <!-- change history -->
              <g:render template="/shared/changes" model="[changes: changes, instance: instance]"/>

            </div>
      </div>
        







              

              
            <div class="buttons">
              <g:form>
                <g:hiddenField name="id" value="${instance?.id}"/>
                %{-- <cl:ifGranted role="${ProviderGroup.ROLE_ADMIN}"> --}%
                  <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                %{-- </cl:ifGranted> --}%
                <span class="button"><cl:viewPublicLink uid="${instance?.uid}"/></span>
                <span class="button"><cl:jsonSummaryLink uid="${instance.uid}"/></span>
                <span class="button"><cl:jsonDataLink uid="${instance.uid}"/></span>
              </g:form>
            </div>
        </div>
    </body>
</html>
