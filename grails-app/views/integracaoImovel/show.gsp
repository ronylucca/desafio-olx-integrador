<%@ page import="desafio.olx.integrador.IntegracaoImovel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'integracaoImovel.label', default: 'IntegracaoImovel')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-integracaoImovel" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-integracaoImovel" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list integracaoImovel">

        <g:if test="${integracaoImovelInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="integracaoImovel.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="address"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.city}">
            <li class="fieldcontain">
                <span id="city-label" class="property-label"><g:message code="integracaoImovel.city.label"
                                                                        default="City"/></span>

                <span class="property-value" aria-labelledby="city-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="city"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.complement}">
            <li class="fieldcontain">
                <span id="complement-label" class="property-label"><g:message code="integracaoImovel.complement.label"
                                                                              default="Complement"/></span>

                <span class="property-value" aria-labelledby="complement-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="complement"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="integracaoImovel.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.neighbourhood}">
            <li class="fieldcontain">
                <span id="neighbourhood-label" class="property-label"><g:message
                        code="integracaoImovel.neighbourhood.label" default="Neighbourhood"/></span>

                <span class="property-value" aria-labelledby="neighbourhood-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="neighbourhood"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message code="integracaoImovel.number.label"
                                                                          default="Number"/></span>

                <span class="property-value" aria-labelledby="number-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="number"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.propertyCode}">
            <li class="fieldcontain">
                <span id="propertyCode-label" class="property-label"><g:message
                        code="integracaoImovel.propertyCode.label" default="Property Code"/></span>

                <span class="property-value" aria-labelledby="propertyCode-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="propertyCode"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.propertyType}">
            <li class="fieldcontain">
                <span id="propertyType-label" class="property-label"><g:message
                        code="integracaoImovel.propertyType.label" default="Property Type"/></span>

                <span class="property-value" aria-labelledby="propertyType-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="propertyType"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.updatedAt}">
            <li class="fieldcontain">
                <span id="updatedAt-label" class="property-label"><g:message code="integracaoImovel.updatedAt.label"
                                                                             default="Updated At"/></span>

                <span class="property-value" aria-labelledby="updatedAt-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="updatedAt"/></span>

            </li>
        </g:if>

        <g:if test="${integracaoImovelInstance?.zipCode}">
            <li class="fieldcontain">
                <span id="zipCode-label" class="property-label"><g:message code="integracaoImovel.zipCode.label"
                                                                           default="Zip Code"/></span>

                <span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue
                        bean="${integracaoImovelInstance}" field="zipCode"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: integracaoImovelInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${integracaoImovelInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
