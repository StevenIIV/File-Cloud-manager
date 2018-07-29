<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/7/26
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="jscssHeader.jsp"%>
    <title>Main</title>
</head>
<body class="easyui-layout">
<jsp:include page="mainHeader.jsp">
    <jsp:param name="username" value="${user.username}"></jsp:param>
</jsp:include>
<div data-options="region:'center'">
    <form id="cloudtable" style="margin-top: 30px">
        <center>
            <table>
                <tr>
                    <th>文件名</th>
                    <th>文件类型</th>
                    <th>最后修改时间</th>
                </tr>
                <%
                    Vector list= (Vector) session.getAttribute("cloudlist");
                    for(int i=0;i<list.size();i++){%>
                        <tr>
                            <td><%=%></td>
                            <td></td>
                            <td></td>
                        </tr>
                <%
                    }
                %>
            </table>
        </center>
    </form>
</div>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
