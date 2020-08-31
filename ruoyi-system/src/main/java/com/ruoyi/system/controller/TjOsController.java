package com.ruoyi.system.controller;

import java.util.List;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.TjClient;
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
import com.ruoyi.system.domain.TjOs;
import com.ruoyi.system.service.ITjOsService;
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
@RequestMapping("/system/os")
public class TjOsController extends BaseController
{
    private String prefix = "system/os";

    @Autowired
    private ITjOsService tjOsService;

    @RequiresPermissions("system:os:view")
    @GetMapping()
    public String os()
    {
        return prefix + "/os";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:os:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TjOs tjOs)
    {
        startPage();

        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String remark = user.getRemark();
        List<TjOs> list;
        if (remark!=null && remark.equals("管理员")){
            list = tjOsService.selectTjOsList(tjOs);
        }else{
            tjOs.setUserId(user.getUserId());
            list = tjOsService.selectTjOsList(tjOs);
        }

        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:os:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TjOs tjOs)
    {
        List<TjOs> list = tjOsService.selectTjOsList(tjOs);
        ExcelUtil<TjOs> util = new ExcelUtil<TjOs>(TjOs.class);
        return util.exportExcel(list, "os");
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
    @RequiresPermissions("system:os:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TjOs tjOs)
    {
        return toAjax(tjOsService.insertTjOs(tjOs));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TjOs tjOs = tjOsService.selectTjOsById(id);
        mmap.put("tjOs", tjOs);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:os:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TjOs tjOs)
    {
        return toAjax(tjOsService.updateTjOs(tjOs));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:os:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tjOsService.deleteTjOsByIds(ids));
    }
}
