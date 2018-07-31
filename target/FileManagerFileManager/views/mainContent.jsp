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
<jsp:include page="jq.jsp"></jsp:include>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
