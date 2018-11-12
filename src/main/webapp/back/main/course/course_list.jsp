<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>
<script>
    $(function(){
        $("#courseDg").datagrid({
            url:'${base_path}/course/queryAllByPageAndRows',
            fit:true,
            onLoadSuccess:btn,
            fitColumns:true,
            pagination:true,
            toolbar:'#coursetb',
            singleSelect:'true',
            columns:[[
                {field:'id',title:'id',width:80},
                {field:'name',title:'课程名称',width:80,},
                {field:'create_date',title:'创建时间',sortable:true,width:100,},
                {field:'status',title:'状态',width:80,formatter: function (value, row,index) {
                        if(row.status=='1') {
                            return "<span style='color:red;'>必修</span>";
                        }
                    },
                },
                {
                    field: 'options', title: 'options', width: 100, formatter: function (value, row,index) {
                        if(row.status=='1') {
                            return "<a class='del' onclick=deleteOne('" + row.id + "')>删除</a>&nbsp;&nbsp;<a class='upd' onclick=\"updateRow('" + row.id + "')\">修改</a>";
                        }
                    },
                },
            ]],
        })
    });

    /*操作按钮*/
    function btn(){
        $(".del").linkbutton({
            iconCls:'icon-decline',
            plain:true,
        });
        $(".upd").linkbutton({
            iconCls:'icon-edit',
            plain:true,
        });
    }

    function addRow(){
        $("#addCourse").dialog({
            title:'添加课程',
            iconCls:'icon-cmy',
            width: 400,
            height: 200,
            href:'${base_path}/back/main/course/add_course.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#addCourseForm").form('submit',{
                        url:'${base_path}/course/insert',
                        success:function(result){
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({
                                    title:'我的消息',
                                    msg:'课程添加成功!!',
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
                    $("#addCourse").dialog('close');
                    $("#courseDg").datagrid('reload');
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#addCourse").dialog('close');
                    $("#courseDg").datagrid('reload');
                }
            }]
        });
    }

    /*删除一行数据*/
    function deleteOne(id){
        $.post('${base_path}/course/deleteRow',{id:id},function(result){
            if(result.success){
                $.messager.show({title:'提示',iconCls:'icon-bell',msg:"课程删除成功!!!"});
            }else{
                $.messager.show({title:'提示',iconCls:'icon-bell',msg:result.message});
            }
            $("#courseDg").datagrid('reload');
        });
    }

    /*更新一行数据*/
    function updateRow(id){
        $("#editCourse").dialog({
            title:'修改课程',
            iconCls:'icon-flag_cn',
            width:400,
            height:200,
            href:'${base_path}/back/main/course/edit_course.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#editCourseForm").form('submit',{
                        url:'${base_path}/course/update',
                        success:function(result){
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                $.messager.show({
                                    title:'我的消息',
                                    msg:'修改成功!!',
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
                            $("#editCourse").dialog('close');
                            $("#courseDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#editCourse").dialog('close');
                    $("#courseDg").datagrid('reload');
                }
            }]
        });
    }

</script>

<table id="courseDg" title="功课详情"></table>
<%--工具栏--%>
<div id="coursetb">
    <a href="javascript:;" onclick="addRow()" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add',plain:true"></a>
    <%--<a href="#" class="easyui-linkbutton" onclick="removeRows()" data-options="text:'删除',iconCls:'icon-remove',plain:true"></a>--%>
</div>

<div id="addCourse"></div>

<div id="editCourse"></div>





