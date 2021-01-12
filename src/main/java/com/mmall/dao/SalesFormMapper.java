package com.mmall.dao;

import com.mmall.beans.PageQuery;
import com.mmall.model.SalesForm;
import com.mmall.model.SysUser;
import com.mmall.param.MonthSearchForm;
import com.mmall.param.SearchFormParam;
import org.apache.ibatis.annotations.Param;


import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SalesFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SalesForm record);

    int insertSelective(SalesForm record);

    SalesForm selectByPrimaryKey(Integer id);

    /**
     * 用户公共池客户所属修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(SalesForm record);

    int updateByPrimaryKey(SalesForm record);

    /**
     * 公共池客户重复操作判断
     * @param salesForm
     * @return
     */
    int judgeTimeOutVisitCus(@Param("salesForm") SalesForm salesForm);

    /**
     * 用户重复性判断
     *
     * @param cusPhone
     * @param id
     * @return
     */
    int countByCusPhone(@Param("cusPhone") String cusPhone, @Param("id") Integer id);

    /**
     * 获取当日所有的数据
     *
     * @return
     */
    List<SalesForm> countCusByToday(@Param("page") PageQuery page, @Param("deptId") Integer deptId);

    /**
     * 当日总数查询
     *
     * @return
     */
    int countByToday(Integer deptId);

    /**
     * 获取当月所有的数据
     *
     * @return
     */
    List<SalesForm> countCusByMonth(@Param("page") PageQuery page, @Param("deptId") Integer deptId, @Param("searchForm") MonthSearchForm searchForm);

    /**
     * 当月总数查询
     *
     * @return
     */
    int countByMonth(Integer deptId, @Param("searchForm") MonthSearchForm searchForm);


    /**
     * 页面加载参数
     *
     * @param param
     * @return
     */
    int countBySearchParam(@Param("param") SearchFormParam param);


    List<SalesForm> getPageByUserId(@Param("param") SearchFormParam param, @Param("page") PageQuery page);


    /**
     * 统计当日来访客户总数
     *
     * @param searchForm
     * @return
     */
    int sumByToday(@Param("searchForm") MonthSearchForm searchForm);

    /**
     * 统计当日来访客户
     *
     * @param page
     * @param searchForm
     * @return
     */
    List<SalesForm> sumCusByToday(@Param("page") PageQuery page, @Param("searchForm") MonthSearchForm searchForm);


    /**
     * 图表查询当日部门数据
     *
     * @return
     */
    List<Map> countVisitInfoByToday();

    /**
     * 图表查询当月部门数据
     *
     * @return
     */
    List<Map> countVisitInfoByMonth();


    /**
     * 当月成交走势图
     *
     * @param
     * @return
     */
    List<Map> countSuccessfulCus();

    /**
     * 当月排名前10的业务员
     *
     * @return
     */
    List<Map> countTenByUser();

    /**
     * 查询当月总数
     *
     * @param searchForm
     * @return
     */
    int countAllCus(@Param("searchForm") MonthSearchForm searchForm);


    /**
     * 分页查找数据
     *
     * @param searchForm
     * @param page
     * @return
     */
    List<SalesForm> findAllCus(@Param("searchForm") MonthSearchForm searchForm, @Param("page") PageQuery page);

    /**
     * 修改来访客户表的回访更新时间
     */
    void updateVisit(@Param("form")SalesForm form);

    /**
     * 查询超期的本部门的来访客户
     * @param deptId
     * @return
     */
    List<SalesForm> timeOutVisitCus(@Param("deptId") int deptId, @Param("page") PageQuery page);

    /**
     * 查找超时来访客户数量
     * @param deptId
     * @return
     */
    int countTimeOutVisitCus(@Param("deptId")int deptId);

    /**
     * 修改公共池的更新时间
     */
    void updateCommonPoolUpdateTime(@Param("id") int id, @Param("updateTime") Date updateTime);

    /**
     * 将超期客户放入公共池
     */
    void putCommonPoolCus();

    /**
     * 本部门当月顾问接访量
     * @param user
     * @return
     */
    List<Map> deptVisitByMon(@Param("user") SysUser user);

    /**
     * 本部门年度顾问成交量
     * @param user
     * @return
     */
    List<Map> annualTurnover(@Param("user") SysUser user);

    /**
     * 本月本部门成交量
     * @param user
     * @return
     */
    List<Map> monthDealByDept(@Param("user") SysUser user);

    /**
     * 本部门每个人的成交率
     * @param user
     * @return
     */
    List<Map> findDepartmentPerformanceByOne(@Param("user") SysUser user);
}