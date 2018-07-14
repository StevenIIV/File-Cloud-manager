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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script>
        function check() {
            var pd0=document.getElementById("oldpassword").value;
            var pd1=document.getElementById("newpassword").value;
            var pd2=document.getElementById("renewpassword").value;
            if(pd0.length==0){
                alert("请输入旧密码");
                return false;
            }
            else if(pd1.length==0||pd2.length==0){
                alert("请输入新密码");
                return false;
            }
            else if(pd1!=pd2){
                alert("两次密码不一样");
                return false;
            }
            else return true;
        }
    </script>
    <title>Main</title>
</head>
<body class="easyui-layout">
<jsp:include page="mainHeader.jsp">
    <jsp:param name="username" value="${user.username}"></jsp:param>
</jsp:include>
<div data-options="region:'center'" style="margin-top: 50px;border: none" >
    <form name="resetform" action="/web/resetPassword.do" method="post" onsubmit="return check()">
        <center>
            <table style="height: 200px">
                <tr>
                    <th colspan="2"><center>密码重置</center></th>
                </tr>
                <tr>
                    <td><center>id:</center></td><td>${user.id}</td>
                </tr>
                <tr>
                    <td><center>旧密码:</center></td><td><input type="password" id="oldpassword" name="oldpassword"/></td>
                </tr>
                <tr>
                    <td><center>新密码:</center></td><td><input type="password" id="newpassword" name="newpassword"/></td>
                </tr>
                <tr>
                    <td><center>重新输入:</center></td><td><input type="password" id="renewpassword" name="renewpassword"/></td>
                </tr>
                <tr>
                    <th colspan="2"><center><input type="submit" class="easyui-linkbutton" style="width:60px;height: 30px" value="确定"></center></th>
                </tr>
            </table>
        </center>
    </form>
</div>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
