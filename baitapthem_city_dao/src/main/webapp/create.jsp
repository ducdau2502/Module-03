<%--
  Created by IntelliJ IDEA.
  User: ducdau
  Date: 2/7/22
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="ckeditor-2/ckeditor.js"></script>
    <title>Document</title>
</head>
<body>

<c:if test="${errorMes != null}">
    <h1><c:out value="${errorMes}"></c:out> </h1>
</c:if>
<c:url value="/home" var="myUrl">
    <c:if test="${city != null}">
        <c:param name="action" value="editPost"/>
    </c:if>
    <c:if test="${city == null}">
        <c:param name="action" value="creatPost"/>
    </c:if>
</c:url>
<form action="${myUrl}" method="post">
    <c:if test="${city != null}">
        <label>ID :
            <input value="${city.getId()}" type="text" name="id">
        </label>
    </c:if>
    <label>Name :
        <textarea name="name" id="ten"></textarea>
        <script>CKEDITOR.replace('ten');</script>
    </label>
    <label>Popular :
        <input <c:if test="${city != null}">value="${city.getPopular()}"</c:if> type="text" name="popular">
    </label>
    <label>Area :
        <input <c:if test="${city != null}">value="${city.getArea()}"</c:if> type="text" name="area">
    </label>
    <label>GDP :
        <input <c:if test="${city != null}">value="${city.getGDP()}"</c:if> type="text" name="GDP">
    </label>
    <label>Country :
        <select name="country">
            <c:forEach items="${country}" var="count">
                <option value="${count.getId_country()}">${count.getCountry()}</option>
            </c:forEach>
        </select>
    </label>
    <input type="submit" <c:if test="${city != null}">value="Edit"</c:if><c:if test="${city == null}">value="Create"</c:if> >
</form>

</body>
</html>