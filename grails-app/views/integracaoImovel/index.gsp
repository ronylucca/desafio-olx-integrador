<%@ page import="desafio.olx.integrador.IntegracaoImovel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'integracaoImovel.label', default: 'IntegracaoImovel')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-integracaoImovel" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-integracaoImovel" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="address"
                              title="${message(code: 'integracaoImovel.address.label', default: 'Address')}"/>

            <g:sortableColumn property="city" title="${message(code: 'integracaoImovel.city.label', default: 'City')}"/>

            <g:sortableColumn property="complement"
                              title="${message(code: 'integracaoImovel.complement.label', default: 'Complement')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'integracaoImovel.description.label', default: 'Description')}"/>

            <g:sortableColumn property="neighbourhood"
                              title="${message(code: 'integracaoImovel.neighbourhood.label', default: 'Neighbourhood')}"/>

            <g:sortableColumn property="number"
                              title="${message(code: 'integracaoImovel.number.label', default: 'Number')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${integracaoImovelInstanceList}" status="i" var="integracaoImovelInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${integracaoImovelInstance.id}">${fieldValue(bean: integracaoImovelInstance, field: "address")}</g:link></td>

                <td>${fieldValue(bean: integracaoImovelInstance, field: "city")}</td>

                <td>${fieldValue(bean: integracaoImovelInstance, field: "complement")}</td>

                <td>${fieldValue(bean: integracaoImovelInstance, field: "description")}</td>

                <td>${fieldValue(bean: integracaoImovelInstance, field: "neighbourhood")}</td>

                <td>${fieldValue(bean: integracaoImovelInstance, field: "number")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${integracaoImovelInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
