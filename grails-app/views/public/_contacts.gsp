<g:if test="${it?.size() > 0}">
  <div class="section">
    <h3 class="public-h3">Contact</h3>
    <g:each in="${it}" var="cf">
      <div class="contact">
        <p>
            <span class="contactName">${cf?.contact?.buildName()}</span><br/>
            <g:if test="${cf?.role}"> <em>${cf?.role}</em><br/></g:if>
            <g:if test="${cf?.contact?.phone}">Téléphone : ${cf?.contact?.phone}<br/></g:if>
            <g:if test="${cf?.contact?.fax}">Fax : ${cf?.contact?.fax}<br/></g:if>
            <cl:emailLink email="${cf?.contact?.email}">Contacter par mail</cl:emailLink>
        </p>
      </div>
    </g:each>
  </div>
</g:if>
