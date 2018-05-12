package wx.web.cc.service;

import configuration.DBO;
import java.util.List;
import java.util.Map;
import org.apache.velocity.VelocityContext;
import wx.web.cc.bean.BeanField;
import wx.web.cc.bean.BeanField2;
import wx.web.cc.service.svo.BeanFieldSVO;
import wx.web.cc.service.svo.BeanSVO;

/**
 *
 * @author adm.wangchunzi
 */
public class BeanFieldService {

    /**
     * bean属性（表头，表体） 添加时，进行自我翻译
     *
     * @param svo bean
     * @param f1 属性-表头
     * @param list 属性-表体
     * @return BeanFieldSVO
     */
    public static BeanFieldSVO engineToAdd(final BeanSVO svo, BeanField f1, List<BeanField2> list) {
        Map<String, String> mapkv = EngineService.getDefaultEngineData();
        mapkv.put("&#39;", "'");
        mapkv.put("[?c?]", svo.bean.getBean_mc().toLowerCase());//小写bean名
        mapkv.put("[?c?1]", svo.bean.getBean_mc().substring(0, 1).toLowerCase() + svo.bean.getBean_mc().substring(1));//小写第1个字符 bean名
        //bean 参加翻译
        VelocityContext context = iniBeanData(svo);
        //bean的属性-表头 参加翻译
        EngineService.setMyself(context, f1);//设置自我翻译
        f1 = EngineService.toWorkT(f1, context, mapkv); //翻译后的对象
//==================================================================================================
        //bean 参加翻译
        context = iniBeanData(svo);
        //bean的属性-表头(翻译后的表头） 参加翻译
        EngineService.setMyself(context, f1);
        //bean的属性-表体 设置自我翻译
        EngineService.setMyself(context, list, "getBeanfield2_key", "getBeanfield2_value");
        //翻译后的对象
        list = EngineService.toWorkT(list, context, mapkv);
//        String str = modelData.replace("&#39;", "'").replace("&#34;", "\"").replace("&#60;", "<").replace("&#62;", ">");//.replace("&#92;", "\\")
        return new BeanFieldSVO(f1, list);
    }

    private static VelocityContext iniBeanData(final BeanSVO svo) {
        VelocityContext context = EngineService.getVelocityContext();
        // 找到 Bean，并放入翻译中
        EngineService.setMyself(context, svo.bean);//翻译文本中，bean表头 相关信息
        EngineService.setMyself(context, svo.bean2List, "getBean2_key", "getBean2_value");////翻译文本中，bean表体 相关信息
        return context;
    }

    /**
     * 通过表头ID,取得表体
     *
     * @param beanfield_zj
     * @return List
     */
    public static List<BeanField2> getBody(String beanfield_zj) {
        return DBO.service.S.selectByCondition(BeanField2.class, "WHERE beanfield_zj IN('" + beanfield_zj + "')");
    }

    public static int[] topx(String[] ids) {
        String[] sqldata = new String[ids.length];
        for (int i = 0; i < ids.length; i++) {
            sqldata[i] = "UPDATE BeanField SET beanfield_px=" + i + " WHERE beanfield_zj='" + ids[i] + "'";
        }
        return DBO.service.ADUS.executeBatch(sqldata);
    }
}