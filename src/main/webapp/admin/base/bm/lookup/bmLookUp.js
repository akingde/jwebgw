
function f_dcBaseBM(showNameID, hiddeValueID, inputWidth, f_afterGetValue) {
    var cb = $("#" + showNameID).ligerComboBox({
        onBeforeOpen: f_selectContact, valueFieldID: hiddeValueID, width: inputWidth
    });
    return cb;

    function f_selectContact() {
        $.ligerDialog.open({
            title: '分类'
            , name: 'winselector'
            , width: 675
            , height: 400
            , url:path_home+ 'admin/base/bm/lookup/bmLookUp.jsp'
            , valueField: hiddeValueID
            , textField: showNameID
            , buttons: [
                {text: '确定', onclick: f_selectContactOK},
                {text: '取消', onclick: f_selectContactCancel}
            ]});
        return false;
    }
    function f_selectContactOK(item, dialog) {
        var fn = dialog.frame.f_select || dialog.frame.window.f_select;
        var data = fn();
        if (!data) {
            msg_tip("操作失误", "请选择行", 400,200);
            return;
        }
        $("#" + showNameID).val(data.bm_name);
        $("#" + hiddeValueID).val(data.bm_id);
        dialog.close();
        f_afterGetValue();
    }
    function f_selectContactCancel(item, dialog) {
        dialog.close();
    }
}


