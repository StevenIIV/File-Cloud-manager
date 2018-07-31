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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cloudtable.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/colResizable-1.5.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Mousefunction.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#sample2").colResizable({
                liveDrag:true,
                gripInnerHtml:"<div class='grip'></div>",
                draggingClass:"dragging"});
        });
    </script>
    <title>文件搜索</title>
    <script type="text/javascript"  charset="UTF-8">
        function showList() {
            $.ajax({
                url:"/web/fileSearch",
                type: "POST",
                dataType: "json",
                data:{
                    "fileName":$("#fileName").val(),
                    "filePath":$("#filePath").val()
                },
                async: false,
                success:function (data) {
                    $("#show").css('display','block');
                    $("#result").empty();
                    var thisListValueStr="";
                    console.log(data.length+"条数据");
                    for (var i=0;i<data.length;i++){
                        var castList=data[i];
                        thisListValueStr="<tr><td>"+castList.fileName+"</td><td>"+castList.filePath+"</td><td>"+castList.fileTime+"</td></tr>";
                        $("#result").append(thisListValueStr);
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
                        <td>文件名:</td><td><input type="text" style="width: 200px" name="fileName" id="fileName" value="hdu"/></td>
                        <td rowspan="2"><center><input type="button" value="submit" class="easyui-linkbutton" style="margin-left:5px;height: 35px;width: 60px" onclick="showList()"></center></td>
                    </tr>
                    <tr>
                        <td>文件路径:</td><td><input type="text" style="width: 200px" name="filePath" id="filePath" value="C:\Users\admin\Desktop\A C M"/></td>
                    </tr>
                </table>
            </center>
        </div>
        <div class="refresh" id="show" style="display: none;margin-top: 10px;">
            <center>
                <table id="sample2" class="hui-list-table"style="margin-left: 10px;margin-right: 10px">
                    <tr class="hui-table-title">
                        <th width='20%'>文件名</th>
                        <th width='60%'>文件位置</th>
                        <th width='20%'>最后修改时间</th>
                    </tr>
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
