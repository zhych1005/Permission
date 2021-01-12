package com.mmall.controller;

import com.mmall.beans.PageQuery;
import com.mmall.beans.PageResult;
import com.mmall.common.JsonData;
import com.mmall.model.SalesForm;
import com.mmall.model.SysUser;
import com.mmall.param.MonthSearchForm;
import com.mmall.param.SalesFormParam;
import com.mmall.param.SearchFormParam;
import com.mmall.service.SalesFormService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: ServiceController
 * @date: 2019/05/20 16:20
 * @description:
 */
@Controller
@RequestMapping("/user/form")
public class ServiceController {

    @Resource
    private SalesFormService salesFormService;

    /**
     * 报表添加页面的跳转
     * @return
     */
    @RequestMapping("/addForm.page")
    public ModelAndView addForm() {
        return new ModelAndView("new");
    }


    /**
     * 页面载入条件接口
     * @return
     */
    @RequestMapping("/addFormPage.json")
    @ResponseBody
    public JsonData page(SearchFormParam param, PageQuery page) {
        return JsonData.success(salesFormService.getPageByUserId(param, page));
    }


    /**
     * 客户添加方法
     * @param param
     * @return
     */
    @RequestMapping("/newForm.json")
    @ResponseBody
    public JsonData newForm(SalesFormParam param) {
        salesFormService.cusSave(param);
        return JsonData.success();
    }

    /**
     * 客户更新方法
     * @param param
     * @return
     */
    @RequestMapping("/updateForm")
    @ResponseBody
    public JsonData updateForm(SalesFormParam param) {
        salesFormService.cusUpdate(param);
        return JsonData.success();
    }




    /**
     * 当日所有客户页面的跳转
     * @return
     */
    @RequestMapping("/dayForm.page")
    public ModelAndView dayForm() {
        return new ModelAndView("today");
    }

    /**
     * 查询当日的所有客户
     * @return
     */
    @RequestMapping("/countCusByToday.json")
    @ResponseBody
    public JsonData countCusByToday(PageQuery pageQuery, Integer deptId) {
        PageResult<SalesForm> result = salesFormService.countCusByToday(pageQuery, deptId);
        return JsonData.success(result);
    }


    /**
     * 当月所有客户页面的跳转
     * @return
     */
    @RequestMapping("/monForm.page")
    public ModelAndView monForm() {
        return new ModelAndView("month");
    }


    /**
     * 查询当月的所有客户
     * @return
     */
    @RequestMapping("/countCusByMonth.json")
    @ResponseBody
    public JsonData countCusByMonth(PageQuery pageQuery, Integer deptId, MonthSearchForm searchForm) {
        return JsonData.success(salesFormService.countCusByMonth(pageQuery, deptId, searchForm));
    }




    /**
     * 当日所有数据页面跳转
     * @return
     */
    @RequestMapping("/sumTodayForm.page")
    public ModelAndView sumTodayForm() {
        return new ModelAndView("sumTodayVisit");
    }

    /**
     * 查询当日的所有客户
     * @return
     */
    @RequestMapping("/sumCusByToday.json")
    @ResponseBody
    public JsonData sumCusByToday(PageQuery pageQuery, MonthSearchForm searchForm) {
        return JsonData.success(salesFormService.sumCusByToday(pageQuery, searchForm));
    }

    /**
     * 当月所有数据页面跳转
     * @return
     */
    @RequestMapping("/sumMonthForm.page")
    public ModelAndView sumMonForm() {
        return new ModelAndView("sumMonthVisit");
    }


    /**
     * 图表查询当日部门数据
     * @return
     */
    @RequestMapping("/countVisitInfoByToday.json")
    @ResponseBody
    public JsonData countVisitInfoByToday() {
        return JsonData.success(salesFormService.countVisitInfoByToday());
    }

    /**
     * 图表查询当月部门数据
     * @return
     */
    @RequestMapping("/countVisitInfoByMonth.json")
    @ResponseBody
    public JsonData countVisitInfoByMonth() {
        return JsonData.success(salesFormService.countVisitInfoByMonth());
    }

    /**
     * 当月每天成交量走势图
     * @return
     */
    @RequestMapping("/countSuccessfulCus.json")
    @ResponseBody
    public JsonData countSuccessfulCus() {
        return JsonData.success(salesFormService.countSuccessfulCus());
    }

    /**
     * 查询本月排名前10的业务员
     * @return
     */
    @RequestMapping("/countTenByUser.json")
    @ResponseBody
    public JsonData countTenByUser() {
        return JsonData.success(salesFormService.countTenByUser());
    }


    /**
     * 所有来访客户页面跳转
     * @return
     */
    @RequestMapping("/findAllCusPage.page")
    public ModelAndView findAllCusPage() {
        return new ModelAndView("findAllCus");
    }

    /**
     * 查询所有来访客户
     * @return
     */
    @RequestMapping("/findAllCus.json")
    @ResponseBody
    public JsonData findAllCus(PageQuery pageQuery, MonthSearchForm searchForm) {
        return JsonData.success(salesFormService.findAllCus(pageQuery, searchForm));
    }

    /**
     * 查询公共池数据
     * @param deptId
     * @param page
     * @return
     */
    @RequestMapping("/timeOutVisitCus.json")
    @ResponseBody
    public JsonData timeOutVisitCus(int deptId, PageQuery page) {
        return JsonData.success(salesFormService.timeOutVisitCus(deptId, page));
    }

    /**
     * 获取公共池数据
     * @param salesForm
     * @return
     */
    @RequestMapping("/updateVisitCommonPool.json")
    @ResponseBody
    public JsonData updateVisitCommonPool(SalesForm salesForm) {
        salesFormService.updateVisitCommonPool(salesForm);
        return JsonData.success();
    }

    /*顾问图标页~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    /**
     * 本部门接访量排名
     * @return
     */
    @RequestMapping("/deptVisitByMon.json")
    @ResponseBody
    public JsonData deptVisitByMon() {
        return JsonData.success(salesFormService.deptVisitByMon());
    }

    /**
     * 年度部门顾问成交量
     * @return
     */
    @RequestMapping("/annualTurnover.json")
    @ResponseBody
    public JsonData annualTurnover() {
        return JsonData.success(salesFormService.annualTurnover());
    }

    /**
     * 月度本部门成交排行
     * @return
     */
    @RequestMapping("/monthDealByDept.json")
    @ResponseBody
    public JsonData monthDealByDept() {
        return JsonData.success(salesFormService.monthDealByDept());
    }

    /**
     * 本部门每个人的成交率
     * @return
     */
    @RequestMapping("/findDepartmentPerformanceByOne.json")
    @ResponseBody
    public JsonData findDepartmentPerformanceByOne() {
        return JsonData.success(salesFormService.findDepartmentPerformanceByOne());
    }

}