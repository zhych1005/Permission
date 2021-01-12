package com.mmall.service;

import com.google.common.base.Preconditions;
import com.mmall.beans.PageQuery;
import com.mmall.beans.PageResult;
import com.mmall.common.RequestHolder;
import com.mmall.dao.TelCallBackMapper;
import com.mmall.dao.TelVisitFormMapper;
import com.mmall.exception.ParamException;
import com.mmall.model.TelVisitForm;
import com.mmall.param.MonthVisitSearchForm;
import com.mmall.param.TelVisitAddParam;
import com.mmall.param.TelVisitPageParam;
import com.mmall.util.BeanValidator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: TelVisitService
 * @date: 2019/06/14 18:47
 * @description:
 */

@Service
public class TelVisitService {

    @Resource
    private TelVisitFormMapper telVisitFormMapper;

    @Resource
    private TelCallBackMapper telCallBackMapper;

    /**
     * 页面载入条件
     * @param param
     * @param page
     * @return
     */
    public PageResult<TelVisitForm> getTelVisitPageByUserId(TelVisitPageParam param, PageQuery page) {
        BeanValidator.check(page);
        param.setUserid(param.getUserid());
        param.setCusstatus(param.getCusstatus());

        if (StringUtils.isNotBlank(param.getCusname())) {
            param.setCusname("%" + param.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(param.getCusPhone())) {
            param.setCusPhone("%" + param.getCusPhone() + "%");
        }

        if (param.getFromtime() != null) {
            param.setFromtime(param.getFromtime());
        }

        if (param.getTotime() != null) {
            param.setTotime(param.getTotime());
        }
        int count = telVisitFormMapper.countTelVisitBySearchParam(param);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.getTelVisitPageByUserId(param, page);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }

    /**
     * 电访客户的表单添加
     * @param param
     */
    public void telCusSave(TelVisitAddParam param) {

        BeanValidator.check(param);
        if (checkTelCustelExist(param.getCusPhone(), param.getId())){
            throw new ParamException("该用户已存在，无法添加！");
        }
        TelVisitForm visitForm = TelVisitForm.builder().deptId(param.getDeptId()).userid(param.getUserid())
                .cusname(param.getCusname()).cussex(param.getCussex()).proxy(param.getProxy())
                .cusPhone(param.getCusPhone()).custel(param.getCustel()).area(param.getArea())
                .grundlagen(param.getGrundlagen()).acreage(param.getAcreage()).focus(param.getFocus())
                .remark(param.getRemark()).timeOfVisit(param.getTimeOfVisit()).cusstatus(param.getCusstatus())
                .build();
        visitForm.setOperator(RequestHolder.getCurrentUser().getUsername());
        visitForm.setOperatortime(new Date());
        visitForm.setUpdateTime(new Date());

        telVisitFormMapper.insertSelective(visitForm);
    }

    /**
     * 电访客户更新操作
     * @param param
     */
    public void telCusUpdate(TelVisitAddParam param) {
        BeanValidator.check(param);
        TelVisitForm before = telVisitFormMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before,"待更新的客户不存在!");
        TelVisitForm after = TelVisitForm.builder().id(param.getId()).deptId(param.getDeptId()).userid(param.getUserid())
                .cusname(param.getCusname()).cussex(param.getCussex()).proxy(param.getProxy())
                .cusPhone(param.getCusPhone()).custel(param.getCustel()).area(param.getArea())
                .grundlagen(param.getGrundlagen()).acreage(param.getAcreage()).focus(param.getFocus())
                .remark(param.getRemark()).timeOfVisit(param.getTimeOfVisit()).cusstatus(param.getCusstatus())
                .build();
        after.setOperator(RequestHolder.getCurrentUser().getUsername());
        telVisitFormMapper.updateByPrimaryKeySelective(after);
    }

    public boolean checkTelCustelExist(String cusPhone, Integer id) {
        return telVisitFormMapper.countByTelCusPhone(cusPhone, id) > 0;
    }

    /**
     * 查询本部门当日的所有客户
     * @param page
     * @param deptId
     * @return
     */
    public PageResult<TelVisitForm> countTelCusByToday(PageQuery page, Integer deptId){
        BeanValidator.check(page);
        int count = telVisitFormMapper.countTelByToday(deptId);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.countTelCusByToday(page, deptId);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }

    /**
     * 查询本部门当月的所有客户
     * @param page
     * @param deptId
     * @return
     */
    public PageResult<TelVisitForm> countTelCusByMonth(PageQuery page, Integer deptId, MonthVisitSearchForm visitSearchForm) {
        BeanValidator.check(page);
        visitSearchForm.setCusstatus(visitSearchForm.getCusstatus());
        if (StringUtils.isNotBlank(visitSearchForm.getCusname())) {
            visitSearchForm.setCusname("%" + visitSearchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getDeptName())) {
            visitSearchForm.setDeptName("%" + visitSearchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getCusPhone())) {
            visitSearchForm.setCusPhone("%" + visitSearchForm.getCusPhone() + "%");
        }

        if (visitSearchForm.getFromtime() != null) {
            visitSearchForm.setFromtime(visitSearchForm.getFromtime());
        }

        if (visitSearchForm.getTotime() != null) {
            visitSearchForm.setTotime(visitSearchForm.getTotime());
        }
        int count = telVisitFormMapper.countTelByMonth(deptId, visitSearchForm);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.countTelCusByMonth(page, deptId, visitSearchForm);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }


    /**
     * 查询本部门当日的所有客户
     * @param page
     * @param visitSearchForm
     * @return
     */
    public PageResult<TelVisitForm> sumTodayTelPageForm(PageQuery page, MonthVisitSearchForm visitSearchForm) {
        BeanValidator.check(page);
        visitSearchForm.setCusstatus(visitSearchForm.getCusstatus());
        if (StringUtils.isNotBlank(visitSearchForm.getCusname())) {
            visitSearchForm.setCusname("%" + visitSearchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getDeptName())) {
            visitSearchForm.setDeptName("%" + visitSearchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getCusPhone())) {
            visitSearchForm.setCusPhone("%" + visitSearchForm.getCusPhone() + "%");
        }

        if (visitSearchForm.getFromtime() != null) {
            visitSearchForm.setFromtime(visitSearchForm.getFromtime());
        }

        if (visitSearchForm.getTotime() != null) {
            visitSearchForm.setTotime(visitSearchForm.getTotime());
        }
        int count = telVisitFormMapper.sumTodayTelPageForm(visitSearchForm);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.sumTelCusByToday(page,visitSearchForm);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }


    /**
     * 图表查询当日部门数据
     * @return
     */
    public List<Map> countTelVisitInfoByToday(){
        return telVisitFormMapper.countTelVisitInfoByToday();
    }

    /**
     * 图表查询当月部门数据
     * @return
     */
    public List<Map> countTelVisitInfoByMonth(){
        return telVisitFormMapper.countTelVisitInfoByMonth();
    }


    /**
     * 查询本部门当日的所有客户
     * @param page
     * @param visitSearchForm
     * @return
     */
    public PageResult<TelVisitForm> findAllTelCus(PageQuery page, MonthVisitSearchForm visitSearchForm) {
        BeanValidator.check(page);
        visitSearchForm.setCusstatus(visitSearchForm.getCusstatus());
        if (StringUtils.isNotBlank(visitSearchForm.getCusname())) {
            visitSearchForm.setCusname("%" + visitSearchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getDeptName())) {
            visitSearchForm.setDeptName("%" + visitSearchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(visitSearchForm.getCusPhone())) {
            visitSearchForm.setCusPhone("%" + visitSearchForm.getCusPhone() + "%");
        }

        if (visitSearchForm.getFromtime() != null) {
            visitSearchForm.setFromtime(visitSearchForm.getFromtime());
        }

        if (visitSearchForm.getTotime() != null) {
            visitSearchForm.setTotime(visitSearchForm.getTotime());
        }
        int count = telVisitFormMapper.countAllTelCus(visitSearchForm);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.findAllTelCus(visitSearchForm, page);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }

    /**
     * 电访超时客户
     * @param deptId
     * @return
     */
    public PageResult<TelVisitForm> timeOutTelVisitCus(PageQuery page, int deptId) {
        BeanValidator.check(page);
        int count = telVisitFormMapper.countTimeOutTelVisitCus(deptId);
        if (count > 0) {
            List<TelVisitForm> list = telVisitFormMapper.timeOutTelVisitCus(deptId, page);
            return PageResult.<TelVisitForm>builder().total(count).data(list).build();
        }
        return PageResult.<TelVisitForm>builder().build();
    }

    /**
     * 电访客户公共池相关操作
     * @param telVisitForm
     */
    public void updateTelCommonPool(TelVisitForm telVisitForm){
        telVisitFormMapper.updateByPrimaryKeySelective(telVisitForm);
        telVisitFormMapper.updateCommonPoolTelUpdateTime(telVisitForm.getId(), new Date());
        telCallBackMapper.updateTelCommonPoolCus(telVisitForm);
    }
}