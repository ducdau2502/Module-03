<%--
  Created by IntelliJ IDEA.
  User: ducdau
  Date: 2/7/22
  Time: 11:19
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
    <script src="ckeditor/ckeditor.js"></script>
    <title>Document</title>
</head>
<body>
<h1>All City</h1>
<a href="/home?action=creatGet">Create new city</a>
<c:if test="${requestScope['listCity'].isEmpty()}">
    <h2 style="color: red">Không có thành phố nào</h2>
</c:if>
<c:if test="${requestScope['listCity'].isEmpty() == false}">
    <table>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Popular</td>
            <td>Area</td>
            <td>GDP</td>
            <td>Country</td>
            <td colspan="2">Action</td>
        </tr>
        <c:forEach items="${listCity}" var="city">
            <tr>
                <td>${city.getId()}</td>
                <td>${city.getName()}</td>
                <td>${city.getPopular()}</td>
                <td>${city.getArea()}</td>
                <td>${city.getGDP()}</td>
                <td>${city.getCountry()}</td>
                <td><a href="/home?action=editGet&id=${city.getId()}">Edit</a></td>
                <td><a href="/home?action=delete&id=${city.getId()}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
