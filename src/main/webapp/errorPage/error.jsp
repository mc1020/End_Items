<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="request" value="${pageContext.request.contextPath}" var="base_path"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h2 style="text-align:center">驰名法州</h2>
    <c:if test="${requestScope.msg==null}">
        <p>你访问的页面出错了,请稍后重试!!!!!!!!!!!!</p>
    </c:if>
    <c:if test="${requestScope.msg!=null}">
        <p>${requestScope.msg}</p>
    </c:if>
</body>
</html>