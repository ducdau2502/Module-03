<%--
  Created by IntelliJ IDEA.
  User: ducdau
  Date: 1/27/22
  Time: 14:44
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
    <title>Cart</title>
</head>
<body>
<h1>Cart</h1>

<a href="/products">Back</a>
<table>
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Total Price</td>
    </tr>
<c:forEach items="${cart}" var="product">
    <tr>
        <c:set var="quantityCart" value="${quantityCart + quantity}"></c:set>
        <c:set var="totalCart" value="${quantityCart * product.getPrice()}"></c:set>
        <td>${product.getName()}</td>
        <td>${product.getPrice()}</td>
        <td>${quantityCart}</td>
        <td>${totalCart}</td>
    </tr>
</c:forEach>
</table>
<a href="/products?action=buy&quantityCart=${quantityCart}">Buy</a>
</body>
</html>
