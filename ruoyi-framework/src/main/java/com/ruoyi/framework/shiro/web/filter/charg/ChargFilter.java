package com.ruoyi.framework.shiro.web.filter.charg;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URL;

@Component
@WebFilter(filterName = "chargFilter",urlPatterns = "/charg/all/*")
public class ChargFilter implements Filter {

    @Autowired
    ISysUserService iSysUserService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse= (HttpServletResponse) servletResponse;
        String url = String.valueOf(httpServletRequest.getRequestURL());
        if (url.indexOf("/charg/all/")==-1){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        URL u = new URL(url);
        String file = u.getFile();
        file = file.replace("/charg/all/","");
        if (file.indexOf("/")==-1){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        file=file.substring(0,file.indexOf("/"));
        if (file==null||file.length()!=9){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        //在这里写匹配扣费

        SysUser sysUser = iSysUserService.selectUserByCharg(file);
        System.out.println(file);
        ///System.out.println(sysUser);
        if (sysUser==null){
            //没有此用户对应的扣费标志
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
//       开始扣费处理
//        判断是否有余额
        if (Double.valueOf(sysUser.getMoney())<=0){
            httpServletResponse.sendRedirect("/finance/use");
            return;
        }


        //end
        filterChain.doFilter(servletRequest,servletResponse);

    }
}
