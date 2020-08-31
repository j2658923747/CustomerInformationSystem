package com.ruoyi.system.controller;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.utils.TenCentUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;

@RequestMapping("/pv")
@RestController
public class PVController {

    @Autowired
    TenCentUtils tenCentUtils;

    @RequestMapping("search")
    public String search() throws ParseException {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        if (sysUser==null){
            return "error";
        }
        String sid = sysUser.getSid();
        String seckey = sysUser.getSeckey();
        if (sid==null||seckey==null){
            return "error";
        }
//        System.out.println(sid);
//        System.out.println(seckey);
//        开始查询

        String tencent = tenCentUtils.getTencent(sid, seckey,sysUser.getUserId());
        tencent = tenCentUtils.getClient(sid, seckey,sysUser.getUserId());
        tencent = tenCentUtils.getOs(sid, seckey,sysUser.getUserId());
        tencent = tenCentUtils.getCity(sid, seckey,sysUser.getUserId());
//        System.out.println(tencent);
        return tencent;
    }
}
