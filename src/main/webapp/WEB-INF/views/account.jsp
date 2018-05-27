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
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> ${user.name} </h1> <br>
<h1> ${user.fullname}</h1> <br>
<h1> ${user.username}</h1>

<h2>Вы забронировали место на:</h2><br>
<!--<h3>${orders.orderTime}</h3>-->
<img id="myImg" name="myImg" alt="img" src="data:image/png;base64,<c:out value='${myImage}'/>">

</body>
</html>
