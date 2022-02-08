<%--
  Created by IntelliJ IDEA.
  User: ducdau
  Date: 1/27/22
  Time: 14:04
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
    <title>Products</title>
</head>
<body>
<h1>All Products</h1>
<a href="/products?action=creatGet">Create new product</a>
<br>
<a href="/products?action=displayAll">Display All</a>
<br>
<a href="/products?action=sortIncrease">Sort Increase</a>
<br>
<a href="${pageContext.request.contextPath}/products?action=sortDecrease">Sort Decrease</a>
<br>
<a href="/cart.jsp">Cart</a>
<c:if test="${requestScope['products'].isEmpty() == true}">
    <h2 style="color: red">Empty</h2>
    </c:if>
    <c:if test="${requestScope['products'].isEmpty() == false}">
    <table>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Price</td>
            <td>Quantity</td>
            <td>Description</td>
            <td colspan="3">Action</td>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.getId()}</td>
                <td><a id="name" style="text-decoration: none"
                       href="/products?action=detail&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getPrice()}</td>
                <td>${product.getQuantity()}</td>
                <td>${product.getDescription()}</td>
                <td><a href="/products?action=editGet&id=${product.getId()}">Edit</a></td>
                <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
                <td><a href="/products?action=add&id=${product.getId()}">Add</a></td>
            </tr>
        </c:forEach>
    </table>
    </c:if>
</body>
</html>