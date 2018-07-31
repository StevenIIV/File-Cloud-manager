<%@ page import="com.springmvc.model.User" %>
<%@ page import="org.springframework.ui.ModelMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.UtilTools" %><%--
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
    <title>云端文件</title>
</head>
<body class="easyui-layout">
<%
    List list= (List) session.getAttribute("cloudList");
%>
<jsp:include page="mainHeader.jsp">
    <jsp:param name="username" value="${user.username}"></jsp:param>
</jsp:include>
    <div data-options="region:'center'">
        <div class="refresh" style="height: 100%">
            <table id="sample2" class="hui-list-table" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr class="hui-table-title">
                    <th style="width: 50%;">
                        <input type="checkbox" class="hui-checkbox checkbox" id="allChecked" name="allChecked"/>
                        名称
                        <span class="rankImg"><img class="hui-icon-down" src="${pageContext.request.contextPath}/img/down.png" /></span>
                    </th>
                    <th style="width: 20%;">大小</th>
                    <th style="width: 30%;">最后修改时间</th>
                </tr>
                <tbody id="tbody">
                <%
                    for(int i=0;i<list.size();i++){
                        String filename=((String[]) list.get(i))[0];
                        String attribute=((String[]) list.get(i))[1];
                %>
                <tr>
                    <td>
                        <input type="checkbox" class="hui-checkbox checkbox" name="checked" />
                        <div class="hui-content">
                            <img class="hui-file-type" src="${pageContext.request.contextPath}/filetype/<%=UtilTools.checkImage(filename)%>" />
                            <div class="hui-popup">
                                <input type="text" class="hui-rename" />
                                <button class="hui-btn btn-sure"><img src="${pageContext.request.contextPath}/img/success.png" /></button>
                                <button class="hui-btn btn-cancel"><img src="${pageContext.request.contextPath}/img/close.png" /></button>
                            </div>
                            <p class="hui-ellipsis check"><span class="fileName">&nbsp; <%=filename%></span></p>
                            <div class="hui-table-operate">
                                <a href="/web/download/<%=i%>">下载</a>
                                <a href="###">发送</a>
                                <a href="###" class="more">更多</a>
                                <ul class="hui-moreBox">
                                    <li class="btn-delete">删除</li>
                                    <li class="btn-rename">重命名</li>
                                </ul>
                            </div>
                        </div>
                    </td>
                    <%
                        int siz= Integer.parseInt(attribute.split(" ")[3]);
                        String res="null";
                        if(siz>1024&&siz<1024*1024){
                            siz= (int) Math.ceil((double)siz/1024.0);
                            res=String.valueOf(siz)+"KB";
                        }
                        else if(siz>=1024*1024){
                            siz= (int) Math.ceil((double)siz/(1024.0*1024.0));
                            res=String.valueOf(siz)+"MB";
                        }
                    %>
                    <td class="check"><%=res%></td>
                    <td class="check"><%=attribute.substring(attribute.length()-28)%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div id="sample1" class="hui-img-table">
                <div class="allChecked">
                    <input type="checkbox" class="checkbox" id="imgAllChecked" name="imgAllChecked"/>
                    <span>全选</span>
                    <span class="rankImg">
              <img src="${pageContext.request.contextPath}/img/down.png" />
            </span>
                </div>
                <ul class="listBox">
                    <li class="listBox-item">
                        <div class="listWrap">
                            <img src="${pageContext.request.contextPath}/filetype/barcode_result_page_type_apk_icon.png" class="filetype" />
                            <input type="checkbox" class="list-checkbox" name="selected" />
                        </div>
                        <div class="listTitle">新建文件夹</div>
                        <div class="popup">
                            <input type="text" class="rename" />
                            <button class="hui-btn btn-sure"><img src="${pageContext.request.contextPath}/img/success.png" /></button>
                            <button class="hui-btn btn-cancel"><img src="${pageContext.request.contextPath}/img/close.png" /></button>
                        </div>
                    </li>
                    <li class="listBox-item">
                        <div class="listWrap">
                            <img src="${pageContext.request.contextPath}/filetype/barcode_result_page_type_apk_icon.png" class="filetype" />
                            <input type="checkbox" class="list-checkbox" name="selected" />
                        </div>
                        <div class="listTitle">新建文件夹</div>
                        <div class="popup">
                            <input type="text" class="rename" />
                            <button class="hui-btn btn-sure"><img src="${pageContext.request.contextPath}/img/success.png" /></button>
                            <button class="hui-btn btn-cancel"><img src="${pageContext.request.contextPath}/img/close.png" /></button>
                        </div>
                    </li>
                    <li class="listBox-item">
                        <div class="listWrap">
                            <img src="${pageContext.request.contextPath}/filetype/barcode_result_page_type_apk_icon.png" class="filetype" />
                            <input type="checkbox" class="list-checkbox" name="selected" />
                        </div>
                        <div class="listTitle">新建文件夹</div>
                        <div class="popup">
                            <input type="text" class="rename" />
                            <button class="hui-btn btn-sure"><img src="${pageContext.request.contextPath}/img/success.png" /></button>
                            <button class="hui-btn btn-cancel"><img src="${pageContext.request.contextPath}/img/close.png" /></button>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="rightKey">
                <ul>
                    <li class="downLoad">下载</li>
                    <li class="send">发送</li>
                    <li class="rightKeyRename">重命名</li>
                    <li class="rightKeyDelete">删除</li>
                </ul>
            </div>
        </div>
    </div>
<%@include file="mainNavigation.jsp"%>
<%@include file="mainFooter.jsp"%>
</body>
</html>
