package com.ruoyi.web.controller.tool;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.stereotype.Component;

@Component
public class Alipay {
    public String pay(AlipayBean alipayBean) throws AlipayApiException{
        System.out.println(alipayBean.toString());
        // 1、获得初始化的AlipayClient
        String gatewayUrl = AlipayConfig.gatewayUrl;
        String appId = AlipayConfig.appId;
        String privateKey = AlipayConfig.privateKey;
        String format = "json";
        String charset = AlipayConfig.charset;
        String alipayPublicKey = AlipayConfig.publicKey;
        String signType = AlipayConfig.signType;
        String returnUrl = AlipayConfig.returnUrl;
        String notifyUrl = AlipayConfig.notifyUrl;
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl, appId, privateKey, format, charset, alipayPublicKey, signType);
        // 2、设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        // 页面跳转同步通知页面路径
        alipayRequest.setReturnUrl(returnUrl);
        // 服务器异步通知页面路径
        alipayRequest.setNotifyUrl(notifyUrl);
        // 封装参数
        alipayRequest.setBizContent(JSON.toJSONString(alipayBean));
        // 3、请求支付宝进行付款，并获取支付结果
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        //System.out.println(result);
        // 返回付款信息
        return result;
    }
}
