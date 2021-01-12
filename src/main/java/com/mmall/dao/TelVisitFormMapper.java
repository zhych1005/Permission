package com.mmall.dao;

import com.mmall.beans.PageQuery;
import com.mmall.model.SalesForm;
import com.mmall.model.TelVisitForm;
import com.mmall.param.MonthSearchForm;
import com.mmall.param.MonthVisitSearchForm;
import com.mmall.param.TelVisitPageParam;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface TelVisitFormMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TelVisitForm record);

    int insertSelective(TelVisitForm record);

    TelVisitForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TelVisitForm record);

    int updateByPrimaryKey(TelVisitForm record);

    /**
     * 修改用户的来访状态
     * @param cusname
     */
    void updateCusStatus(String cusname);


    /**
     * 页面加载参数
     * @param param
     * @return
     */
    int countTelVisitBySearchParam(@Param("param") TelVisitPageParam param);

    List<TelVisitForm> getTelVisitPageByUserId(@Param("param") TelVisitPageParam param, @Param("page") PageQuery page);

    /**
     * 用户重复性判断
     * @param cusPhone
     * @param id
     * @return
     */
    int countByTelCusPhone(@Param("cusPhone") String cusPhone, @Param("id") Integer id);


    /**
     * 获取本部门当日所有的数据
     * @param page
     * @param deptId
     * @return
     */
    List<TelVisitForm> countTelCusByToday(@Param("page") PageQuery page, @Param("deptId") Integer deptId);

    /**
     * 当日总数查询
     * @return
     */
    int countTelByToday(Integer deptId);

    /**
     * 获取当月所有的数据
     * @return
     */
    List<TelVisitForm> countTelCusByMonth(@Param("page") PageQuery page, @Param("deptId") Integer deptId, @Param("visitSearchForm") MonthVisitSearchForm visitSearchForm);

    /**
     * 当月总数查询
     * @param deptId
     * @param visitSearchForm
     * @return
     */
    int countTelByMonth(Integer deptId, @Param("visitSearchForm") MonthVisitSearchForm visitSearchForm);





    /**
     * 统计当天所有数据数量
     * @param visitSearchForm
     * @return
     */
    int sumTodayTelPageForm(@Param("visitSearchForm") MonthVisitSearchForm visitSearchForm);

    /**
     * 统计当日所有的数据
     * @param page
     * @param visitSearchForm
     * @return
     */
    List<TelVisitForm> sumTelCusByToday(@Param("page") PageQuery page, @Param("visitSearchForm") MonthVisitSearchForm visitSearchForm);


    /**
     * 图表查询当日部门数据
     * @return
     */
    List<Map> countTelVisitInfoByToday();

    /**
     * 图表查询当月部门数据
     * @return
     */
    List<Map> countTelVisitInfoByMonth();

    /**
     * 页面加载参数
     * @param searchForm
     * @return
     */
    int countAllTelCus(@Param("searchForm") MonthVisitSearchForm searchForm);


    List<TelVisitForm> findAllTelCus(@Param("searchForm") MonthVisitSearchForm searchForm, @Param("page") PageQuery page);


    /**
     * 修改电访客户表的更新时间
     * @param telForm
     */
    void updateTelVisit(@Param("telForm")TelVisitForm telForm);


    /**
     * 电访超时客户
     * @param deptId
     * @return
     */
    List<TelVisitForm> timeOutTelVisitCus(@Param("deptId") int deptId, @Param("page") PageQuery page);

    /**
     * 电访超时客户数量
     * @param deptId
     * @return
     */
    int countTimeOutTelVisitCus(@Param("deptId") int deptId);


    /**
     * 修改公共池的更新时间
     * @param id
     * @param updateTime
     */
    void updateCommonPoolTelUpdateTime(@Param("id") int id, @Param("updateTime") Date updateTime);

    /**
     * 将电访超期客户放入公共池
     */
    void putCommonPoolTelCus();

}