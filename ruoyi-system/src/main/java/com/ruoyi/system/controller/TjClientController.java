package com.ruoyi.system.controller;

import java.util.List;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.ZdInvest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TjClient;
import com.ruoyi.system.service.ITjClientService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
@Controller
@RequestMapping("/system/client")
public class TjClientController extends BaseController
{
    private String prefix = "system/client";

    @Autowired
    private ITjClientService tjClientService;

    @RequiresPermissions("system:client:view")
    @GetMapping()
    public String client()
    {
        return prefix + "/client";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:client:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TjClient tjClient)
    {
        startPage();

        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String remark = user.getRemark();
        List<TjClient> list;
        if (remark!=null && remark.equals("管理员")){
            list = tjClientService.selectTjClientList(tjClient);
        }else{
            tjClient.setUserId(user.getUserId());
            list = tjClientService.selectTjClientList(tjClient);
        }

        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:client:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TjClient tjClient)
    {
        List<TjClient> list = tjClientService.selectTjClientList(tjClient);
        ExcelUtil<TjClient> util = new ExcelUtil<TjClient>(TjClient.class);
        return util.exportExcel(list, "client");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:client:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TjClient tjClient)
    {
        return toAjax(tjClientService.insertTjClient(tjClient));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TjClient tjClient = tjClientService.selectTjClientById(id);
        mmap.put("tjClient", tjClient);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:client:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TjClient tjClient)
    {
        return toAjax(tjClientService.updateTjClient(tjClient));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:client:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tjClientService.deleteTjClientByIds(ids));
    }
}
