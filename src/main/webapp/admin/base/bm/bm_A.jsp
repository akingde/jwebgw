 <%@include file="/WEB-INF/jspf/power/adminUserPower.jspf"%>
<%
    if(!pck.checkUserORAdmin("J51"))return;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--后台UI组件Start-->
<%@include file="/WEB-INF/jspf/admin-ui.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <!--后台UI组件End-->
        <script src="admin/base/bm/lookup/bmLookUp.js" type="text/javascript"></script>
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css" />
        <script src="lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/jquery.form.js" type="text/javascript"></script>
        <script type="text/javascript">
            $().ready(
                    function () {
                        var cb = f_dcBaseBM("bm_pid2", "bm_pid", 200, 400, 100);
                        cb.setValue("0");
                        cb.setText("顶级");
                        
                        // 绑定FORM提交事件
                        $('#bm_formID')
                                .submit(
                                        function () {
                                            $btn = $("#myButton").button(
                                                    'loading');
                                            $(this).ajaxSubmit(
                                                            {dataType: "json",
                                                                url: "${path_home}/base/bm/add.jw",
                                                                success: function (
                                                                        result) {
                                                                    if (result.statusCode == 99) {
                                                                        var msg = "";
                                                                        //                    alert(JSON.stringify(result.msg[0].value));
                                                                        for (var i in result.msg) {
                                                                            msg = msg
                                                                                    + result.msg[i]
                                                                                    + "\n";
                                                                        }
                                                                        alert(msg);
                                                                    } else if (result.statusCode == 0
                                                                            || result.statusCode == 1
                                                                            || result.statusCode == -1) {
                                                                        alert(result.msg);
                                                                    }
                                                                }
                                                            });
                                            setTimeout(function () {
                                                $btn.button('reset');
                                            }, 1100);
                                            return false;
                                        });
                    });
        </script>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">添加</h3>
                    </div>
                    <div id="bm_divID" class="panel-body">
                        <form id="bm_formID" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="bm_pid2">上级分类</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="bm_pid2"
                                           id="bm_pid2" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="bm_name">系列名称(50字内)</label>
                                <div class="col-sm-5">
                                    <input type="text" name="bm_name" id="bm_name"
                                           maxlength="50" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9 col-sm-offset-4">
                                    <button type="submit" id="myButton" data-loading-text="执行中"
                                            class="btn btn-primary" autocomplete="off">添加</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
