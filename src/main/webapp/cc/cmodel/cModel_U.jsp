<!--%@include file="/WEB-INF/jspf/power/userPower.jspf"%-->
<%
    //    if (!pck.checkUser("J31")) {
    //        return;
    //    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--后台UI组件Start-->
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <script src="${path_home}/lib/jquery/jquery-1.11.1.js"
        type="text/javascript"></script>
        <%@include file="/WEB-INF/jspf/GG.jspf"%>
        <%@include file="/WEB-INF/jspf/artDialog.jspf"%>

        <script type="text/javascript">
            $(function () {
                var zcfl = new ztree_select(
                        "${path_home}/cc/cmodel/cmodelfl/s/selectVast.jw", {},
                        "showmycmodelflTree", "cmodelfl_name", "cmodelfl_id", 320, 390);
                zcfl.init(function (treeId, treeNode) {
                    zcfl.setMyValue(treeNode)
                    zcfl.hideMenu();
                    var queryParams = $('#dg').datagrid('options').queryParams;
                    queryParams.flzj = treeNode.cmodelfl_id;
                    $('#dg').datagrid('reload');
                }, "cmodelfl_id", "cmodelfl_pid", "cmodelfl_name", "${obj.cmodelfl_name}", '${obj.cmodelfl_id}')
            })
            
            function postCModelFormData(btid) {
                var data = {};
                data.cmodel_zj = $('#cmodel_zj').val()
                data.cmodel_mc = toFormatZT($('#cmodel_mc').val())
                data.cmodel_nr = toFormatZT($('#cmodel_nr').val())
//                data.cmodel_mc = $('#cmodel_mc').val()//模型名
//                data.cmodel_nr = $('#cmodel_nr').val()//模型内容
                data.cmodelfl_id = $('#cmodelfl_id').val()//外键分类
                data.cmodelfl_name = $('#cmodelfl_name').val()//分类名
                mypost('cc/cmodel/u/update.jw', data, btid);
            }
        </script>
    </head>
    <body>
        <input type="hidden" name="cmodel_zj" id="cmodel_zj" value="${obj.cmodel_zj}"/>
        <table class="table" id="table1">
            <tr>
                <td>归类</td>
                <td><div id="showmycmodelflTree" style="position: relative; z-index: 1000"></div></td>
            </tr>
            <tr>
                <td>模板名</td>
                <td><input type="text" name="cmodel_mc" id="cmodel_mc" value="${obj.cmodel_mc}"/></td>
            </tr>
            <tr>
                <td>模板内容</td>
                <td><textarea id="cmodel_nr"
                              style="width: 800px; height: 500px;">${obj.cmodel_nr}</textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="text-align: center">
                        <input type="button" value="提交" id="myMybeanButton" onclick="postCModelFormData('myMybeanButton')">
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
