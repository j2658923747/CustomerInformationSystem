package com.ruoyi.web.controller.system;

import com.alipay.api.internal.util.AlipaySignature;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.ZdInvest;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.IZdInvestService;
import com.ruoyi.web.controller.tool.Alipay;
import com.ruoyi.web.controller.tool.AlipayBean;
import com.ruoyi.web.controller.tool.AlipayConfig;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alipay.api.AlipayApiException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("pay")
public class PayController {

    @Autowired
    private Alipay alipay;

    @Autowired
    private IZdInvestService iZdInvestService;

    @Autowired
    private ISysUserService iSysUserService;

    //@Autowired
    //private

    @PostMapping(value = "alipay")
    public String alipay( String totalAmount,String productType,String remark) throws AlipayApiException {
        AlipayBean alipayBean = new AlipayBean();
        if (totalAmount==null||totalAmount.isEmpty()){
            return "error";
        }
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String userId = String.valueOf(user.getUserId());
        System.out.println("money:"+user.getMoney());
        String outTradeNo= UUID.randomUUID().toString().substring(10)+"-"+UUID.randomUUID().toString().substring(0,2)+userId+UUID.randomUUID().toString().substring(0,2);
        String subject=productType;
        if (subject==null){
            subject="充值!";
        }
        String body=remark;
        if (body==null){
            body="用户"+userId+"充值"+totalAmount+"元！";
        }
        //String body="用户"+userId+"充值"+totalAmount+"元！";
        alipayBean.setOut_trade_no(outTradeNo);
        alipayBean.setSubject(subject);
        alipayBean.setTotal_amount(totalAmount);
        alipayBean.setBody(body);

//        创建充值订单
        ZdInvest inverst = new ZdInvest();
        inverst.setOutTradeNo(outTradeNo);
        try{
            inverst.setTotalAmount(new Double(Double.valueOf(totalAmount)));
            inverst.setUserId(new Double(Double.valueOf(userId)).longValue());
        }catch(Exception e){
            return "金额错误";
        }
        inverst.setProductType(productType);
        inverst.setRemark(remark);
        Date date = new Date();
        inverst.setCreateTime(date);
        inverst.setType("未支付");
        //System.out.println(inverst.getTotalAmount());
//        插入充值订单记录
        Integer ind = iZdInvestService.insertZdInvest(inverst);
        if (ind==0){
            System.out.println("创建订单失败");
            return "error";
        }else{
            System.out.println("创建订单成功");
            return alipay.pay(alipayBean);
        }

    }

    @RequestMapping("/alipayNotifyNotice")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public String alipayNotifyNotice(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println("支付成功, 进入异步通知接口...");
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            if (name.equals("sign_type") ){
                //System.out.println(name);
                continue;
            }
            //System.out.println("异步"+name);
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV2(params, AlipayConfig.publicKey, AlipayConfig.charset, AlipayConfig.signType); //调用SDK验证签名
        //——请在这里编写您的程序（以下代码仅作参考）——
        /* 实际验证过程建议商户务必添加以下校验：
        1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
        2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
        3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
        4、验证app_id是否为该商户本身。
        */
        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额 到这里获取到这些信息就可以了，下面的不用看
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意： 尚自习的订单没有退款功能, 这个条件判断是进不来的, 所以此处不必写代码
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            }else if (trade_status.equals("TRADE_SUCCESS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知

                int result=0;
                //开始查询修改
                ZdInvest invest = new ZdInvest();
                invest.setOutTradeNo(out_trade_no);
                List<ZdInvest> invests = iZdInvestService.selectZdInvestList(invest);
                if (invests==null || invests.size()==0){
                    return "error";
                }
                invest=invests.get(0);
//                判断订单状态
                if (invest.getType().equals("已支付")){
                    return "success";
                }

                invest.setAlipayNo(trade_no);
                Date date = new Date();
                invest.setSucceTime(date);
                invest.setType("已支付");
                //System.out.println(total_amount);
                invest.setTotalAmount(Double.valueOf(total_amount));
                SysUser sysUser = new SysUser();
                sysUser = iSysUserService.selectUserById(invest.getUserId());

                Double ls_money = new Double(Double.valueOf(total_amount))+sysUser.getMoney();
                sysUser.setMoney(ls_money);
                System.out.println(ls_money);
                //System.out.println(sysUser);

//                更新余额
                result = iSysUserService.updateUserInfo(sysUser);
//                更新订单状态
                iZdInvestService.updateZdInvest(invest);

                //System.out.println(invest.toString());
                if(result==0){
                    System.out.println("resultinfo"+"更新订单失败！请业务员联系后台管理员！");
                    throw new Exception();
                }else {
                    System.out.println("resultinfo"+"出租工具成功！");
                }

                System.out.println("********************** 支付成功(支付宝异步通知) **********************");
                System.out.println("* 订单号: "+out_trade_no);
                System.out.println("* 支付宝交易号: "+ trade_no);
                System.out.println("* 实付金额: "+total_amount);
                System.out.println("***************************************************************");
            }
            System.out.println("支付成功...");
        }else {//验证失败
            System.out.println("支付, 验签失败...");
        }
        return "success";
        //model.addAttribute("msg","成功");
        //response.sendRedirect("/finance/use/successful");
        //request.getRequestDispatcher("/finance/use/successful").forward(request,response);
        //return "/finance/use/successful";//成功返回首页
    }

    @RequestMapping(value = "/alipayReturnNotice")
    public String alipayReturnNotice(Model model,HttpServletRequest request, HttpServletRequest response) throws Exception {

        System.out.println("支付成功, 进入同步通知接口...");

        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            //System.out.println("同步"+valueStr);
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV2(params, AlipayConfig.publicKey, AlipayConfig.charset, AlipayConfig.signType); //调用SDK验证签名
        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额，这里获取到三个参数就可以了，后面逻辑代码自己创作
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            int result=0;
            //这里根据自身的业务写代码，我这里删掉了

            if(result==0){
                model.addAttribute("resultinfo","更新订单失败！请业务员联系后台管理员！");
            }else {
                model.addAttribute("resultinfo","出租工具成功！");
            }
//            System.out.println("********************** 支付成功(支付宝同步通知) **********************");
//            System.out.println("* 订单号: "+ out_trade_no);
//            System.out.println("* 支付宝交易号: "+ trade_no);
//            System.out.println("* 实付金额: "+ total_amount);
//            System.out.println("***************************************************************");
        }else {
            System.out.println("支付, 验签失败...");
        }
        return "支付成功!";//成功返回首页
    }

}
