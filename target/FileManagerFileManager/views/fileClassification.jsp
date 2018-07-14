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
    <title>Main</title>
    <script>
        function showList() {
            $.ajax({
                url:"/web/fileClassification",
                type: "POST",
                dataType: "json",
                data:{
                    "sourcePath":$("#sourcePath").val(),
                    "outputPath":$("#outputPath").val()
                },
                async: false,
                success:function (datas) {
                    $("#show").css('display','block');
                    $("#result").empty();
                    alert("分类成功！请到 "+$("#outputPath").val()+" 中查看");
                    var data=datas[0];
                    var suffixName=data.suffixName;
                    for(var i=0;i<suffixName.length;i++){
                        var name=suffixName[i];
                        var list=data[name];
                        var size=list.length;
                        var listname="";
                        for(var j=0;j<size;j++){
                            if(j==size-1) listname+=list[j];
                            else listname+=(list[j]+",");

                        }
                        $("#result").append("<tr><td width='100px'><center>"+name+"</center></td><td width='50px'><center>"+size+"</center></td><td width='500px'>"+listname+"</td><tr>");
                    }
                }
            })
        }
    </script>
</head>
<body class="easyui-layout">
<jsp:include page="mainHeader.jsp">
    <jsp:param name="username" value="${user.username}"></jsp:param>
</jsp:include>
    <div data-options="region:'center'">
        <div id="searchform" style="margin-top: 30px">
            <center>
                <table style="height: 60px">
                    <tr>
                        <td>选择文件夹路径:</td><td><input type="text" name="sourcePath" id="sourcePath" value="E:\新建文件夹"/></td>
                        <td rowspan="2"><center><input type="button" value="submit" class="easyui-linkbutton" style="margin-left:5px;height: 35px;width: 60px" onclick="showList()"></center></td>
                    </tr>
                    <tr>
                        <td>选择生成文件夹路径:</td><td><input type="text" name="outputPath" id="outputPath" value="E:\新建文件夹 (2)"/></td>
                    </tr>
                </table>
            </center>
        </div>
        <div id="show" style="display: none;margin-top: 10px;">
            <center>
                <table border="1">
                    <thead>
                    <tr>
                        <th>后缀名</th>
                        <th>数量</th>
                        <th>文件名</th>
                    </tr>
                    </thead>
                    <tbody id="result" style="height: 120px">
                    </tbody>
                </table>
            </center>
        </div>
    </div>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
