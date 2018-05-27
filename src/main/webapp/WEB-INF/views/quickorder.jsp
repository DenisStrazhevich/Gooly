<%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 15.05.2018
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Заказать столик</title>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,700" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <script>
        function change(objName, min, max, step) {
            var obj = document.getElementById(objName);
            var tmp = +obj.value + step;
            if (tmp<min) tmp=min;
            if (tmp>max) tmp=max;
            obj.value = tmp;
        }
    </script>

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
                                кофейни
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
                <div class="col-lg-9">
                    <div class="oknoZakaza">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h6> Бронирование столика за пару минут</h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="infoofRest d-flex">
                                    <div class="col-lg-5">
                                        <h3>
                                            ${institutions.name}
                                        </h3>
                                    </div>
                                    <div class="time col-lg-7">
                                        <ul>
                                            <li>
                                                ${institutions.workTime}
                                            </li>
                                            <li>
                                                ${institutions.address}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                          <c:url var="quickorder" value="/quickorder"/>
                            <form:form method="post" action="${quickorder}" commandName="order">

                                <div class="row">
                                    <div class="date2 d-flex">
                                        <div class="col-lg-7">
                                            <div class="status1 d-flex ">
                                                <div class="status__1">1111111</div>
                                                <p>
                                                    недоступен
                                                </p>
                                            </div>
                                            <div class="status2 d-flex">
                                                <div class="status__2">111111.</div>
                                                <p>
                                                    свободный
                                                </p>
                                            </div>
                                        </div>
                                        <div class="statusTime col-lg-5">
                                            <div class="addDel d-flex">
                                                <input class="add" type="button" value="+" onclick="change('add_num',0,10, 1);">
                                                <form:input path="visitorCount" id="add_num" type="text" readonly="true" value="1"/>
                                                <!-- <span id="add_num">1 чел.</span>-->
                                                <input class="del" type="button" value="-" onclick="change('add_num',0,10,-1);">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="shema">
                                        <div class="tables col-lg-12">
                                            <div class="d-flex">
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 1}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t1" class="whiteTable">
                                                                <p>
                                                                    1
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t1" class="blackTable">
                                                                <p>
                                                                    1
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>

                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 2}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t2" class="whiteTable">
                                                                <p>
                                                                    2
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t2" class="blackTable">
                                                                <p>
                                                                    2
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 7}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t7" class="whiteTable">
                                                                <p>
                                                                    7
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t7" class="blackTable">
                                                                <p>
                                                                    7
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 8}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t8" class="whiteTable">
                                                                <p>
                                                                    8
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t8" class="blackTable">
                                                                <p>
                                                                    8
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 9}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t9" class="whiteTable">
                                                                <p>
                                                                    9
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t9" class="blackTable">
                                                                <p>
                                                                    9
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 10}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t10" class="whiteTable">
                                                                <p>
                                                                    10
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t10" class="blackTable">
                                                                <p>
                                                                    10
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 11}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t11" class="whiteTable">
                                                                <p>
                                                                    11
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t11" class="blackTable">
                                                                <p>
                                                                    11
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <div class="d-flex">
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 3}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t3" class="whiteTable">
                                                                <p>
                                                                    3
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t3" class="blackTable">
                                                                <p>
                                                                    3
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 12}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t12" class="whiteTable">
                                                                <p>
                                                                    12
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t1" class="blackTable">
                                                                <p>
                                                                    12
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 13}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t13" class="whiteTable">
                                                                <p>
                                                                    13
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t13" class="blackTable">
                                                                <p>
                                                                    13
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <div>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 4}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t4" class="whiteTable">
                                                                <p>
                                                                    4
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t4" class="blackTable">
                                                                <p>
                                                                    4
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <div>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 5}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t5" class="whiteTable">
                                                                <p>
                                                                    5
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t5" class="blackTable">
                                                                <p>
                                                                    5
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <div>
                                                <c:forEach items="${listTable}" var="table">
                                                    <c:if test="${table.numberOfTable eq 6}">
                                                        <c:if test="${table.status eq 'свободный'}">
                                                            <div id="t6" class="whiteTable">
                                                                <p>
                                                                    6
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${table.status eq 'недоступен'}">
                                                            <div id="t6" class="blackTable">
                                                                <p>
                                                                    6
                                                                </p>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="selectTable col-lg-12 d-flex">
                                        <p>
                                            выбранный стол:
                                        </p>

                                        <form:input path="orderTableNumber" id="numTable" type="text" name="tableNumber"/>

                                    </div>

                                </div>
                                <form:input path="visitorName" value="${user.name}" hidden="true"/>
                                <form:input path="visitorPhonenumber" value="${user.username}" hidden="true"/>
                                <form:input path="orderInstitutionName" value="${institutions.name}"  hidden="true"/>
                                <div class="row">
                                    <div class="R col-lg-12">
                                        <button type="submit" class="reserv">
                                            забронировать столик
                                        </button><br>
                                    </div>
                                </div>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
</html>
