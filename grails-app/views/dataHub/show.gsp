<%@ page import="au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataHub" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'datahub.label.lower', default: 'centres de données')}" />
        <g:set var="entityNameSing" value="${message(code: 'datahub.label.lower.sing', default: 'centre de donnée')}" />
        <g:set var="entityNameLower" value="${cl.controller(type: instance.ENTITY_TYPE)}"/>
        <title><g:message code="default.show.label" args="[entityNameSing]" /> <g:message code="default.list.label.end" /></title>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=false"></script>
    </head>
    <body onload="initializeLocationMap('${instance.canBeMapped()}',${instance.latitude},${instance.longitude});">
      <div class="container-fluid">
         <h1 id="metadata-header"><g:message code="datahub.label.lower.sing" /> : ${fieldValue(bean: instance, field: "name")}<cl:valueOrOtherwise value="${instance.acronym}"> (${fieldValue(bean: instance, field: "acronym")})</cl:valueOrOtherwise></h1>
      <div class="col-md-3 col-lg-3">
          <div class="region-menu-gauche">
            <ul class="menu nav">
              <li><g:link controller="manage" action="index"><g:message code="default.home.label"/></g:link></li>
              <li><g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li> 
              %{-- <li><g:link action="myList"><g:message code="default.myList.label" args="[entityName]"/></g:link></li> --}%
              <li><g:link action="create"><g:message code="default.new.masculin.label" args="[entityNameSing]"/></g:link> </li> 
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
                <p><span class="category"><g:message code="collection.show.span.uid" /> :</span> ${fieldValue(bean: instance, field: "uid")}</p>

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

                <div><g:link class="edit-btn btn btn-sm" action='edit' params="[page:'/shared/base']" id="${instance.id}">${message(code: 'default.button.edit.label', default: 'Edit')}</g:link></div>
              </div>

              <!-- description -->
              <div class="show-section well">
                <h2 class="admin-h2"><g:message code="collection.show.title.description" /></h2>

                <!-- Pub Desc -->
                <div class="source">Public description :</div><div style="clear:both;"></div>
                <cl:formattedText body="${instance.pubDescription}"/>

                <!-- Tech Desc -->
                <div class="source">Technical description :</div><div style="clear:both;"></div>
                <cl:formattedText body="${instance.techDescription}"/>

                <!-- Contribution -->
                <div class="source">Contribution :</div><div style="clear:both;"></div>
                <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>

                <div><g:link class="edit-btn btn btn-sm" action='edit' params="[page:'description']" id="${instance.id}">${message(code: 'default.button.edit.label', default: 'Edit')}</g:link></div>
              </div>

              <!-- members -->
              <div class="show-section well">
                <h2 class="admin-h2"><g:message code="datahub.show.title02" /></h2>
                <g:if test="${instance.listMemberInstitutions()}">
                    <h3><g:message code="dataHub.memberInstitutions.label" /></h3>
                    <ul class='simple'>
                    <g:each in="${instance.listMemberInstitutions()}" var="i">
                        <li><g:link controller="institution" action="show" id="${i.uid}">${i.name}</g:link></li>
                    </g:each>
                    </ul>
                </g:if>
                <g:if test="${instance.listMemberCollections()}">
                    <h3><g:message code="dataHub.memberCollections.label" /></h3>
                    <ul class='simple'>
                    <g:each in="${instance.listMemberCollections()}" var="i">
                        <li><g:link controller="collection" action="show" id="${i.uid}">${i.name}</g:link></li>
                    </g:each>
                    </ul>
                </g:if>
                <g:if test="${instance.listMemberDataResources()}">
                    <h3><g:message code="datahub.show.tile.resources" /></h3>
                    <ul class='simple'>
                    <g:each in="${instance.listMemberDataResources()}" var="i">
                        <li><g:link controller="dataResource" action="show" id="${i.uid}">${i.name}</g:link></li>
                    </g:each>
                    </ul>
                </g:if>

                <div><g:link class="edit-btn btn btn-sm" action='edit' params="[page:'members']" id="${instance.id}">${message(code: 'default.button.edit.label', default: 'Edit')}</g:link></div>
            </div>

              <!-- images -->
              <g:render template="/shared/images" model="[target: 'logoRef', image: instance.logoRef, title:'Logo', instance: instance]"/>
              <g:render template="/shared/images" model="[target: 'imageRef', image: instance.imageRef, title:'Representative image', instance: instance]"/>

              <!-- location -->
              <g:render template="/shared/location" model="[instance: instance]"/>

              <!-- Contacts -->
              <g:render template="/shared/contacts" model="[contacts: contacts, instance: instance]"/>

              <!-- Attributions -->
              <g:render template="/shared/attributions" model="[instance: instance]"/>

              <!-- change history -->
              <g:render template="/shared/changes" model="[changes: changes, instance: instance]"/>

        </div>
      </div>
    </body>
</html>
