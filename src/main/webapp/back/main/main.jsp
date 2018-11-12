<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="request" value="${pageContext.request.contextPath}" var="base_path"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
<link rel="stylesheet" type="text/css" href="${base_path}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${base_path}/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${base_path}/easyui/themes/IconExtension.css">
<script type="text/javascript" src="${base_path}/easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/form.validator.rules.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/datagrid-detailview.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/jquery.edatagrid.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/datagrid-cellediting.js"></script>
<script type="text/javascript" src="${base_path}/easyui/js/jquery.etree.js"></script>


<script type="text/javascript">
	$(function(){
	    $.post("${base_path}/menu/findAll",function(data){
	        $.each(data,function(idx,menu){
	            var content="<div style='text-align:center;margin:5px 0px;'>";
	            /*遍历二级类别*/
                $.each(menu.menus,function(idx,child){
                    content+="<a class='easyui-linkbutton' style=\"width:95%;border:1px solid #0ad\" onclick=\"addTab('"+child.name+"','"+child.iconCls+"','"+child.url+"')\" data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a></br>";
                });
                content+="</div>";
	            /*遍历一级类别*/
                $("#aa").accordion('add',{
                    title:menu.name,
                    iconCls:menu.iconCls,
                    content:content,
                });
            })
        });
	    $("#aa").accordion({
            fit:true,
        });
    });

	/*添加选项卡*/
    function addTab(title,icon,url){
        var exists = $("#tabs").tabs('exists',title);
        if(!exists){
            $("#tabs").tabs('add',{
                title:title,
                iconCls:icon,
                closable:true,
                href:'${base_path}/back/main/'+url,
            });
        }else{
            $("#tabs").tabs('select',title);
        }
    }

    //退出系统
    function quit(){
        location.href='${base_path}/admin/quit';
    };

    /*修改密码*/
    function updatepwd(){
        $("#updatePassword").dialog({
            title:'修改密码',
            iconCls:'icon-cup_key',
            width:400,
            height:300,
            href:'${base_path}/back/main/updatePassword.jsp',
            buttons:[
                {
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                        $("#updatePwd").form('submit',{
                            novalidate:true,
                            url:'${base_path}/admin/updatePassword',
                            success:function(result){
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    location.href="${base_path}/back/admin/login.jsp";
                                }else{
                                    $.messager.show({title:'提示',iconCls:'icon-bell',msg:resultObj.message});
                                }
                            }
                        });
                        $("#updatePassword").dialog('close');
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#updatePassword").dialog('close');
                    }
                }
            ],
        });
    }
</script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.login_admin.name} &nbsp;<a href="#" onclick="updatepwd()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" onclick="quit()" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(${base_path}/back/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>

    <%--修改密码对话框--%>
    <div id="updatePassword"></div>
</body> 
</html>