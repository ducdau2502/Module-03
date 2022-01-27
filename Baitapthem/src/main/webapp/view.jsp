<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
        table {
            width: 800px;
        }

        th {
            text-align: center;
        }

        td {
            width: 12.5%;
        }
    </style>
</head>
<body>
<h1><c:out value="${login}" /></h1>

<h1>Tất cả học sinh</h1>
<c:if test="students.isEmpty()">
    <p style="color: red">Không có sản phẩn nào</p>
</c:if>
<form action="/home?action=createGet" method="post">
    <button type="submit">Thêm học sinh</button>
</form>
<form action="/home?action=sort" method="post">
    <button type="submit">Xắp sếp</button>
</form>
<form action="/home?action=displayAll" method="post">
    <button type="submit">Hiển thị tất cả</button>
</form>
<br>
<form action="/home?action=search" method="post">
    <label for="searchName">Tên học sinh:
        <input type="text" id="searchName" name="searchName">
    </label>
    <button type="submit">Tìm kiếm</button>
</form>

<%--<a href="/home?action=createGet">Thêm học sinh</a>--%>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Address</th>
        <th>Average Point</th>
        <th colspan="2">Action</th>
    </tr>

    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getAge()}</td>
            <td>${student.getAddress()}</td>
            <td>${student.getAvgPoint()}</td>
            <td><a href="/home?action=delete&id=${student.getId()}">Delete</a></td>
            <td><a href="/home?action=editGet&id=${student.getId()}">Edit</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
