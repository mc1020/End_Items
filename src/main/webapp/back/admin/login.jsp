<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="request" value="${pageContext.request.contextPath}" var="base_path"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>持名法州后台管理中心</title>
			
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
	<link rel="icon" href="${base_path}/back/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${base_path}/back/css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="${base_path}/back/css/login.css" type="text/css"></link>
	<script type="text/javascript" src="${base_path}/back/script/jquery.js"></script>
	<script type="text/javascript" src="${base_path}/back/script/common.js"></script>

    <%--easyui--%>
    <link rel="stylesheet" type="text/css" href="${base_path}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base_path}/easyui/themes/icon.css">
    <script type="text/javascript" src="${base_path}/easyui/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base_path}/easyui/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base_path}/easyui/js/form.validator.rules.js"></script>

	<script type="text/javascript">
		$(function(){
            //点击更换验证码：
            $("#captchaImage").click(function(){//点击更换验证码
                $("#captchaImage").prop("src","${base_path}/Code/code?id="+Math.random());
            });
			/*点击时清空文本框里的内容*/
			$(".text").click(function(){
			    var val = $(this).val("");
            });

        });
	</script>
</head>
<body>
		<div class="login">
			<form id="loginForm" method="post" action="${base_path}/admin/login" >
				<table>
					<tbody>
						<tr>
							<td width="190" rowspan="2" align="center" valign="bottom">
								<img src="${base_path}/back/img/header_logo.gif" />
							</td>
							<th>
								用户名:
							</th>
							<td>
								<input type="text"  name="account" class="text" value="请输入账号" maxlength="20"/>
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input type="password" name="password" class="text" value="xxx" maxlength="20" autocomplete="off"/>
							</td>
					  </tr>
					
						<tr>
							<td>&nbsp;</td>
							<th>验证码:</th>
							<td>
								<input type="text" id="enCode" name="enCode" class="text captcha" maxlength="4" autocomplete="off"/>
								<img id="captchaImage" class="captchaImage" src="${base_path}/Code/code" title="点击更换验证码"/>
							</td>
						</tr>					
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='/'"><input type="submit" class="loginButton" value="登录">
						</td>
					</tr>
				</tbody></table>
				<div class="powered">COPYRIGHT © 2008-2017.</div>
				<div class="link">
					<a href="http://www.chimingfowang.com/">持名佛网首页</a> |
					<a href="http://www.chimingbbs.com/">交流论坛</a> |
					<a href="">关于我们</a> |
					<a href="">联系我们</a> |
					<a href="">授权查询</a>
				</div>
			</form>
		</div>
</body>
</html>