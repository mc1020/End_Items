<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>
<script>
    $(function(){
        $("#specialContext").form('load','${base_path}/special/queryOne?id=${param.id}');
    })
</script>

<div style="text-align:center;margin-top:30px;">
    <form id="specialContext" method="post">
        专辑头像:　<input id="pic" style="border:none;" name="pic" type="text"/><br/>
        专辑名称:　<input id="name" style="border:none;" name="name" type="text"/><br/>
        作　　者:　<input id="author" style="border:none;" name="author" type="text"/><br/>
        播　　音:　<input id="broadcast" style="border:none;" name="broadcast" type="text"/><br/>
        集　　数:　<input id="collect_number" style="border:none;" name="collect_number" type="text"/><br/>
        发布日期:　<input id="issue_date" style="border:none;" name="issue_date" type="text"/><br/>
        状　　态:　<input id="state" style="border:none;" name="state" type="text"/><br/>
        <textarea style="width:190px;height:80px;border:1px solid blur;" name="content_synopsis"></textarea><br/>
    </form>
</div>