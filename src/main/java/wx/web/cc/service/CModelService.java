/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wx.web.cc.service;

import configuration.DBO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import wx.web.cc.bean.CModel;
import wx.web.cc.service.svo.BeanInfoSVO;

/**
 *
 * @author adm.wangchunzi
 */
public final class CModelService {

    public static Map<String, String> getCModelAnd_McMapZj() {
        List<CModel> clist = DBO.service.S.select(CModel.class);
        Map<String, String> map = new HashMap();
        for (CModel obj : clist) {
            map.put(obj.getCmodel_mc(), obj.getCmodel_zj());
        }
        return map;
    }

    public static String getEngineData(String modelID, String bean_id) {
        CModel cobj=DBO.service.S.selectOneByID(CModel.class, modelID);
        if(null==cobj||null==cobj.getCmodel_zj()){
            return "";
        }
        BeanInfoSVO bi = new BeanInfoSVO(bean_id);
        Map<String,String> map=new HashMap<>();
        return bi.getEngineData_Online(cobj.getCmodel_nr(),map);
    }

    public static CModel selectOne(String id) {
        return DBO.service.S.selectOneByID(CModel.class, id);
    }

    public static List<CModel> selectAll() {
        return DBO.service.S.select(CModel.class);
    }

    public static Map<String, String> toMapDataZJ_NR(List<CModel> list) {
        Map<String, String> map = new HashMap();
        for (CModel obj : list) {
            map.put(obj.getCmodel_zj(), obj.getCmodel_nr());
        }
        return map;
    }
}
