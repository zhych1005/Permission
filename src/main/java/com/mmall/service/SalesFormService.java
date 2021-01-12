package com.mmall.service;

import com.google.common.base.Preconditions;
import com.mmall.beans.PageQuery;
import com.mmall.beans.PageResult;
import com.mmall.common.RequestHolder;
import com.mmall.dao.CallbackMapper;
import com.mmall.dao.SalesFormMapper;
import com.mmall.dao.TelVisitFormMapper;
import com.mmall.exception.ParamException;
import com.mmall.model.SalesForm;
import com.mmall.model.SysUser;
import com.mmall.param.MonthSearchForm;
import com.mmall.param.SalesFormParam;
import com.mmall.param.SearchFormParam;
import com.mmall.util.BeanValidator;
import com.mmall.util.IpUtil;
import com.mmall.util.MainScheduler;
import org.apache.commons.lang3.StringUtils;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: SalesFormService
 * @date: 2019/05/29 9:41
 * @description: 销售人员客户的录入表单
 */

@Service
public class SalesFormService {

    @Resource
    private SalesFormMapper salesFormMapper;

    @Resource
    private TelVisitFormMapper telVisitFormMapper;

    @Resource
    private CallbackMapper callbackMapper;

    /**
     * 客户的添加方法
     *
     * @param param
     */
    public void cusSave(SalesFormParam param) {
        BeanValidator.check(param);
        if (checkCustelExist(param.getCusPhone(), param.getId())) {
            throw new ParamException("该客户已存在、无法添加 !");
        }
        SalesForm salesForm = SalesForm.builder().deptId(param.getDeptId()).userid(param.getUserid()).cusname(param.getCusname()).proxy(param.getProxy()).firstVisit(param.getFirstVisit())
                .cussex(param.getCussex()).custel(param.getCustel()).cusPhone(param.getCusPhone()).cusstatus(param.getCusstatus()).orderDate(param.getOrderDate()).paymentMethod(param.getPaymentMethod())
                .dateOfContract(param.getDateOfContract()).ownProperty(param.getOwnProperty()).age(param.getAge()).profession(param.getProfession()).focus(param.getFocus()).defect(param.getDefect())
                .purpose(param.getPurpose()).area(param.getArea()).familyStructure(param.getFamilyStructure()).placeOfDomicile(param.getPlaceOfDomicile()).desirable(param.getDesirable()).price(param.getPrice())
                .maritalStatus(param.getMaritalStatus()).restrictedPurchase(param.getRestrictedPurchase()).remark(param.getRemark()).cusSource(param.getCusSource()).build();
        salesForm.setOperator(RequestHolder.getCurrentUser().getUsername());
        salesForm.setOperatorip(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        salesForm.setOperatortime(new Date());
        salesForm.setUpdateTime(new Date());
        /*修改电转访的客户状态*/
        if (salesForm.getCusSource() > 1) {
            telVisitFormMapper.updateCusStatus(param.getCusname());
        }
        salesFormMapper.insertSelective(salesForm);
    }

    /**
     * 用户的修改方法
     *
     * @param param
     */
    public void cusUpdate(SalesFormParam param) {
        BeanValidator.check(param);
        SalesForm before = salesFormMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的客户不存在");
        SalesForm after = SalesForm.builder().id(param.getId()).deptId(param.getDeptId()).userid(param.getUserid()).cusname(param.getCusname()).proxy(param.getProxy()).firstVisit(param.getFirstVisit())
                .cussex(param.getCussex()).custel(param.getCustel()).cusPhone(param.getCusPhone()).cusstatus(param.getCusstatus()).orderDate(param.getOrderDate()).paymentMethod(param.getPaymentMethod())
                .dateOfContract(param.getDateOfContract()).ownProperty(param.getOwnProperty()).age(param.getAge()).profession(param.getProfession()).focus(param.getFocus()).defect(param.getDefect())
                .purpose(param.getPurpose()).area(param.getArea()).familyStructure(param.getFamilyStructure()).placeOfDomicile(param.getPlaceOfDomicile()).desirable(param.getDesirable()).price(param.getPrice())
                .maritalStatus(param.getMaritalStatus()).restrictedPurchase(param.getRestrictedPurchase()).remark(param.getRemark()).cusSource(param.getCusSource()).updateTime(param.getUpdateTime()).build();
        after.setOperator(RequestHolder.getCurrentUser().getUsername());
        after.setOperatorip(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        salesFormMapper.updateByPrimaryKeySelective(after);
    }

    /**
     * 用户重复性判断
     *
     * @param cusPhone
     * @param id
     * @return
     */
    public boolean checkCustelExist(String cusPhone, Integer id) {
        return salesFormMapper.countByCusPhone(cusPhone, id) > 0;
    }

    /**
     * @param param
     * @param page
     * @return
     */
    public PageResult<SalesForm> getPageByUserId(SearchFormParam param, PageQuery page) {
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
        int count = salesFormMapper.countBySearchParam(param);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.getPageByUserId(param, page);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }

    /**
     * 查询当天的所有数据
     *
     * @return
     */
    public PageResult<SalesForm> countCusByToday(PageQuery page, Integer deptId) {
        BeanValidator.check(page);
        int count = salesFormMapper.countByToday(deptId);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.countCusByToday(page, deptId);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }

    /**
     * 查询当月的所有数据
     *
     * @return
     */
    public PageResult<SalesForm> countCusByMonth(PageQuery page, Integer deptId, MonthSearchForm searchForm) {
        BeanValidator.check(page);
        searchForm.setCusstatus(searchForm.getCusstatus());
        if (StringUtils.isNotBlank(searchForm.getCusname())) {
            searchForm.setCusname("%" + searchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getDeptName())) {
            searchForm.setDeptName("%" + searchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getCusPhone())) {
            searchForm.setCusPhone("%" + searchForm.getCusPhone() + "%");
        }

        if (searchForm.getFromtime() != null) {
            searchForm.setFromtime(searchForm.getFromtime());
        }

        if (searchForm.getTotime() != null) {
            searchForm.setTotime(searchForm.getTotime());
        }
        int count = salesFormMapper.countByMonth(deptId, searchForm);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.countCusByMonth(page, deptId, searchForm);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }


    /**
     * 统计当月的所有数据
     *
     * @return
     */
    public PageResult<SalesForm> sumCusByToday(PageQuery page, MonthSearchForm searchForm) {
        BeanValidator.check(page);
        searchForm.setCusstatus(searchForm.getCusstatus());
        if (StringUtils.isNotBlank(searchForm.getCusname())) {
            searchForm.setCusname("%" + searchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getDeptName())) {
            searchForm.setDeptName("%" + searchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getCusPhone())) {
            searchForm.setCusPhone("%" + searchForm.getCusPhone() + "%");
        }

        if (searchForm.getFromtime() != null) {
            searchForm.setFromtime(searchForm.getFromtime());
        }

        if (searchForm.getTotime() != null) {
            searchForm.setTotime(searchForm.getTotime());
        }
        int count = salesFormMapper.sumByToday(searchForm);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.sumCusByToday(page, searchForm);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }


    /**
     * 图表查询当日部门数据
     *
     * @return
     */
    public List<Map> countVisitInfoByToday() {
        return salesFormMapper.countVisitInfoByToday();
    }

    /**
     * 图表查询当月部门数据
     *
     * @return
     */
    public List<Map> countVisitInfoByMonth() {
        return salesFormMapper.countVisitInfoByMonth();
    }

    /**
     * 当月每日成交量走势
     *
     * @return
     */
    public List<Map> countSuccessfulCus() {
        return salesFormMapper.countSuccessfulCus();
    }

    /**
     * 当月排名前10的业务员
     *
     * @return
     */
    public List<Map> countTenByUser() {
        return salesFormMapper.countTenByUser();
    }

    /**
     * 统计当月的所有数据
     *
     * @return
     */
    public PageResult<SalesForm> findAllCus(PageQuery page, MonthSearchForm searchForm) {
        BeanValidator.check(page);
        if (StringUtils.isNotBlank(searchForm.getCusname())) {
            searchForm.setCusname("%" + searchForm.getCusname() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getDeptName())) {
            searchForm.setDeptName("%" + searchForm.getDeptName() + "%");
        }

        if (StringUtils.isNotBlank(searchForm.getCusPhone())) {
            searchForm.setCusPhone("%" + searchForm.getCusPhone() + "%");
        }

        if (searchForm.getFromtime() != null) {
            searchForm.setFromtime(searchForm.getFromtime());
        }

        if (searchForm.getTotime() != null) {
            searchForm.setTotime(searchForm.getTotime());
        }

        if (searchForm.getCusstatus() != null) {
            searchForm.setCusstatus(searchForm.getCusstatus());
        }
        int count = salesFormMapper.countAllCus(searchForm);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.findAllCus(searchForm, page);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }

    @PostConstruct
    public void startQ() throws SchedulerException {
        MainScheduler.start();
    }

    /**
     * 查询超期的来访客户
     *
     * @param deptId
     * @return
     */
    public PageResult<SalesForm> timeOutVisitCus(int deptId, PageQuery page) {
        BeanValidator.check(page);
        int count = salesFormMapper.countTimeOutVisitCus(deptId);
        if (count > 0) {
            List<SalesForm> list = salesFormMapper.timeOutVisitCus(deptId, page);
            return PageResult.<SalesForm>builder().total(count).data(list).build();
        }
        return PageResult.<SalesForm>builder().build();
    }

    /**
     * 获取公共池客户
     * @param salesForm
     */
    public void updateVisitCommonPool(SalesForm salesForm) {
        /*公共池客户回去判断*/
        int count = salesFormMapper.judgeTimeOutVisitCus(salesForm);
        if (count == 0) {
            throw new ParamException("不好意思手慢了, 被别的顾问抢走了！");
        }
        salesFormMapper.updateByPrimaryKeySelective(salesForm);
        salesFormMapper.updateCommonPoolUpdateTime(salesForm.getId(), new Date());
        callbackMapper.updateCommonPoolCus(salesForm);
    }



    /*顾问图表页~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    /**
     * 月度顾问接访量
     *
     * @return
     */
    public List<Map> deptVisitByMon() {
        SysUser dept = new SysUser();
        dept.setDeptId(RequestHolder.getCurrentUser().getDeptId());
        return salesFormMapper.deptVisitByMon(dept);
    }


    /**
     * 年度顾问成交量
     *
     * @return
     */
    public List<Map> annualTurnover() {
        SysUser dept = new SysUser();
        dept.setDeptId(RequestHolder.getCurrentUser().getDeptId());
        return salesFormMapper.annualTurnover(dept);
    }

    /**
     * 月度部门成交量排行
     *
     * @return
     */
    public List<Map> monthDealByDept() {
        SysUser dept = new SysUser();
        dept.setDeptId(RequestHolder.getCurrentUser().getDeptId());
        return salesFormMapper.monthDealByDept(dept);
    }

    /**
     * 本部门每个人的成交率
     * @return
     */
    public List<Map> findDepartmentPerformanceByOne() {
        SysUser dept = new SysUser();
        dept.setDeptId(RequestHolder.getCurrentUser().getDeptId());
        return salesFormMapper.findDepartmentPerformanceByOne(dept);
    }
}