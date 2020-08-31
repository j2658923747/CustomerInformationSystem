package com.ruoyi.system.utils;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.security.Md5Utils;
import com.ruoyi.system.domain.TjCity;
import com.ruoyi.system.domain.TjClient;
import com.ruoyi.system.domain.TjOs;
import com.ruoyi.system.domain.TjTencent;
import com.ruoyi.system.service.ITjCityService;
import com.ruoyi.system.service.ITjClientService;
import com.ruoyi.system.service.ITjOsService;
import com.ruoyi.system.service.ITjTencentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class TenCentUtils {

    @Autowired
    ITjTencentService iTjTencentService;

    @Autowired
    ITjClientService iTjClientService;

    @Autowired
    ITjOsService iTjOsService;

    @Autowired
    ITjCityService iTjCityService;

    /**
            * 得到几天前的时间
   * @param d
   * @param day
   * @return
           */
    public static Date getDateBefore(Date d, int day){
        Calendar now =Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE,now.get(Calendar.DATE)-day);
        return now.getTime();
    }

    /**
     * 得到几天后的时间
     * @param d
     * @param day
     * @return
     */
    public static Date getDateAfter(Date d,int day){
        Calendar now =Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE,now.get(Calendar.DATE)+day);
        return now.getTime();
    }

    public String getCity(String app_id,String seckey,Long userId) throws ParseException {
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        Date nowDate = new Date();
        Date agoDate = getDateBefore(nowDate,30);
        String start_date = sdf1.format(agoDate);
        String end_date = sdf1.format(nowDate);
        String idx = "pv,uv,vv,iv";
        String type_id = "-1";
        String parms = seckey+"app_id="+app_id+"end_date="+end_date+"idx="+idx+"start_date="+start_date+"type_ids="+type_id;
        String sign = Md5Utils.hash(parms);

        String str = HttpUtils.sendGet("https://mta.qq.com/h5/api/ctr_area/get_by_province","app_id="+app_id+"&sign="+sign+"&idx="+idx+"&start_date="+start_date+"&end_date="+end_date+"&type_ids="+type_id);

        JSONObject jsonObject = JSONObject.parseObject(str);
        JSONObject data=null;
        Integer code;
        try{
            code = jsonObject.getIntValue("code");
            data = jsonObject.getJSONObject("data");
            data = data.getJSONObject("-1");
        }catch (Exception e){
            System.out.println("解析json错误");
            return "error";
        }
        if (code==null||code!=0){
            return "statu error";
        }
//        System.out.println(data);
//        保存数据
        SimpleDateFormat sdf2=new SimpleDateFormat("YMMdd");
        sdf2.format(nowDate);
        Date ls_date;
        Date ins_date;
        String pv;
        String uv;
        String vv;
        String iv;
        TjCity tjCity = new TjCity();
        tjCity.setUserId(userId);
        for (Map.Entry<String,Object> entry:data.entrySet()){
            JSONObject o = data.getJSONObject(entry.getKey());
//            System.out.println(entry.getKey());
//            System.out.println(o);
            if (o==null){
                break;
            }
            tjCity.setPv(o.getLong("pv"));
            tjCity.setUv(o.getLong("uv"));
            tjCity.setVv(o.getLong("vv"));
            tjCity.setIv(o.getLong("iv"));
            tjCity.setCity(entry.getKey());
//            tjOs.setOs(o.getString("client"));
//            tjOs.setOsName(o.getString("client_name"));

            insertCity(tjCity);
        }

        System.out.println(data);
//        System.out.println(str);
        return "finish";
    }

    public String getOs(String app_id,String seckey,Long userId) throws ParseException {
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        Date nowDate = new Date();
        Date agoDate = getDateBefore(nowDate,30);
        String start_date = sdf1.format(agoDate);
        String end_date = sdf1.format(nowDate);
        String idx = "pv,uv,vv,iv";
        String type_id = "2";
        String parms = seckey+"app_id="+app_id+"end_date="+end_date+"idx="+idx+"start_date="+start_date+"type_id="+type_id;
        String sign = Md5Utils.hash(parms);

        String str = HttpUtils.sendGet("https://mta.qq.com/h5/api/ctr_client/get_by_para","app_id="+app_id+"&sign="+sign+"&idx="+idx+"&start_date="+start_date+"&end_date="+end_date+"&type_id="+type_id);

        JSONObject jsonObject = JSONObject.parseObject(str);
        JSONObject data=null;
        Integer code;
        try{
            code = jsonObject.getIntValue("code");
            data = jsonObject.getJSONObject("data");
        }catch (Exception e){
            System.out.println("解析json错误");
            return "error";
        }
        if (code==null||code!=0){
            return "statu error";
        }

//        保存数据
        SimpleDateFormat sdf2=new SimpleDateFormat("YMMdd");
        sdf2.format(nowDate);
        Date ls_date;
        Date ins_date;
        String pv;
        String uv;
        String vv;
        String iv;
        TjOs tjOs = new TjOs();
        tjOs.setUserId(userId);
        for (Map.Entry<String,Object> entry:data.entrySet()){
            JSONObject o = data.getJSONObject(entry.getKey());
            if (o==null){
                break;
            }
            tjOs.setPv(o.getLong("pv"));
            tjOs.setUv(o.getLong("uv"));
            tjOs.setVv(o.getLong("vv"));
            tjOs.setIv(o.getLong("iv"));
            tjOs.setOs(o.getString("client"));
            tjOs.setOsName(o.getString("client_name"));

            insertOs(tjOs);
        }

//        System.out.println(data);
//        System.out.println(str);
        return "finish";
    }

    public String getClient(String app_id,String seckey,Long userId) throws ParseException {
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        Date nowDate = new Date();
        Date agoDate = getDateBefore(nowDate,30);
        String start_date = sdf1.format(agoDate);
        String end_date = sdf1.format(nowDate);
        String idx = "pv,uv,vv,iv";
        String type_id = "1";
        String parms = seckey+"app_id="+app_id+"end_date="+end_date+"idx="+idx+"start_date="+start_date+"type_id="+type_id;
        String sign = Md5Utils.hash(parms);

        String str = HttpUtils.sendGet("https://mta.qq.com/h5/api/ctr_client/get_by_para","app_id="+app_id+"&sign="+sign+"&idx="+idx+"&start_date="+start_date+"&end_date="+end_date+"&type_id="+type_id);

        JSONObject jsonObject = JSONObject.parseObject(str);
        JSONObject data=null;
        Integer code;
        try{
            code = jsonObject.getIntValue("code");
            data = jsonObject.getJSONObject("data");
        }catch (Exception e){
            System.out.println("解析json错误");
            return "error";
        }
        if (code==null||code!=0){
            return "statu error";
        }

//        保存数据
        SimpleDateFormat sdf2=new SimpleDateFormat("YMMdd");
        sdf2.format(nowDate);
        Date ls_date;
        Date ins_date;
        String pv;
        String uv;
        String vv;
        String iv;
        TjClient tjClient = new TjClient();
        tjClient.setUserId(userId);
        for (Map.Entry<String,Object> entry:data.entrySet()){
            JSONObject o = data.getJSONObject(entry.getKey());
            if (o==null){
                break;
            }
            tjClient.setPv(o.getLong("pv"));
            tjClient.setUv(o.getLong("uv"));
            tjClient.setVv(o.getLong("vv"));
            tjClient.setIv(o.getLong("iv"));
            tjClient.setClient(o.getString("client"));
            tjClient.setClientName(o.getString("client_name"));

            insertClient(tjClient);
        }

//        System.out.println(data);
//        System.out.println(str);
        return "finish";
    }

//    获取腾讯统计代码
    public String getTencent(String app_id,String seckey,Long userId) throws ParseException {
//        初始化请求参数
        //System.out.println(1111111);
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        Date nowDate = new Date();
        Date agoDate = getDateBefore(nowDate,30);
        String start_date = sdf1.format(agoDate);
        String end_date = sdf1.format(nowDate);
        String idx = "pv,uv,vv,iv";
        String parms = seckey+"app_id="+app_id+"end_date="+end_date+"idx="+idx+"start_date="+start_date;
        String sign = Md5Utils.hash(parms);
//        System.out.println(parms);
//        System.out.println(sign);

//        开始请求
        String str = HttpUtils.sendGet("https://mta.qq.com/h5/api/ctr_core_data","app_id="+app_id+"&sign="+sign+"&idx="+idx+"&start_date="+start_date+"&end_date="+end_date);

        JSONObject jsonObject = JSONObject.parseObject(str);
        JSONObject data=null;
        Integer code;
        try{
            code = jsonObject.getIntValue("code");
            data = jsonObject.getJSONObject("data");
        }catch (Exception e){
            System.out.println("解析json错误");
            return "error";
        }
        if (code==null||code!=0){
            return "statu error";
        }

//        保存数据
        SimpleDateFormat sdf2=new SimpleDateFormat("YMMdd");
        sdf2.format(nowDate);
        Date ls_date;
        Date ins_date;
        String pv;
        String uv;
        String vv;
        String iv;
        TjTencent tjTencent = new TjTencent();
        tjTencent.setUserId(userId);
        for (int i = 0;i<=30;i++){
            ls_date=getDateBefore(nowDate,i);
            String sql_date=sdf2.format(ls_date);
            JSONObject o = data.getJSONObject(sql_date);
            if (o==null){
                break;
            }
            if (i==-1){
                tjTencent.setFindDate(sdf2.parse(sdf2.format(nowDate)));
            }else{
                tjTencent.setFindDate(ls_date);
            }
            tjTencent.setPv(o.getLong("pv"));
            tjTencent.setUv(o.getLong("uv"));
            tjTencent.setVv(o.getLong("vv"));
            tjTencent.setIv(o.getLong("iv"));
//            保存数据
            insertTencent(tjTencent);
        }

//        System.out.println(data);
//        System.out.println(str);
        return "finish";
    }

    public int insertTencent(TjTencent tjTencent){
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        TjTencent tjTencent1 = iTjTencentService.selectTjTencentByUserId(tjTencent.getUserId(),sdf1.format(tjTencent.getFindDate()));
        int i;
        if (tjTencent1==null){
            i = iTjTencentService.insertTjTencent(tjTencent);
        }else{
            tjTencent.setId(tjTencent1.getId());
            i = iTjTencentService.updateTjTencent(tjTencent);
        }
//        System.out.println(i);
        return i;
    }

    public int insertClient(TjClient tjClient){
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        TjClient ls_tjClient = new TjClient();
        ls_tjClient.setUserId(tjClient.getUserId());
        ls_tjClient.setClient(tjClient.getClient());
        ls_tjClient.setClientName(tjClient.getClientName());
        List<TjClient> tjClients = iTjClientService.selectTjClientList(ls_tjClient);
        int i;
        if (tjClients==null||tjClients.size()==0){
            i = iTjClientService.insertTjClient(tjClient);
        }else{
            tjClient.setId(tjClients.get(0).getId());
            i = iTjClientService.updateTjClient(tjClient);
        }
//        System.out.println(i);
        return i;
    }

    public int insertOs(TjOs tjOs){
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        TjOs ls_tjOs = new TjOs();
        ls_tjOs.setUserId(tjOs.getUserId());
        ls_tjOs.setOs(tjOs.getOs());
        ls_tjOs.setOsName(tjOs.getOsName());
        List<TjOs> tjOss = iTjOsService.selectTjOsList(ls_tjOs);
        int i;
        if (tjOss==null||tjOss.size()==0){
            i = iTjOsService.insertTjOs(tjOs);
        }else{
            tjOs.setId(tjOss.get(0).getId());
            i = iTjOsService.updateTjOs(tjOs);
        }
//        System.out.println(i);
        return i;
    }

    public int insertCity(TjCity tjCity){
        SimpleDateFormat sdf1=new SimpleDateFormat("Y-M-dd");
        TjCity ls_tjCity = new TjCity();
        ls_tjCity.setUserId(tjCity.getUserId());
        ls_tjCity.setCity(tjCity.getCity());
        List<TjCity> tjCitys = iTjCityService.selectTjCityList(ls_tjCity);
        int i;
        if (tjCitys==null||tjCitys.size()==0){
            i = iTjCityService.insertTjCity(tjCity);
        }else{
            tjCity.setId(tjCitys.get(0).getId());
            i = iTjCityService.updateTjCity(tjCity);
        }
//        System.out.println(i);
        return i;
    }

    @Test
    public void test(){
        String str="{\"Win7\":{\"vv\":24,\"uv\":8,\"pv\":181,\"client\":\"Win7\",\"client_name\":\"Win7\",\"iv\":2},\"Android\":{\"vv\":1,\"uv\":1,\"pv\":2,\"client\":\"Android\",\"client_name\":\"Android\",\"iv\":1}}";
       // String str="{\"fields\":{\"time\":{\"thText\":\"\\u65f6\\u95f4\",\"colAlign\":\"center\",\"needOrder\":true,\"number\":false,\"precision\":0},\"pv\":{\"thText\":\"\\u6d4f\\u89c8\\u91cf(PV)\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0},\"uv\":{\"thText\":\"\\u72ec\\u7acb\\u7528\\u6237(UV)\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0},\"vv\":{\"thText\":\"\\u8bbf\\u95ee\\u6b21\\u6570(VV)\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0},\"iv\":{\"thText\":\"\\u72ec\\u7acbIP\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0},\"bounce_rate\":{\"thText\":\"\\u8df3\\u51fa\\u7387\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0},\"online_time\":{\"thText\":\"\\u5e73\\u5747\\u5728\\u7ebf\\u65f6\\u957f\",\"colAlign\":\"right\",\"needOrder\":true,\"number\":true,\"precision\":0}},\"data\":[{\"time\":\"14:00\",\"pv\":5,\"uv\":1,\"vv\":2,\"iv\":2,\"bounce_rate\":\"-\",\"online_time\":\"-\"},{\"time\":\"13:00\",\"pv\":41,\"uv\":10,\"vv\":14,\"iv\":11,\"bounce_rate\":\"28.57%\",\"online_time\":\"00:00:31\"},{\"time\":\"12:00\",\"pv\":67,\"uv\":9,\"vv\":21,\"iv\":11,\"bounce_rate\":\"33.33%\",\"online_time\":\"00:01:08\"},{\"time\":\"11:00\",\"pv\":101,\"uv\":13,\"vv\":30,\"iv\":14,\"bounce_rate\":\"50%\",\"online_time\":\"00:01:42\"},{\"time\":\"10:00\",\"pv\":86,\"uv\":18,\"vv\":38,\"iv\":20,\"bounce_rate\":\"44.74%\",\"online_time\":\"00:00:19\"},{\"time\":\"09:00\",\"pv\":57,\"uv\":20,\"vv\":27,\"iv\":20,\"bounce_rate\":\"40.74%\",\"online_time\":\"00:00:16\"},{\"time\":\"08:00\",\"pv\":34,\"uv\":11,\"vv\":17,\"iv\":11,\"bounce_rate\":\"41.18%\",\"online_time\":\"00:00:20\"},{\"time\":\"07:00\",\"pv\":16,\"uv\":8,\"vv\":11,\"iv\":8,\"bounce_rate\":\"63.64%\",\"online_time\":\"00:00:05\"},{\"time\":\"06:00\",\"pv\":9,\"uv\":5,\"vv\":5,\"iv\":5,\"bounce_rate\":\"60%\",\"online_time\":\"00:00:12\"},{\"time\":\"05:00\",\"pv\":1,\"uv\":1,\"vv\":1,\"iv\":1,\"bounce_rate\":\"100%\",\"online_time\":\"-\"},{\"time\":\"04:00\",\"pv\":6,\"uv\":\"-\",\"vv\":\"-\",\"iv\":\"-\",\"bounce_rate\":\"-\",\"online_time\":\"-\"},{\"time\":\"03:00\",\"pv\":8,\"uv\":1,\"vv\":4,\"iv\":2,\"bounce_rate\":\"-\",\"online_time\":\"-\"},{\"time\":\"02:00\",\"pv\":4,\"uv\":3,\"vv\":3,\"iv\":3,\"bounce_rate\":\"66.67%\",\"online_time\":\"-\"},{\"time\":\"01:00\",\"pv\":13,\"uv\":5,\"vv\":5,\"iv\":5,\"bounce_rate\":\"20%\",\"online_time\":\"00:00:12\"},{\"time\":\"00:00\",\"pv\":25,\"uv\":12,\"vv\":13,\"iv\":11,\"bounce_rate\":\"61.54%\",\"online_time\":\"00:04:36\"}],\"page\":{\"ifRealPage\":0,\"size\":15}}";
        JSONObject jsonObject = JSONObject.parseObject(str);
        //JSONArray data = jsonObject.getJSONArray("data");
        for (Map.Entry<String,Object> entry:jsonObject.entrySet()){
            System.out.println(entry.getKey());
        }
        JSONObject data = jsonObject.getJSONObject("Win7");
        System.out.println(data);
        //System.out.println(getDateBefore(nowDate,20));
    }
}
