package com.ruoyi.system.controller;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.utils.ProductUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/product")
@RestController
public class ProductController {

    @Autowired
    ProductUtil productUtil;

    @RequestMapping("/buy")
    public String buy(String productId) throws Exception {
        SysUser principal = (SysUser) SecurityUtils.getSubject().getPrincipal();
        if (principal==null){
            return "not login";
        }
        Long userId = principal.getUserId();
        if (userId==null){
            return "login error";
        }
        String s = productUtil.buyProduct(productId, userId);
        return s;
    }
}
