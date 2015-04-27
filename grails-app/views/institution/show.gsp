
<%@ page import="au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${message(code: 'institution.label', default: 'institution')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=false"></script>
        <r:require module="collectory"/>
    </head>
    <body onload="initializeLocationMap('${instance.canBeMapped()}',${instance.latitude},${instance.longitude});">

    <div class="container-fluid">
      <h1 id="metadata-header">
        <g:message code="institution.label" /> : ${fieldValue(bean: instance, field: "name")}
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
            <!-- Institutions -->
            <g:set var='parents' value="${instance.listParents()}"/>
            <g:if test="${parents}">
              <g:each in="${parents}" var="p">
                <h2 style="display:inline;font-size:1.2em"><g:link controller="institution" action="show" id="${p.uid}">${p.name}</g:link></h2>
              </g:each>
            </g:if>
            <!-- GUID    -->
            <p><span class="category"><g:message code="collection.show.span.lsid" />:</span> <cl:guid target="_blank" guid='${(fieldValue(bean: instance, field: "guid"))?:'Not supplied'}'/></p>

            <!-- UID    -->
            <p><span class="category"><g:message code="providerGroup.uid.label" />:</span> ${fieldValue(bean: instance, field: "uid")}</p>

            <!-- Web site -->
            <p><span class="category"><g:message code="collection.show.span.cw" />:</span> <cl:externalLink href="${fieldValue(bean:instance, field:'websiteUrl')}"/></p>

            <!-- Networks -->
            <g:if test="${instance.networkMembership}">
              <p><cl:membershipWithGraphics coll="${instance}"/></p>
            </g:if>

            <!-- Notes -->
            <g:if test="${instance.notes}">
              <p><cl:formattedText>${fieldValue(bean: instance, field: "notes")}</cl:formattedText></p>
            </g:if>

            <!-- last edit -->
            <p><span class="category"><g:message code="datahub.show.lastchange" />:</span> ${fieldValue(bean: instance, field: "userLastModified")} on ${fieldValue(bean: instance, field: "lastUpdated")}</p>

            <cl:editButton uid="${instance.uid}" page="/shared/base"/>
          </div>
          <!-- description -->
          <div class="show-section well">
            <!-- Pub Desc -->
            <h2 class="admin-h2">Description</h2>
            <div class="category"><g:message code="collection.show.span04" /></div><div style="clear:both;"></div>
            <cl:formattedText body="${instance.pubDescription}"/>

            <!-- Tech Desc -->
            <div class="category"><g:message code="collection.show.span05" /></div><div style="clear:both;"></div>
            <cl:formattedText body="${instance.techDescription}"/>

            <!-- Contribution -->
            <div class="category"><g:message code="dataprovider.show.span06" /></div><div style="clear:both;"></div>
            <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>

            <!-- Institution type -->
            <p><span class="category"><g:message code="institution.edit.span07" />:</span> ${fieldValue(bean: instance, field: "institutionType")}</p>

            <!-- Collections -->
            <h2 class="admin-h2">Collections</h2>
              <ul class='fancy'>
                <g:each in="${instance.listCollections().sort{it.name}}" var="c">
                  <li><g:link controller="collection" action="show" id="${c.uid}">${c?.name}</g:link></li>
                </g:each>
              </ul>
              <p>
                <g:link controller="collection" action="create" class="btn" params='[institutionUid: "${instance.uid}"]'>create a new collection for this institution</g:link>
              </p>

              <cl:editButton uid="${instance.uid}" page="description"/>
          </div>
          <!-- images -->
          <g:render template="/shared/images" model="[target: 'logoRef', image: instance.logoRef, title:'Logo', instance: instance]"/>
          <g:render template="/shared/images" model="[target: 'imageRef', image: instance.imageRef, title:'Representative image', instance: instance]"/>

          <!-- location -->
          <g:render template="/shared/location" model="[instance: instance]"/>

          <!-- Record providers and resources -->
          <g:render template="/shared/providers" model="[instance: instance]"/>

          <!-- Contacts -->
          <g:render template="/shared/contacts" model="[contacts: contacts, instance: instance]"/>

          <!-- Attributions -->
          <g:render template="/shared/attributions" model="[instance: instance]"/>

          <!-- change history -->
          <g:render template="/shared/changes" model="[changes: changes, instance: instance]"/>
        </div>
      </div>           
    </div>
  </body>
</html>
