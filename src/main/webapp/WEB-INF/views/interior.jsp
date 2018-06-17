<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <title>GOOLY</title>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,700" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
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
                    <div class="slideshow-container">

                        <div class="mySlides ">
                            <div class="numbertext">1 / 4</div>
                            <img src="${contextPath}/resources/img/interior/1.jpg" style="width:100%">
                            <div class="text">Caption Text</div>
                        </div>

                        <div class="mySlides ">
                            <div class="numbertext">2 / 4</div>
                            <img src="${contextPath}/resources/img/interior/2.jpg" style="width:100%">
                            <div class="text">Caption Two</div>
                        </div>

                        <div class="mySlides ">
                            <div class="numbertext">3 / 4</div>
                            <img src="${contextPath}/resources/img/interior/3.jpg" style="width:100%">
                            <div class="text">Caption Three</div>
                        </div>

                        <div class="mySlides ">
                            <div class="numbertext">4 / 4</div>
                            <img src="${contextPath}/resources/img/interior/4.jpg" style="width:100%">
                            <div class="text">Caption Three</div>
                        </div>

                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>

                    </div>
                    <br>

                    <div style="text-align:center" class="dot_form">
                        <span class="dot" onclick="currentSlide(1)"></span>
                        <span class="dot" onclick="currentSlide(2)"></span>
                        <span class="dot" onclick="currentSlide(3)"></span>
                    </div>

                    <p class="description__bar">

                        Мы называем себя рестораном белорусской и литвинской кухни. Если белорусская кухня – это уже устоявшийся стереотип (крестьянская кухня, преимущественно Восточной Беларуси, с преобладанием блюд из картофеля, свинины, грибов), то обозначение «литвинская» требует объяснений. Это кухня шляхты, горожан, духовенства Великого княжества Литовского, в какой-то степени зажиточного крестьянства, характерная скорее для северо-запада Беларуси, для овеянного тысячами легенд пространства между двумя древними столицами – Вильней и Новогрудком. Впрочем, между этими двумя кухнями нет абсолютно резкой границы, они всегда оказывали влияние друг на друга. Например, исконное православное рождественское блюдо – Кутья – стало культовым также и для католиков Литвы и Беларуси, а литовские шляхетские верещака, кумпяк, киндзюк прочно вошли в меню православных белорусов. И это взаимопроникновение продолжается и в наши дни: можно сказать, что ресторан «Кухмістр» находится в самом его центре.

                    </p>


                </div>
            </div>
        </div>
    </div>

</section>
<script type="text/javascript" src="${contextPath}/resources/js/script.js"></script>


</body>
</html>
