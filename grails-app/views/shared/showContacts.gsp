<%@ page import="au.org.ala.collectory.Contact; au.org.ala.collectory.ContactFor" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
  <g:set var="entityName" value="${command.ENTITY_TYPE}"/>
  <g:set var="entityNameLower" value="${command.ENTITY_TYPE.toLowerCase()}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
  <div class="container-fluid">
    <h1 id="metadata-header"><g:message code="shared.title.editing" />  <em>${command.name} </em></h1>

    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>

    <div class="col-md-3">
      <div class="region-menu-gauche">
        <ul class="menu nav">
          <g:form>
            <g:hiddenField name="id" value="${command.id}"/>
            <li><g:link class="return-action " controller="${command.urlForm()}" action='show' id="${command.id}"><g:message code="default.contact.home.collection"/></g:link></li>
          </g:form>
        </ul>
      </div>
    </div>

    <div class="col-md-9">
      <h2 class="admin-h2"><g:message code="shared.scontact.title03" /> <g:message code="shared.scontact02.cell0101.fem"/> ${entityNameLower} </h2>
        <g:form action="addContact" id="${command.id}">
          <div class="col-md-12">
            <div class="col-md-4">
              <g:message code="shared.scontact01.cell0101" />
            </div>
            <div class="col-md-8">
              <g:select name="addContact" from="${Contact.listOrderByLastName()}" optionKey="id" noSelection="${['null':'Select un contact à ajouter']}" class="form-control"/>
            </div>
          </div>
          <div class="col-md-12 button-ext">
            <div class=" button-int">
              <input type="submit" onclick="return anySelected('addContact','Vous devez sélectionner un contact à ajouter.');" class="edit-btn btn btn-sm" value="Ajouter un contact existant"/>
            </div>
          </div>
        </g:form>
      <div class="col-md-12" id="add-contact-div">
        <div class="col-md-12">
          <g:message code="shared.scontact02.cell0101"/> <g:message code="shared.scontact02.cell0101.fem"/> ${entityNameLower} :
        </div>
        <div class="col-md-12 button-ext">
          <div class=" button-int">
            <g:link class="edit-btn btn btn-sm" controller="contact" action='create' params='[returnTo:"/${command.urlForm()}/addNewContact/${command.id}"]' id="${command.id}">${message(code: 'default.button.addContact.label', default: 'Add new contact')}</g:link>
          </div>
        </div>
      </div>

      <h2 class="admin-h2"><g:message code="shared.scontact.title04" /> <g:message code="shared.scontact02.cell0101.fem"/> ${entityNameLower}</h2>
      <g:each var="cf" in="${command.getContacts()}">
        <div class="col-md-12">
          <div class="col-md-7">
            <!-- Name -->
            <div class="category">${cf.contact.buildName()}</div>
            <div class="contact-detail">
              <cl:valueOrOtherwise value="${cf.contact.email}" otherwise="Pas d'adresse email définie">${cf.contact.email}</cl:valueOrOtherwise> <br />
              <cl:valueOrOtherwise value="${cf.contact.phone}" otherwise="Pas de numéro de téléphone défini">Tél: ${cf.contact.phone}</cl:valueOrOtherwise><br />
              <cl:valueOrOtherwise value="${cf.contact.mobile}" otherwise="Pas de numéro de téléphone protable défini">Port: ${cf.contact.mobile}</cl:valueOrOtherwise><br />
              <cl:valueOrOtherwise value="${cf.contact.fax}" otherwise="Pas de numéro de fax défini">Fax: ${cf.contact.fax}</cl:valueOrOtherwise><br />
            </div>
            <div>
              <cl:valueOrOtherwise value="${cf.role}" otherwise="Aucun rôle défini"><g:message code="shared.scontact.li01" /> ${cf.role}</cl:valueOrOtherwise> <br />
              <cl:valueOrOtherwise value="${cf.administrator}" otherwise="Pas autorisé à éditer"><img src="${resource(dir:'images/ala', file:'olive-tick.png')}"/><g:message code="shared.scontact.li02" /></cl:valueOrOtherwise><br />
              <cl:valueOrOtherwise value="${cf.notify}" otherwise="Ne pas envoyer de notification"><img src="${resource(dir:'images/ala', file:'olive-tick.png')}"/><g:message code="shared.scontact.li03" /></cl:valueOrOtherwise><br />
              <cl:valueOrOtherwise value="${cf.primaryContact}"><img src="${resource(dir:'images/ala', file:'olive-tick.png')}"/><g:message code="shared.scontact.li04" /></cl:valueOrOtherwise><br />
            </div>
          </div>
          <div class="col-md-5">
            <g:link class="edit-btn btn btn-sm btn-contact" controller="contact" action='edit' id="${cf.contact.id}"
                    params='[returnTo: "/${command.urlForm()}/edit/${command.id}?page=/shared/showContacts"]'>
              ${message(code: 'default.button.editContact.label', default: "Edit the contact's details")}
            </g:link>
            <g:link class="edit-btn btn btn-sm btn-contact" action='editRole' id="${cf.id}"
                    params='[returnTo: "/${command.urlForm()}/edit/${command.id}?page=/shared/showContacts"]'>
              <g:message code="shared.scontact.link.edit" /> <g:message code="shared.scontact02.cell0101.fem" /> ${entityNameLower}
            </g:link>
            <g:link class="delete-btn btn btn-sm btn-contact" action='removeContact' id="${command.id}" onclick="return confirm('Supprimer ${cf.contact?.buildName()} comme contact pour cette ${entityNameLower}?');"
                    params='[idToRemove: "${cf.id}"]'><g:message code="shared.scontact.link.remove" /> <g:message code="shared.scontact02.cell0101.fem" /> ${entityNameLower}</g:link>
          </div>
        </div>
      </g:each>
    </div>

    </div>

</body>
</html>
