package com.ruoyi.system.utils;

import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.ZdInvest;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.IZdInvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Component
public class ProductUtil {

    private static Integer MONEY_ONE = 4500;
    private static Integer MONEY_TWO = 3200;
    private static Integer MONEY_THREE = 880;
    private static Integer MONEY_FOUR = 80;
    private static Integer MONEY_FIVE = 12000;
    private static Integer MONEY_SIX = 980;
    private static Integer MONEY_SEVEN = 5000;
    private static Integer MONEY_EIGHT = 400;

    private static String PRODUCT_NAME_ONE = "百度爱采购(年制会员)";
    private static String PRODUCT_NAME_TWO = "百度爱采购(竞价)";
    private static String PRODUCT_NAME_THREE = "万词推广系统";
    private static String PRODUCT_NAME_FOUR = "云发布软件";
    private static String PRODUCT_NAME_FIVE = "百度竞价";
    private static String PRODUCT_NAME_SIX = "易上云发布系统";
    private static String PRODUCT_NAME_SEVEN = "官网推";
    private static String PRODUCT_NAME_EIGHT = "网站制作";

    @Autowired
    private ISysUserService iSysUserService;

    @Autowired
    private IZdInvestService iZdInvestService;

    public String buyProduct(String productId,Long userId) throws Exception {
        String res="";
        switch (productId){
            case "1":res=deduction(MONEY_ONE,PRODUCT_NAME_ONE,userId);break;
            case "2":res=deduction(MONEY_TWO,PRODUCT_NAME_TWO,userId);break;
            case "3":res=deduction(MONEY_THREE,PRODUCT_NAME_THREE,userId);break;
            case "4":res=deduction(MONEY_FOUR,PRODUCT_NAME_FOUR,userId);break;
            case "5":res=deduction(MONEY_FIVE,PRODUCT_NAME_FIVE,userId);break;
            case "6":res=deduction(MONEY_SIX,PRODUCT_NAME_SIX,userId);break;
            case "7":res=deduction(MONEY_SEVEN,PRODUCT_NAME_SEVEN,userId);break;
            case "8":res=deduction(MONEY_EIGHT,PRODUCT_NAME_EIGHT,userId);break;
        }
        return res;
    }

    @Transactional(rollbackFor = Exception.class)
    public String deduction(Integer money,String productType,Long userId) throws Exception {
        String res="";

//        检查余额是否足够

        SysUser sysUser = iSysUserService.selectUserById(userId);
        if (sysUser.getMoney()<money){
            res="余额不足!";
            return res;
        }

//        扣除余额

        sysUser.setMoney(sysUser.getMoney()-money);
        int i = iSysUserService.updateUserInfo(sysUser);
        if (i==0){
            throw new Exception();
        }
//        插入扣费记录
        ZdInvest zdInvest = new ZdInvest();
        zdInvest.setUserId(userId);
        zdInvest.setTotalAmount(0.0-money);
        zdInvest.setOutTradeNo(UUID.randomUUID().toString());
        Date nowDate = new Date();
        zdInvest.setCreateTime(nowDate);
        zdInvest.setSucceTime(nowDate);
        zdInvest.setProductType(productType);
        zdInvest.setRemark("购买产品");
        zdInvest.setType("已支付");
        i = iZdInvestService.insertZdInvest(zdInvest);
        if (i==0){
            throw new Exception();
        }
        res="购买"+productType+"成功!";
//        end
        return res;
    }
}
