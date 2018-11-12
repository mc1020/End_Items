<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>
<script>
   $(function(){
        $("#oldPassword").passwordbox({
            required:true,
        }),
        $("#newPassword").passwordbox({
            required:true,
            validType:'pwd',
        })
        $("#affirmPassword").passwordbox({
            required:true,
        })
    })
</script>
<div style="text-align:center">
    <form id="updatePwd" method="post">
        <div style="margin:50px 0px 10px 0px">
            旧密码　:<input type="text" id="oldPassword" name="oldPassword" class="easyui-passwordbox"/>
        </div>
        <div style="margin:10px 0px 10px 0px">
            新密码　:<input type="text" id="newPassword" name="newPassword" class="easyui-passwordbox"/>
        </div>
        <div style="margin:10px 0px 10px 0px">
            确认密码:<input type="text" id="affirmPassword" name="affirmPassword" validType="cofirmPwd['#newPassword']" class="easyui-passwordbox"/>
        </div>
    </form>
</div>