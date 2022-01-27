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
<form action="/home?action=createPost" method="post">
    <label for="id">ID:
        <input type="text" id="id" name="id">
    </label>
    <label for="name">Name:
        <input type="text" id="name" name="name">
    </label>
    <label for="age">Age:
        <input type="number" id="age" name="age">
    </label>
    <label for="address">Address:
        <input type="text" id="address" name="address">
    </label>
    <label for="avgPoint">Average Point:
    <input type="number" id="avgPoint" name="avgPoint">
</label>
   <button type="submit">Create</button>
</form>
</body>
</html>
