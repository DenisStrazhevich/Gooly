<%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 21.05.2018
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <title>GOOLY</title>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,700" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="${contextPath}/resources/img/icon.png" type="image/png" />
</head>
<body>
<header id="header" class="header">
    <div class="container">
        <div class="row ">
            <div class="header__main d-flex">
                <div class="col-lg-4">
                    <img  class="logo" src="${contextPath}/resources/img/logo.png">
                </div>
                <div class="col-lg-7">
                    <form class="search" action="<c:url value="/search"/> " method="get">
                        <div class="d-flex">
                            <div class="search__icon">
                                <i class="fa fa-search"></i>
                            </div>
                            <input  name="searchText" type="search" placeholder="поиск мест" class="search__input">
                        </div>
                    </form>
                </div>
                <div class="col-lg-1">
                    <div class="location d-flex">
                        <div class="location__logo">
                            <i class="fa fa-map-marker"></i>
                        </div>
                        <h3 class="location__M">
                            минск
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<section id="main" class="main">
    <div class="container">
        <div class="row">
            <div class="content d-flex">
                <div class="col-lg-3">
                    <div class="form">
                        <form action="<c:url value="${contextPath}/welcome"/>" >
                            <button type="submit" class="btn__login">
                                Главная
                            </button><br>
                        </form>
                        <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                            <form  action="<c:url value="${contextPath}/login"/>">
                                <button type="submit" class="form__btn" >
                                    Вход
                                </button><br>
                            </form>
                            <form action="<c:url value="${contextPath}/registration"/>">
                                <button type="submit" class="form__btn" >
                                    Регистрация
                                </button><br>
                            </form>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN', 'ROLE_BAKEHOUSE', 'ROLE_BEEFBEAR')">
                            <form method="post" action="<c:url value="/logout"/>">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="form__btn" >
                                    Выход
                                </button><br>
                            </form>
                        </sec:authorize>
                        <form action="<c:url value="/institution/bars"/> ">
                            <input type="text" name="institutionType" value="Бары" hidden="true">
                            <button type="submit" class="form__btn" >
                                бары
                            </button><br>
                        </form>
                        <form action="<c:url value="/institution/bars"/>">
                            <input type="text" name="institutionType" value="Кафе" hidden="true">
                            <button type="submit" class="form__btn" >
                                кафе
                            </button><br>
                        </form>
                        <form method="post" action=" ">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="form__btn" >
                                пиццерии
                            </button><br>
                        </form>
                        <form action="index.jsp">
                            <button type="submit" class="form__btn" >
                                кофейни
                            </button><br>
                        </form>
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                            <form method="get" action="<c:url value="/account"/>">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <!--<input type="text" name="phone" value="${pageContext.request.userPrincipal.name}" hidden="true">-->
                                <button type="submit" class="form__btn" >
                                    кабинет
                                </button><br>
                            </form>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_BAKEHOUSE','ROLE_ADMIN')">
                            <form method="get" action="<c:url value="/request"/>">
                                <input type="text" name="institutionName" value="BAKEHOUSE" hidden="true">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="form__btn" >
                                    заявки
                                </button><br>
                            </form>
                        </sec:authorize>

                        <form action="index.jsp">
                            <button type="submit" class="form__btn" >
                                скидки
                            </button><br>
                        </form>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="personalRoom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h1>
                                        Заявки
                                    </h1>
                                </div>
                            </div>
                            <c:if test="${!empty order}">
                                <c:forEach items="${order}" var="order">
                                    <div class="row">
                                        <div class="zakazInfo">
                                            <div class="col-lg-12">
                                                <c:if test="${!empty order.reservationDate}">
                                                    <p>
                                                        <b>${order.visitorName}</b> забронировал <b>${order.orderTableNumber}</b> столик <b>${order.reservationDate}</b> на <b>${order.orderTime}</b>
                                                    </p>
                                                </c:if>
                                                <c:if test="${empty order.reservationDate}">
                                                    <p>
                                                        <b>${order.visitorName}</b> забронировал <b>${order.orderTableNumber}</b> столик.
                                                    </p>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




</body>
</html>
