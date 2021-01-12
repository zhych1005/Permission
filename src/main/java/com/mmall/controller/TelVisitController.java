package com.mmall.controller;

import com.mmall.beans.PageQuery;
import com.mmall.beans.PageResult;
import com.mmall.common.JsonData;
import com.mmall.model.TelVisitForm;
import com.mmall.param.MonthVisitSearchForm;
import com.mmall.param.TelVisitAddParam;
import com.mmall.param.TelVisitPageParam;
import com.mmall.service.TelVisitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: TelVisitController
 * @date: 2019/06/14 16:53
 * @description:
 */
@Controller
@RequestMapping("/cusTel/form")
public class TelVisitController {

    @Resource
    private TelVisitService telVisitService;

    /**
     * 电访客户添加的页面跳转
     * @return
     */
    @RequestMapping("/addTelForm.page")
    public ModelAndView addTelForm() {
        return new ModelAndView("newTelVisit");
    }

    /**
     * 电访页面载入条件
     * @return
     */
    @RequestMapping("/addTelVisitPage.json")
    @ResponseBody
    public JsonData telVisitPage(TelVisitPageParam param, PageQuery page) {
        return JsonData.success(telVisitService.getTelVisitPageByUserId(param, page));
    }

    /**
     * 电访用户添加
     * @param param
     * @return
     */
    @RequestMapping("/addTelCus.json")
    @ResponseBody
    public JsonData addTelCus(TelVisitAddParam param){
        telVisitService.telCusSave(param);
        return JsonData.success();
    }

    /**
     * 电访用户更新
     * @param param
     * @return
     */
    @RequestMapping("/updateTelCus.json")
    @ResponseBody
    public JsonData updateTelCus(TelVisitAddParam param){
        telVisitService.telCusUpdate(param);
        return JsonData.success();
    }



    /**
     * 当日电访客户统计页面
     * @return
     */
    @RequestMapping("/todayTelForm.page")
    public ModelAndView todayTelForm() {
        return new ModelAndView("todayTelVisit");
    }

    /**
     * 当日本部门的电访统计
     * @param pageQuery
     * @param deptId
     * @return
     */
    @RequestMapping("/countTelCusByToday.json")
    @ResponseBody
    public JsonData countTelCusByToday(PageQuery pageQuery, Integer deptId){
        PageResult<TelVisitForm> result = telVisitService.countTelCusByToday(pageQuery, deptId);
        return JsonData.success(result);
    }

    /**
     * 当月电访客户统计页面
     * @return
     */
    @RequestMapping("/monthTelForm.page")
    public ModelAndView monthTelForm() {
        return new ModelAndView("monthTelVisit");
    }

    /**
     * 当月本部门的电访统计
     * @param pageQuery
     * @param deptId
     * @return
     */
    @RequestMapping("/countTelCusByMonth.json")
    @ResponseBody
    public JsonData countTelCusByMonth(PageQuery pageQuery, Integer deptId, MonthVisitSearchForm visitSearchForm){
        PageResult<TelVisitForm> result = telVisitService.countTelCusByMonth(pageQuery, deptId, visitSearchForm);
        return JsonData.success(result);
    }


    /**
     * 当日电访客户统计页面
     * @return
     */
    @RequestMapping("/sumTodayTelForm.page")
    public ModelAndView sumTodayTelForm() {
        return new ModelAndView("sumTodayTelVisit");
    }


    /**
     * 当日所有部门电访客户合计数据载入
     * @param pageQuery
     * @param visitSearchForm
     * @return
     */
    @RequestMapping("sumByToday.json")
    @ResponseBody
    public JsonData sumTodayTelPageForm(PageQuery pageQuery, MonthVisitSearchForm visitSearchForm) {
        PageResult<TelVisitForm> result = telVisitService.sumTodayTelPageForm(pageQuery, visitSearchForm);
        return JsonData.success(result);
    }

    /**
     * 当月电访客户统计页面
     * @return
     */
    @RequestMapping("/sumMonthTelForm.page")
    public ModelAndView sumMonthTelForm() {
        return new ModelAndView("sumMonthTelVisit");
    }


    /**
     * 图表查询当日部门数据
     * @return
     */
    @RequestMapping("/countTelVisitInfoByToday.json")
    @ResponseBody
    public JsonData countTelVisitInfoByToday() {
        return JsonData.success(telVisitService.countTelVisitInfoByToday());
    }

    /**
     * 图表查询当月部门数据
     * @return
     */
    @RequestMapping("/countTelVisitInfoByMonth.json")
    @ResponseBody
    public JsonData countTelVisitInfoByMonth() {
        return JsonData.success(telVisitService.countTelVisitInfoByMonth());
    }

    /**
     * 所有电访客户页面跳转
     * @return
     */
    @RequestMapping("/findAllTelCusPage.page")
    public ModelAndView findAllTelCusPage() {
        return new ModelAndView("findAllTelCus");
    }

    /**
     * 当日所有部门电访客户合计数据载入
     * @param pageQuery
     * @param visitSearchForm
     * @return
     */
    @RequestMapping("findAllTelCus.json")
    @ResponseBody
    public JsonData findAllTelCus(PageQuery pageQuery, MonthVisitSearchForm visitSearchForm) {
        PageResult<TelVisitForm> result = telVisitService.findAllTelCus(pageQuery, visitSearchForm);
        return JsonData.success(result);
    }

    @RequestMapping("/timeOutTelVisitCus.json")
    @ResponseBody
    public JsonData timeOutTelVisitCus(PageQuery page, int deptId) {
        PageResult<TelVisitForm> result = telVisitService.timeOutTelVisitCus(page, deptId);
        return JsonData.success(result);
    }

    @RequestMapping("/updateTelCommonPool.json")
    @ResponseBody
    public JsonData updateTelCommonPool(TelVisitForm telVisitForm) {
        telVisitService.updateTelCommonPool(telVisitForm);
        return JsonData.success();
    }
}