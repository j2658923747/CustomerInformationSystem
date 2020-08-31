package com.ruoyi.system.controller;

import java.util.List;

import com.ruoyi.system.domain.SysUser;
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
import com.ruoyi.system.domain.TjTencent;
import com.ruoyi.system.service.ITjTencentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2020-07-21
 */
@Controller
@RequestMapping("/system/tencent")
public class TjTencentController extends BaseController
{
    private String prefix = "system/tencent";

    @Autowired
    private ITjTencentService tjTencentService;

    @RequiresPermissions("system:tencent:view")
    @GetMapping()
    public String tencent()
    {
        return prefix + "/tencent";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:tencent:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TjTencent tjTencent)
    {
        startPage();
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String remark = user.getRemark();
        List<TjTencent> list;
        if (remark!=null && remark.equals("管理员")){
            list = tjTencentService.selectTjTencentList(tjTencent);
        }else{
            tjTencent.setUserId(user.getUserId());;
            list = tjTencentService.selectTjTencentList(tjTencent);
        }
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:tencent:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TjTencent tjTencent)
    {
        List<TjTencent> list = tjTencentService.selectTjTencentList(tjTencent);
        ExcelUtil<TjTencent> util = new ExcelUtil<TjTencent>(TjTencent.class);
        return util.exportExcel(list, "tencent");
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
    @RequiresPermissions("system:tencent:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TjTencent tjTencent)
    {
        return toAjax(tjTencentService.insertTjTencent(tjTencent));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TjTencent tjTencent = tjTencentService.selectTjTencentById(id);
        mmap.put("tjTencent", tjTencent);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:tencent:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TjTencent tjTencent)
    {
        return toAjax(tjTencentService.updateTjTencent(tjTencent));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:tencent:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tjTencentService.deleteTjTencentByIds(ids));
    }
}
