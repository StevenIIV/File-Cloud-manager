<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/7/6
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<form action="/login" method="post">
    <center>
    <table>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="login"></td>
        </tr>
    </table>
    </center>
</form>
</body>
</html>
