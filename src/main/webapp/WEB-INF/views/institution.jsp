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
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,700" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="${contextPath}/resources/css/main.css">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="${contextPath}/resources/img/icon.png" type="image/png" />
    <title>Bars</title>


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
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                            <form method="post" action="<c:url value="/logout"/>">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="form__btn" >
                                    Выход
                                </button><br>
                            </form>
                        </sec:authorize>
                        <form action="<c:url value="/institution/bars"/>">
                            <input type="text" name="institutionType" value="Кафе" hidden="true">
                            <button type="submit" class="form__btn" >
                                кафе
                            </button><br>
                        </form>
                        <form action="<c:url value="/institution/bars"/> ">
                            <input type="text" name="institutionType" value="Бары" hidden="true">
                            <button type="submit" class="form__btn" >
                                бары
                            </button><br>
                        </form>
                        <form action="index.jsp">
                            <button type="submit" class="form__btn" >
                                пиццерии
                            </button><br>
                        </form>
                        <form action="index.jsp">
                            <button type="submit" class="form__btn" >
                                кафейни
                            </button><br>
                        </form>
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN', 'ROLE_BAKEHOUSE', 'ROLE_BEEFBEAR')">
                            <form method="get" action="<c:url value="/account"/>">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <!--<input type="text" name="phone" value="${pageContext.request.userPrincipal.name}" hidden="true">-->
                                <button type="submit" class="form__btn" >
                                    кабинет
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
                <c:if test="${!empty listOfInstitutions}">

                    <div class="col-lg-9">
                        <div class="restaurants">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h1>
                                            ${kindOfInstitution}
                                        </h1>
                                    </div>
                                </div>

                                <c:forEach items="${listOfInstitutions}" var="institution">
                                    <div class="row">
                                        <div class="infoofRest d-flex">
                                            <div class="col-lg-5">
                                                <h3>
                                                    ${institution.name}
                                                </h3>
                                            </div>
                                            <div class="time col-lg-7">
                                                <ul>
                                                    <li>
                                                        ${institution.workTime}
                                                    </li>
                                                    <li>
                                                        ${institution.address}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <p>
                                                ${institution.description}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="rest d-flex">
                                            <div class="col-lg-8">
                                                <img src="${contextPath}/resources/img/${institution.image}">
                                            </div>
                                            <div class="rest__btn col-lg-3">
                                                <form action="">
                                                    <button type="button" >
                                                        карта
                                                    </button><br>
                                                </form>

                                                <form action="#">
                                                    <button type="submit">
                                                        отзывы
                                                    </button><br>
                                                </form>
                                                <form action="#">
                                                    <button type="submit" >
                                                        меню
                                                    </button><br>
                                                </form>
                                                <form action="#">
                                                    <button type="submit">
                                                        интерьер
                                                    </button><br>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN', 'ROLE_BAKEHOUSE', 'ROLE_BEEFBEAR')">


                                        <div class="row">
                                            <div class="end">
                                                <div class="rest__btn col-lg-8 d-flex">
                                                    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN','ROLE_BAKEHOUSE')">
                                                        <form class="rest__btnBlack" action="<c:url value="/order"/> ">
                                                            <input type="text" name="institutionName" value="${institution.name}" hidden="true">
                                                            <input type="text" name="phone" value="${pageContext.request.userPrincipal.name}" hidden="true">
                                                            <button type="submit">
                                                                забронировать стол
                                                            </button><br>
                                                        </form>
                                                    </sec:authorize>
                                                    <form id="btnInterier" action="#">
                                                        <button type="submit" >
                                                            позвонить
                                                        </button>
                                                    </form>
                                                    <br>
                                                </div>
                                            </div>
                                            <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                                                <form class="rest__btnBlack" action="<c:url value="/quickorder"/> ">
                                                    <input type="text" name="institutionName" value="${institution.name}" hidden="true">
                                                    <input type="text" name="phone" value="${pageContext.request.userPrincipal.name}" hidden="true">
                                                    <button type="submit">
                                                        Успей за 15 минут
                                                    </button><br>
                                                </form>
                                            </sec:authorize>
                                            <sec:authorize access="hasRole('ROLE_' + '${institution.name}')">
                                                <form class="rest__btnBlack" action="<c:url value="/confirm_order"/> ">
                                                    <input type="text" name="institutionName" value="${institution.name}" hidden="true">
                                                    <input type="text" name="phone" value="${pageContext.request.userPrincipal.name}" hidden="true">
                                                    <button type="submit">
                                                        Успей за 15 минут
                                                    </button><br>
                                                </form>
                                                <div class="row">
                                                    <div class="rest__btn col-lg-12" >
                                                        <form class="rest__btnBlack" action="<c:url value="/clear"/> ">
                                                            <input type="text" name="institutionName" value="${institution.name}" hidden="true">
                                                            <button type="submit">
                                                                освободить стол
                                                            </button><br>
                                                        </form>
                                                    </div>
                                                </div>
                                            </sec:authorize>
                                        </div>
                                    </sec:authorize>
                                    <br>
                                </c:forEach>

                            </div>
                        </div>
                    </div>

                </c:if>
            </div>
        </div>
    </div>
</section>


</body>
</html>
