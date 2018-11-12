<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="base_path" value="${pageContext.request.contextPath}"/>
<script>
    $(function(){
        $("#guruDg").edatagrid({
            url:'${base_path}/guru/findAllByPageAndRows',
            saveUrl:'${base_path}/guru/addRow',
            updateUrl:'${base_path}/guru/editRow',
            destroyUrl:'${base_path}/guru/deleteRow',
            striped:true,
            pagination:true,
            toolbar: '#gurutb',
            checkOnSelect:false,
            singleSelect:false,
            destroyMsg:{
                norecord:{    // 在没有记录选择的时候执行
                    title:'Warning',
                    msg:'No record is selected.'
                },
                confirm:{       // 在选择一行的时候执行		title:'Confirm',
                    msg:'Are you sure you want to delete?'
                }
            },
            fit:true,
            fitColumns:true,
            /*设置为true时，在点击表格外部的时候自动保存编辑的行*/
            autoSave:true,
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return "<table><tr><td><img src='${base_path}/guru_pic/"+rowData.picture+"' width='80' width='80'/></td><td><a href='#' onclick=\"picupload('"+rowData.id+"')\">上传头像</a></td></tr></table>";
            },
        })
    });

    function addRow(){
        $('#guruDg').edatagrid('addRow');
    }

    function removeRows(){
        $('#guruDg').edatagrid('destroyRow');
    }

    function picupload(id){
        $("#pic_upload").dialog({
            title:'头像上传',
            width:300,
            height:220,
            iconCls:'icon-20130406125647919_easyicon_net_16',
            href:'${base_path}/back/main/guru/pic_upload.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#picForm").form('submit',{
                        url:'${base_path}/guru/headPicUpload',
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
                            $("#pic_upload").dialog('close');
                            $("#guruDg").datagrid('reload');
                        }
                    });

                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#pic_upload").dialog('close');
                    $("#guruDg").datagrid('reload');
                }
            }],
        });
    }
</script>
<table id="guruDg" title="上师详情">
    <thead>
    <tr>
        <th field="ss" data-options="checkbox:true"></th>
        <th field="picture" width="50" align="left" editor="{type:'textbox',options:{precision:1}}">头像</th>
        <th field="name" width="100" editor="text">姓名</th>
        <th field="sex" width="100" align="left" editor="textbox">性别</th>
        <th field="state" width="50" editor="{type:'checkbox',options:{on:'true',off:'false'}}">状态</th>
    </tr>
    </thead>
</table>
<%--工具栏--%>
<div id="gurutb">
    <a href="javascript:;" onclick="addRow()" class="easyui-linkbutton" data-options="text:'添加',iconCls:'icon-add',plain:true"></a>
    <a href="#" class="easyui-linkbutton" onclick="removeRows()" data-options="text:'删除',iconCls:'icon-remove',plain:true"></a>
</div>

<div id="pic_upload">

</div>




