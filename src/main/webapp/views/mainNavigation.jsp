<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/7/10
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    window.onload=function () {
        $( "#accordion" ).accordion({
            collapsible: false
        });
        var a=${page};
        if(a==1){
            $("#accordion").accordion("select","账户管理");
        }
        if(a==2){
            $("#accordion").accordion("select","本地文件管理");
        }
        if(a==3){
            $("#accordion").accordion("select","云端文件管理");
        }
    }
</script>
<div region="west" style="width: 200px" title="功能菜单" split="true">
    <div id="accordion" class="easyui-accordion" data-options="fit:true,border:false,selected:false">
        <div id="first" title="账户管理" data-options="iconCls:'icon-ok'" style="padding: 10px"  >
            <a href="/web/userInfo" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width: 150px">个人信息</a>
            <a href="/web/resetPassword" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width: 150px">密码重置</a>
        </div>

        <div id="second" title="本地文件管理" data-options="iconCls:'icon-mini-add'" style="padding: 10px" >
            <a href="/web/fileSearch" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" style="width: 150px;">文件搜索</a>
            <a href="/web/fileClassification" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" style="width: 150px;">文件分类</a>
        </div>

        <div id="third" title="云端文件管理" data-options="iconCls:'icon-tip'" style="padding: 10px">
            <a href="/web/showCloud" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tip'" style="width: 150px;">云端文件</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tip'" style="width: 150px;">云端上传</a>
        </div>
    </div>
</div>

