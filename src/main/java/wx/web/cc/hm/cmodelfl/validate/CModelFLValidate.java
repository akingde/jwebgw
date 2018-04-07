package wx.web.cc.hm.cmodelfl.validate;

import java.util.Map;
import system.web.JWeb;
import system.web.validate.model.ValidateFieldModel;
import system.web.validate.model.ValidateModel;
import system.web.validate.model.ValidateResultModel;

public class CModelFLValidate extends ValidateModel {
     public CModelFLValidate() {
        super(JSON_MODEL);
    }

    @Override
    public void iniValidate() {

        super.put("cmodelfl_id", "[0-9]{24}", "", false)
                .put("cmodelfl_pid", "[0-9]{24}|[0]{1}", "父键不正常", false)
                .put("cmodelfl_name", "[\\w\\W]{1,50}", "名称不正常", true);    }

    @Override
    public ValidateResultModel recheck(JWeb jw, Map<String, ValidateFieldModel> map, ValidateResultModel vr) {
        return vr;
    }
}