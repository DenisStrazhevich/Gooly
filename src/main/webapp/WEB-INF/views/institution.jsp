<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bars</title>
</head>
<body>
<c:if test="${!empty listOfInstitutions}">
    <h1>Бары</h1><br/>
    <c:forEach items="${listOfInstitutions}" var="institution">
        ${institution.name} <ul><li>${institution.workTime}</li><li>${institution.address}</li></ul>
        ${institution.description}<br/>
        <input type="image" src="${contextPath}/resources/img/${institution.image}">
        <br/>
    </c:forEach>
</c:if>
</body>
</html>
