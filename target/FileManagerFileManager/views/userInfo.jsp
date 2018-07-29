<%@ page import="com.springmvc.model.User" %>
<%@ page import="org.springframework.ui.ModelMap" %><%--
  Created by IntelliJ IDEA.
  User: acm-27
  Date: 2018/7/8
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%@include file="jscssHeader.jsp"%>
    <title>Main</title>
</head>
<body class="easyui-layout">
<jsp:include page="mainHeader.jsp">
    <jsp:param name="username" value="${user.username}"></jsp:param>
</jsp:include>
    <div data-options="region:'center'" style="margin-top: 50px;border: none" >
        <form id="userInfo" >
            <center>
                <table border="1" style="width: 350px;height: 350px">
                    <tr>
                        <th colspan="2"><center>用户个人信息</center></th>
                    </tr>
                    <tr>
                        <td><center>id:</center></td><td>${user.id}</td>
                    </tr>
                    <tr>
                        <td><center>用户名:</center></td><td>${user.username}</td>
                    </tr>
                    <tr>
                        <td><center>email:</center></td><td>${user.email}</td>
                    </tr>
                    <tr>
                        <td><center>resgiter time:</center></td><td>${user.regtime}</td>
                    </tr>
                    <tr>
                        <td><center>权限:</center></td><td>${user.role}</td>
                    </tr>
                </table>
                <br>
                <center><input type="submit" class="easyui-linkbutton" style="width:70px;height: 40px" value="确定"></center>
            </center>
        </form>
    </div>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
