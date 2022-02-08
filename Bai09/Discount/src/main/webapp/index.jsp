<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            width: 300px;
        }

        td {
            width: 50%;
        }
    </style>
</head>
<body>
<form action="/discount" method="post">
    <table>
        <tr>
            <td><label for="listPrice">List Price </label></td>
            <td><input id="listPrice" name="listPrice" type="number"></td>
        </tr>
        <tr>
            <td><label for="discountPercent">Discount Percent</label></td>
            <td><input id="discountPercent" name="discountPercent" type="number"></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Calculate</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>