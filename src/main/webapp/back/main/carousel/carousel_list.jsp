<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>
<script>
    $(function(){
        $("#carouselDg").datagrid({
            url:'${base_path}/carousel/findAllByPageAndRows',
            onLoadSuccess:btn,
            fitColumns:true,
            pagination:true,
            fit:true,
            toolbar:'#carouseltb',
            pageList:[5,10,20],
            pageSize:5,
            striped:true,
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return "<table><tr><td><img src='${base_path}/picUpload/"+rowData.name+"' width='80' width='80'/></td><td><p>上传日期:"+rowData.create_timeDate+"</p><p>图片类型:"+rowData.type+"</p></td></tr></table>";
            },
                columns:[[
                {field:'ss',checkbox:true},
                {field:'id',title:'id',width:50},
                {field:'title',title:'标题',width:50},
                {field:'name',title:'名字',width:50},
                {field:'url',title:'地址',width:100},
                {field:'modify_timeDate',title:'修改日期',width:100},
                {field:'state',title:'状态',width:40},
                {
                    field: 'options', title: 'options', width: 100, formatter: function (value, row,index) {
                        return  "<a class='del' onclick=deleteOne('"+row.id+"','"+row.name+"')>删除</a>&nbsp;&nbsp;<a class='upd' onclick=\"updateRow('"+row.id+"')\">修改</a>";
                    },
                }
            ]],
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

    })

    /*打开添加对话框*/
    function openAddDialog(){
        $("#addDialog").dialog({
            title:'添加轮播图',
            iconCls:'icon-cmy',
            width: 500,
            height: 350,
            href:'${base_path}/back/main/carousel/add_carousel.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#addForm").form('submit',{
            url:'${base_path}/carousel/picUpload',
            success:function(result){
                var resultObj = $.parseJSON(result);
                if(resultObj.success){
                    $.messager.show({
                        title:'我的消息',
                        msg:'轮播图添加成功!!',
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
        $("#addDialog").dialog('close');
        $("#carouselDg").datagrid('reload');
    }
    },{
            text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                $("#addDialog").dialog('close');
                $("#carouselDg").datagrid('reload');
            }
            }]
        });
    }

    /*删除一行数据*/
    function deleteOne(id,name){
        $.post('${base_path}/carousel/delRow',{id:id,name:name},function(result){
           if(result.success){
               $.messager.show({title:'提示',iconCls:'icon-bell',msg:"轮播图删除成功!!!"});
           }else{
               $.messager.show({title:'提示',iconCls:'icon-bell',msg:result.message});
           }
            $("#carouselDg").datagrid('reload');
        });
    }

    /*更新一行数据*/
    function updateRow(id){
        $("#updateDialog").dialog({
            title:'修改轮播图',
            iconCls:'icon-flag_cn',
            width:400,
            height:300,
            href:'${base_path}/back/main/carousel/update_carousel.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateForm").form('submit',{
                        url:'${base_path}/carousel/updateCarousel',
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
                            $("#updateDialog").dialog('close');
                            $("#carouselDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#updateDialog").dialog('close');
                    $("#carouselDg").datagrid('reload');
                }
            }]
        });
    }

    /*删除多行数据*/
    function delRows(){
        var rows = $("#carouselDg").datagrid('getSelections');
        if(rows.length<=0){
            $.messager.alert('提示','至少选择一行！！！','info');
        }else{
            var ids=[];
            var names=[];
            for(var i=0;i<rows.length;i++){
                ids.push(rows[i].id);
                names.push(rows[i].name);
            }
            $.ajax({
                url:'${base_path}/carousel/delRows',
                data:{id:ids,names:names},
                type:'post',
                traditional:true,
                success:function(result){
                    if(result.success){
                        $.messager.show({title:'提示',iconCls:'icon-bell',msg:"轮播图删除成功!!!"});
                    }else{
                        $.messager.show({title:'提示',iconCls:'icon-bell',msg:result.message});
                    }
                    $("#carouselDg").datagrid('reload');
                }
            });
        }
    }

</script>
<div id="carouseltb">
    <a href="javascript:;" onclick="openAddDialog()" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add',plain:true"></a>
    <a href="javascript:;" onclick="delRows()" class="easyui-linkbutton" data-options="text:'批量删除',iconCls:'icon-remove',plain:true"></a>
</div>


<table id="carouselDg"></table>

<%--添加对话框--%>
<div id="addDialog"></div>

<%--修改对话框--%>
<div id="updateDialog"></div>