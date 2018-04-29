package wx.web.cc.hm.model;

import configuration.DBO;
import java.util.List;
import plugins.easyui.EasyuiService;
import plugins.easyui.vo.EasyuiPage;
import system.web.JWeb;
import system.base.annotation.H;
import system.base.annotation.M;
import system.base.beanjson.JCJSON;
import system.web.power.ann.SQ;
import wx.web.cc.bean.MyModel;

@SQ("Y101_10_1")
@H("cc/mybean/modal/s")
public class MyModelSelect {

    @M("/selectOne")
    public static void selectOne(JWeb jw) {
        String mymodel_zj = jw.getString("mymodel_zj");
        if (null == mymodel_zj || mymodel_zj.isEmpty()) {
            jw.printOne("{}");
            return;
        }
        MyModel obj = DBO.service.S.selectOneByID(MyModel.class, mymodel_zj);
        System.out.println(obj.getMymodel_nr());
        obj.setMymodel_nr(obj.getMymodel_nr().replace("'", "&#39;").replace("\r", "&#39;n"));
        jw.printOne(JCJSON.toSimpleJSON(obj));
    }

    @M("/selectOne2")
    public static void selectOne2(JWeb jw) {
        String mymodel_zj = jw.getString("mymodel_zj");
        if (null == mymodel_zj || mymodel_zj.isEmpty()) {
            jw.printOne("{}");
            return;
        }
        MyModel obj = DBO.service.S.selectOneByID(MyModel.class, mymodel_zj);
        obj.setMymodel_nr(obj.getMymodel_nr().replace("'", "&#39;").replace("\r", "&#39;n"));
        jw.printOne(obj.getMymodel_nr());
    }
    @M("/selectAllByJson")
    public static void selectJSON(JWeb jw) {
        String mybean_zj = jw.getString("mybean_zj");
        if (null == mybean_zj || mybean_zj.isEmpty()) {
            jw.printOne("[]");
            return;
        }
        String where = "WHERE mybean_zj='" + mybean_zj + "'";
        EasyuiPage page = EasyuiService.getPage(jw);

        List<MyModel> list = null == jw.getString("page") ? DBO.service.S.selectByCondition(MyModel.class, where) : DBO.service.S.selectVastByCondition(MyModel.class, page.page, page.rows, where);
        for (MyModel obj : list) {
            obj.setMymodel_nr("");
        }
        jw.printOne(EasyuiService.formatGrid(list, DBO.service.S.selectCountByCondition(MyModel.class, where)));
    }

//    @M("/base/selectVast") // cc/mybean/modal/s/selectVast.jw
//    public static void select(JWeb jw) {
//        String mybean_zj = jw.getString("mybean_zj");
//        if (null == mybean_zj || mybean_zj.isEmpty()) {
//            jw.printOne("[]");
//            return;
//        }
//        Mybean bean = DBO.service.S.selectOneByID(Mybean.class, mybean_zj);
//        if (null == bean.getMybean_zj()) {
//            jw.printOne("[]");
//            return;
//        }
//
//        String sort = jw.getString("sort", "bean");
//        String where = "WHERE mybean_zj='" + mybean_zj + "'";
//        List<Mybeanfield> listBF = DBO.service.S.selectByCondition(Mybeanfield.class, where);
//        switch (sort) {
//            case "bean": {
//                jw.printOne(MybeanService.toBeanData(listBF, bean.getMybean_mc()));
//                return;
//            }
//            case "sql": {
//                jw.printOne(MybeanService.toSQLData(listBF, bean.getMybean_mc()));
//                return;
//            }
//            case "jsgetset": {
//                String js = MybeanService.toJSGet(listBF, bean.getMybean_mc());
//                js = js + "\n\n" + MybeanService.toJSSet(listBF, bean.getMybean_mc());
//                jw.printOne(js);
//            }
//        }
//
//    }

}
