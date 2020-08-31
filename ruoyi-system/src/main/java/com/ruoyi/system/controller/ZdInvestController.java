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
import com.ruoyi.system.domain.ZdInvest;
import com.ruoyi.system.service.IZdInvestService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2020-07-18
 */
@Controller
@RequestMapping("/system/invest")
public class ZdInvestController extends BaseController
{
    private String prefix = "system/invest";

    @Autowired
    private IZdInvestService zdInvestService;

    @RequiresPermissions("system:invest:view")
    @GetMapping()
    public String invest()
    {
        return prefix + "/invest";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:invest:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZdInvest zdInvest)
    {
        if (zdInvest.getProductType().equals("")){
            zdInvest.setProductType(null);
        }
        startPage();
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        //System.out.println(user);
        String remark = user.getRemark();
        List<ZdInvest> list;
        if (remark!=null && remark.equals("管理员")){
            list = zdInvestService.selectZdInvestList(zdInvest);
        }else{
            zdInvest.setUserId(user.getUserId());
            list = zdInvestService.selectZdInvestList(zdInvest);
        }
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:invest:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZdInvest zdInvest)
    {
        List<ZdInvest> list = zdInvestService.selectZdInvestList(zdInvest);
        ExcelUtil<ZdInvest> util = new ExcelUtil<ZdInvest>(ZdInvest.class);
        return util.exportExcel(list, "invest");
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
    @RequiresPermissions("system:invest:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZdInvest zdInvest)
    {
        return toAjax(zdInvestService.insertZdInvest(zdInvest));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ZdInvest zdInvest = zdInvestService.selectZdInvestById(id);
        mmap.put("zdInvest", zdInvest);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:invest:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZdInvest zdInvest)
    {
        return toAjax(zdInvestService.updateZdInvest(zdInvest));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:invest:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(zdInvestService.deleteZdInvestByIds(ids));
    }
}
