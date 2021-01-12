package com.mmall.dao;

import com.mmall.model.SalesForm;
import com.mmall.model.TelCallBack;
import com.mmall.model.TelVisitForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TelCallBackMapper {
    int deleteByPrimaryKey(Integer telCallId);

    int insert(TelCallBack record);

    /**
     * 添加新的电访客户的回访记录
     * @param record
     * @return
     */
    int insertSelective(TelCallBack record);

    TelCallBack selectByPrimaryKey(Integer telCallId);

    int updateByPrimaryKeySelective(TelCallBack record);

    int updateByPrimaryKey(TelCallBack record);

    /**
     * 查找当前客户的回访记录
     * @param telCallBack
     * @return
     */
    List<TelCallBack> findTelCallBackByCusName(@Param("telCallBack") TelCallBack telCallBack);

    /**
     * 修改电访客户的回访疾苦所属
     * @param telVisitForm
     */
    void updateTelCommonPoolCus(@Param("telVisitForm") TelVisitForm telVisitForm);
}