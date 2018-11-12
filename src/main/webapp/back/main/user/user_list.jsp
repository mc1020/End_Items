<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>

<script>
    $("#userDg").edatagrid({
        url:'${base_path}/user/findAllByPageAndRows',
        updateUrl:'${base_path}/user/updateStatus',
        destroyUrl:'${base_path}/user/delOne',
        pagination:true,
        fit:true,
        pageSize:10,
        remoteSort:false,
        fitColumns:true,
        toolbar:'#usertb',
        autoSave:true,
        onLoadSuccess:btn,
        striped:true,
        view: detailview,
        detailFormatter: function(rowIndex, rowData) {
            return "<table><tr><td><img src='${base_path}/user_pic/"+rowData.picture+"' width='80' height='80'/></td><td><p>上师编号 :"+rowData.g_id+"</p><p>创建时间 :"+rowData.create_date+"</p><p>签名 :"+rowData.signature+"</p></td></tr></table>";
        },
    });

    /*操作按钮*/
    function btn(){
        $(".del").linkbutton({
            iconCls:'icon-remove',
            plain:true,
        });
    }

    /*删除一行数据*/
    function removeRows(){
        $('#userDg').edatagrid('destroyRow');
    }

    /*注册用户*/
    function addUser(){
        $("#insertUser").dialog({
            width:500,
            height:380,
            iconCls:'icon-man',
            title:'用户注册',
            href:'${base_path}/back/main/user/add_user.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#addUserForm").form('submit',{
                        url:'${base_path}/user/save',
                        success:function(result){
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({
                                    title:'我的消息',
                                    msg:'用户添加成功!!',
                                    iconCls:'icon-bell',
                                    timeout:5000,
                                    showType:'slide'
                                });
                            }else{
                                $.messager.show({
                                    title:'我的消息',
                                    msg:resultObj.message,
                                    iconCls:'icon-bell_error',
                                    timeout:5000,
                                    showType:'slide'
                                });
                            }
                        }
                    });
                    $("#insertUser").dialog('close');
                    $("#userDg").datagrid('reload');
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#insertUser").dialog('close');
                    $("#userDg").datagrid('reload');
                }
            }],

        })
    }

</script>

<table id="userDg"
       singleSelect="true">
    <thead>
    <tr>
        <th field="ss" data-options="checkbox:true"></th>
        <th field="id" width="100">Item ID</th>
        <th field="username" width="100">用户名</th>
        <th field="picture" width="100" align="right">头像路径</th>
        <th field="dharma_name" width="100" align="right">法号</th>
        <th field="realname" width="150">真实姓名</th>
        <th field="city" width="150">所在城市</th>
        <th field="sex" width="150">性别</th>
        <th field="status" width="150" editor="{type:'checkbox',options:{on:'true',off:'false'}}">状态<span style="color:green;">(可编辑)</span></th>
    </tr>
    </thead>
</table>

<%--工具栏--%>
<div id="usertb">
    <a href="#" class="easyui-linkbutton" onclick="removeRows()" data-options="text:'删除',iconCls:'icon-remove',plain:true"></a>
    <a href="#" class="easyui-linkbutton" onclick="addUser()" data-options="text:'注册',iconCls:'icon-add',plain:true"></a>
</div>

<div id="insertUser"></div>


