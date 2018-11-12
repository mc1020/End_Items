<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>


<div style="text-align:center;">
    <form id="addForm" enctype="multipart/form-data" method="post">
        <div style="margin-top:50px;">上传图片:<input type="text" id="file" name="file" class="easyui-filebox" data-options="buttonText:'选择'"/></div>
        <div style="margin-top:10px;">标　　题:<input type="text" name="title" class="easyui-textbox"/></div>
        <div style="margin-top:10px;">地　　址:<input type="text" name="url" class="easyui-textbox"/></div>
        <div style="margin-left:-125px;margin-top:10px;">是否展示:<input name="state" type="checkbox"/></div>
    </form>
</div>