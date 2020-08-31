package com.ruoyi.system.controller;

import java.util.List;

import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.TjOs;
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
import com.ruoyi.system.domain.TjCity;
import com.ruoyi.system.service.ITjCityService;
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
@RequestMapping("/system/city")
public class TjCityController extends BaseController
{
    private String prefix = "system/city";

    @Autowired
    private ITjCityService tjCityService;

    @RequiresPermissions("system:city:view")
    @GetMapping()
    public String city()
    {
        return prefix + "/city";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:city:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TjCity tjCity)
    {
        startPage();

        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        String remark = user.getRemark();
        List<TjCity> list;
        if (remark!=null && remark.equals("管理员")){
            list = tjCityService.selectTjCityList(tjCity);
        }else{
            tjCity.setUserId(user.getUserId());
            list = tjCityService.selectTjCityList(tjCity);
        }

        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:city:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TjCity tjCity)
    {
        List<TjCity> list = tjCityService.selectTjCityList(tjCity);
        ExcelUtil<TjCity> util = new ExcelUtil<TjCity>(TjCity.class);
        return util.exportExcel(list, "city");
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
    @RequiresPermissions("system:city:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TjCity tjCity)
    {
        return toAjax(tjCityService.insertTjCity(tjCity));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TjCity tjCity = tjCityService.selectTjCityById(id);
        mmap.put("tjCity", tjCity);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:city:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TjCity tjCity)
    {
        return toAjax(tjCityService.updateTjCity(tjCity));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:city:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tjCityService.deleteTjCityByIds(ids));
    }
}
