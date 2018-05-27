<%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 27.05.2018
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Отзывы</h1>
    <c:if test="${!empty reviewList}">
        <c:forEach items="${reviewList}" var="review">
            <h3>${review.user_name}</h3>
            <h3>${review.user_surname}</h3>
            <br>
            <h2>${review.review}</h2>
        </c:forEach>
    </c:if> ${review.institution.id}
    <h2>Напишите свой отзыв</h2>
    <form:form method="post" action="" commandName="review">
        <form:input path="user_name" value="${user.name}" hidden="true"/>
        <form:input path="user_surname" value="${user.fullname}" hidden="true"/>
        <form:hidden path="institution.id" value="${institution.id}"/>
        <form:textarea path="review" name="review"  id="1" cols="30" rows="10"/>
        <br/>
        <button type="submit">

        </button>
    </form:form>

</body>
</html>
