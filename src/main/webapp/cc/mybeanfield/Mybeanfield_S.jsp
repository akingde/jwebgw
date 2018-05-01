<%@include file="/WEB-INF/jspf/power/adminUserPower.jspf"%>
<%    if (!pck.checkUserORAdmin("Y101_8_1")) {
        return;
    }
    boolean update, dell;
    update = pck.checkUserORAdmin("Y101_8_2");
    dell = pck.checkUserORAdmin("Y101_8_3");
    String showPower = pck.getStrTool()
            .put(dell, "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' plain='true' onclick='dellBeanField()'>删除</a>")
            .put(update, "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='update()'>修改</a>")
            .getString();
%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<base href="${path_home}/">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>bean字段管理</title>
        <%@include file="/WEB-INF/jspf/easyuiLocal.jspf"%>
        <%@include file="/WEB-INF/jspf/artDialog.jspf"%>
        <%@include file="/WEB-INF/jspf/ztree.jspf"%>
        <%@include file="/WEB-INF/jspf/GG.jspf"%>
        <script type="text/javascript">
            $(function () {
                var zcfl = new ztree_select(
                        "${path_home}/cc/mypackage/s/selectVast.jw", {},
                        "showmypackageTree", "mypackage_name", "mypackage_id", 220, 390);
                zcfl.init(function (treeId, treeNode) {
                    zcfl.setMyValue(treeNode)
                    zcfl.hideMenu(); //$("#" +zcfl.menuContentDIV).fadeOut("fast");
                    $.fn.zTree.getZTreeObj("divID_Tree_bean").reAsyncChildNodes(null,
                            "refresh");
                }, "mypackage_id", "mypackage_pid", "mypackage_name")
                //======================================================================================================                
                //检出包结构  /*               
                var setting0 = {
                    treeId: "mypackage_id",
                    async: {
                        enable: true,
                        type: "post",
                        url: "${path_home}/cc/mypackage/s/selectVast.jw"
                    },
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "mypackage_id",
                            pIdKey: "mypackage_pid",
                            rootPId: "0"
                        },
                        key: {
                            name: "mypackage_name"
                        }
                    },
                    callback: {
                        onClick: function (event, id, treeNode) {//点击部门时，重新加载管理员树。参数为
                            mypackage_id = treeNode.mypackage_id; //动态上传参数
                            $.fn.zTree.getZTreeObj("divID_Tree_bean")
                                    .reAsyncChildNodes(null, "refresh");
                        },
                        onAsyncSuccess: function () {
                            $.fn.zTree.getZTreeObj("divID_Tree_BM").expandAll(true);
                        }
                    }
                };
                $.fn.zTree.init($("#divID_Tree_BM"), setting0);
                //======================================================================================================
                //检出bean
                function ajaxDataFilter(treeId, parentNode, responseData) {
                    if (responseData) {
                        for (var i = 0; i < responseData.length; i++) {
                            responseData[i].bean_mc = responseData[i].bean_bz ? responseData[i].bean_mc
                                    + "(" + responseData[i].bean_bz + ")"
                                    : responseData[i].bean_mc;
                        }
                    }
                    return responseData;
                }
                var setting2 = {
                    treeId: "bean_zj",
                    check: {
                        enable: true
                    },
                    async: {
                        enable: true,
                        type: "post",
                        url: "${path_home}/cc/bean/s2/findHead.jw",
                        otherParam: ["mypackage_id", function () {
                                return $("#mypackage_id").val(); //mypackage_id
                            }],
                        dataFilter: ajaxDataFilter
                    },
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "bean_zj",
                            rootPId: "0"
                        },
                        key: {
                            name: "bean_mc"
                        }
                    },
                    callback: {
                        onClick: function (event, id, treeNode) {
                            var queryParams = $('#dg').datagrid('options').queryParams;
                            queryParams.bean_zj = treeNode.bean_zj;
                            $('#dg').datagrid('reload');
                        }
                    }
                }
                $.fn.zTree.init($("#divID_Tree_bean"), setting2);
                $('#dg').datagrid('hideColumn', 'mybeanfield_zj');

            });
        </script>
    </head>
    <body class="easyui-layout">
        <div data-options="region:'west',split:true,title:'bean'" style="width:250px;padding:10px;">
            <div id="showmypackageTree" style="position: relative; z-index: 1000"></div> <!--<div id="divID_Tree_BM"  class="ztree powertablediv">---</div>-->
            <div id="divID_Tree_bean" class="ztree">bean</div>
        </div>
        <div data-options="region:'center'"  class="easyui-tabs" id='centerMain'>
            <div title="bean明细" selected>
                <table id="dg" class="easyui-datagrid"
                       style="width:100%;height:100%"
                       data-options="rownumbers:true,singleSelect:true,url:'${path_home}/cc/mybean/field/s/selectAllByJson.jw',method:'post',queryParams: {bean_zj:''},autoRowHeight:true,
                       pagination:true,
                       pageSize:50,
                       toolbar:'#tb'
                       ">
                    <thead>
                        <tr>
                            <th data-options="field:'mybeanfield_zj'">ID</th>
                            <th data-options="field:'ck',checkbox:true"></th>
                            <th data-options="field:'c_zyy',width:60"><div>c作用域</div>c_zyy</th>
                            <th data-options="field:'c_lx',width:50"><div>c类型</div>c_lx</th>
                            <th data-options="field:'c_mc',width:120"><div>c属性名</div>c_mc</th>
                            <th data-options="field:'c_setmethod',width:120"><div>c属性的set方法</div>c_setmethod</th>
                            <th data-options="field:'c_getmethod',width:120"><div>c属性的get方法</div>c_getmethod</th>

                            <th data-options="field:'c_bz',width:80"><div>c备注</div>c_bz</th>

                            <th data-options="field:'t_lx',width:40"><div>t类型</div>t_lx</th>
                            <th data-options="field:'t_sy',width:50"><div>t索引</div>t_sy</th>
                            <th data-options="field:'t_yxkong',width:40"><div>是否为空</div>t_yxkong</th>
                            <th data-options="field:'t_cd',width:80"><div>t长度</div>t_cd</th>
                            <th data-options="field:'t_bz',width:40"><div>t备注</div>t_bz</th>

                            <th data-options="field:'v_zzbds',width:250"><div>v正则表达式</div>v_zzbds</th>
                            <th data-options="field:'v_cuowuxx',width:220"><div>v错误信息</div>v_cuowuxx</th>
                            <th data-options="field:'v_bxjiancha',width:40"><div>v必须检查</div>v_bxjiancha</th>

                            <th data-options="field:'h_lx',width:70"><div>h类型</div>h_lx</th>
                            <th data-options="field:'h_jb',width:80"><div>h脚本校验</div>h_jb</th>
                            <th data-options="field:'e_mc',width:110"><div>e展示名</div>e_mc</th>

                            <th data-options="field:'mybeanfield_dateformat',width:150"><div>Date格式</div>mybeanfield_dateformat</th>
                        </tr>
                    </thead>
                </table>
                <div id="tb" style="padding:2px 5px;">
                    <!--                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="dellBeanField()">删除</a>
                                        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update()">修改</a>-->
                    <%=showPower%>
                    <script>
                        function dellBeanField() {
                            var rows = $('#dg').datagrid('getSelections');
                            if (!rows[0]) {
                                $.messager.alert('Info', '请选择行');
                                return;
                            }
                            $.messager.confirm('删除操作', '请确认是否执行删除操作', function (r) {
                                if (r) {
                                    var ids = "";
                                    for (var i = 0; i < rows.length; i++) {
                                        ids = ids + "," + rows[i]['mybeanfield_zj']
                                    }
                                    if (easyuipost('${path_home}/cc/mybean/field/d/dell.jw', {ids: ids.substring(1)})) {
                                        $('#dg').datagrid('reload');
                                    }
                                }
                            });
                        }
                        function update() {
                            var row = $('#dg').datagrid('getSelected');
                            if (!row) {
                                $.messager.alert('Info', '请选择行');
                                return;
                            }
                            addPanel('修改' + row.c_mc + '(' + row.c_bz + ')', row.mybeanfield_zj);
                        }
                        function addPanel(title, mybeanfield_zj) {
                            $('#centerMain').tabs('add', {
                                title: title
                                , content: '<iframe width="100%" height="100%" src="${path_home}/cc/mybean/field/u/update/select.jw?selectUpdateID=' + mybeanfield_zj + '"></iframe>'
//                                ,href: '${path_home}/cc/mybean/field/u/update/select.jw?selectUpdateID=' + mybeanfield_zj
                                , closable: true
                            });
                        }
                    </script>
                    <select onchange="$('#dg').datagrid({singleSelect: (this.value == 0)})">
                        <option value="0">单行选择</option>
                        <option value="1">多行选择</option>
                    </select>
                </div>

            </div>
        </div>
    </body>
</body>
</html>
