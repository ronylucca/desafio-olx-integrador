<%@ page import="desafio.olx.integrador.IntegracaoImovel" %>



<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="integracaoImovel.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="address" required="" value="${integracaoImovelInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="integracaoImovel.city.label" default="City"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" required="" value="${integracaoImovelInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'complement', 'error')} required">
    <label for="complement">
        <g:message code="integracaoImovel.complement.label" default="Complement"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="complement" required="" value="${integracaoImovelInstance?.complement}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="integracaoImovel.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${integracaoImovelInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'neighbourhood', 'error')} required">
    <label for="neighbourhood">
        <g:message code="integracaoImovel.neighbourhood.label" default="Neighbourhood"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="neighbourhood" required="" value="${integracaoImovelInstance?.neighbourhood}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'number', 'error')} required">
    <label for="number">
        <g:message code="integracaoImovel.number.label" default="Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="number" required="" value="${integracaoImovelInstance?.number}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'propertyCode', 'error')} required">
    <label for="propertyCode">
        <g:message code="integracaoImovel.propertyCode.label" default="Property Code"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="propertyCode" required="" value="${integracaoImovelInstance?.propertyCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'propertyType', 'error')} required">
    <label for="propertyType">
        <g:message code="integracaoImovel.propertyType.label" default="Property Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="propertyType" required="" value="${integracaoImovelInstance?.propertyType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'updatedAt', 'error')} required">
    <label for="updatedAt">
        <g:message code="integracaoImovel.updatedAt.label" default="Updated At"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="updatedAt" required="" value="${integracaoImovelInstance?.updatedAt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integracaoImovelInstance, field: 'zipCode', 'error')} required">
    <label for="zipCode">
        <g:message code="integracaoImovel.zipCode.label" default="Zip Code"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="zipCode" required="" value="${integracaoImovelInstance?.zipCode}"/>

</div>

