<%--
  Created by IntelliJ IDEA.
  User: ducdau
  Date: 1/25/22
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="/home?action=editPost" method="post">
    <label for="updateId">ID:
        <input type="text" id="updateId" name="updateId" value="${student.getId()}" hidden>
    </label hidden>
    <label for="updateName">Name:
        <input type="text" id="updateName" name="updateName" value="${student.getName()}">
    </label>
    <label for="updateAge">Age:
        <input type="number" id="updateAge" name="updateAge" value="${student.getAge()}">
    </label>
    <label for="updateAddress">Address:
        <input type="text" id="updateAddress" name="updateAddress" value="${student.getAddress()}">
    </label>
    <label for="updateAvgPoint">Average Point:
    <input type="number" id="updateAvgPoint" name="updateAvgPoint" value="${student.getAvgPoint()}">
</label>
   <button type="submit">Update</button>
</form>
</body>
</html>
