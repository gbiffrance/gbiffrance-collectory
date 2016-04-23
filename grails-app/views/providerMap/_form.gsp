<g:form action="save" method="post" >
    <g:hiddenField name="returnTo" value="${returnTo}" />
    <g:hiddenField name="id" value="${providerMapInstance?.id}" />
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="institutionSelect"><g:message code="providerMap.institution.label" default="Institution" /></label>
        </div>
        <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'providerGroup', 'errors')}">
            <g:select id="institutionSelect" name="institution.id" class="form-control"
                      from="${au.org.ala.collectory.Institution.list([sort: 'name'])}"
                      optionKey="id"
                      value="${providerMapInstance?.institution?.id}"
                      noSelection="${['null':'---- sélectionner une institution -----']}"
            />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="collectionSelect"><g:message code="providerMap.collection.label" default="Collection" /></label>
        </div>
        <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'providerGroup', 'errors')}">
            <g:select id="collectionSelect" name="collection.id" class="form-control"
                      from="${au.org.ala.collectory.Collection.list([sort: 'name'])}"
                      optionKey="id"
                      value="${providerMapInstance?.collection?.id}"
                      noSelection="${['null':'---- sélectionner une collection -----']}"
            />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="institutionCodes"><g:message code="providerMap.institutionCodes.label" default="Institution Codes" /></label>
        </div>
        <div class="col-md-9  value ${hasErrors(bean: providerMapInstance, field: 'institutionCodes', 'errors')}">
            <g:select name="institutionCodes"
                      class="form-control"
                      from="${au.org.ala.collectory.ProviderCode.list([sort:'code'])}"
                      multiple="yes"
                      optionKey="id"
                      size="5"
                      value="${providerMapInstance?.institutionCodes*.id}" />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="collectionCodes"><g:message code="providerMap.collectionCodes.label" default="Collection Codes" /></label>
        </div>
        <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'collectionCodes', 'errors')}">
            <g:select name="collectionCodes"  class="form-control" from="${au.org.ala.collectory.ProviderCode.list([sort:'code'])}" multiple="yes" optionKey="id" size="5" value="${providerMapInstance?.collectionCodes*.id}" />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="exact"><g:message code="providerMap.exact.label" default="Exact" /></label>
        </div>
        <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'exact', 'errors')}">
            <g:checkBox name="exact" value="${providerMapInstance?.exact}"  />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="warning"><g:message code="providerMap.warning.label" default="Warning" /></label>
        </div>
        <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'warning', 'errors')}">
            <g:textField name="warning" value="${providerMapInstance?.warning}" class="form-control"  />
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
        <div class="col-md-3">
            <label for="matchAnyCollectionCode"><g:message code="providerMap.matchAnyCollectionCode.label" default="Match Any Collection Code" /></label>
        </div>
        <div>
            <div class="col-md-9 value ${hasErrors(bean: providerMapInstance, field: 'matchAnyCollectionCode', 'errors')}">
                <g:checkBox name="matchAnyCollectionCode" value="${providerMapInstance?.matchAnyCollectionCode}" />
            </div>
        </div>
    </div>
    <div class="col-md-12 edit-contact-form">
            <g:if test="${!providerMapInstance.dateCreated}">
                <div class="button-ext">
                    <div class=" button button-int">
                        <g:submitButton name="create" class="edit-btn btn btn-sm" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
            </g:if>
            <g:else>
                <div class="buttons button-ext">
                    <span class="button button-int"><g:actionSubmit class="edit-btn btn btn-sm" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button button-int"><g:actionSubmit class="delete-btn btn btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:else>

    </div>
</g:form>
<r:script>

$('#institutionSelect').change(function() {

    console.log("Institution val: " + $('#institutionSelect').val());

    var selectedInst =  $('#institutionSelect').val();

    var collectionListURL = "${grailsApplication.config.grails.serverURL}/ws/institution/" + $('#institutionSelect').val();

    if(selectedInst == 'null'){
        collectionListURL = "${grailsApplication.config.grails.serverURL}/ws/collection/";

        $.get(collectionListURL, function( data ) {
            $('#collectionSelect').empty();
            $('#collectionSelect')
                .append($("<option></option>")
                .attr("value", 'null')
                .text('---- select a collection ----'));
            $.each( data, function( key, collection ) {
                console.log(collection);
                $('#collectionSelect')
                    .append($("<option></option>")
                    .attr("value", collection.uid)
                    .text(collection.name));
            });
        });

    } else {

        $.get(collectionListURL, function( data ) {
            $('#collectionSelect').empty();
            $('#collectionSelect')
                .append($("<option></option>")
                .attr("value", 'null')
                .text('---- select a collection ----'));

            $.each( data.collections, function( key, collection ) {
                console.log(collection);
                $('#collectionSelect')
                    .append($("<option></option>")
                    .attr("value", collection.uid)
                    .text(collection.name));
            });
        });
    }
});

</r:script>