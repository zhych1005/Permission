package com.mmall.dao;

import com.mmall.model.Callback;
import com.mmall.model.SalesForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CallbackMapper {

    int deleteByPrimaryKey(Integer callId);

    int insert(Callback record);

    /**
     * 添加新的用户记录
     * @param record
     * @return
     */
    int insertSelective(Callback record);

    Callback selectByPrimaryKey(Integer callId);

    int updateByPrimaryKeySelective(Callback record);

    int updateByPrimaryKey(Callback record);

    /**
     * 查找当前客户的回访记录
     * @param callback
     * @return
     */
    List<Callback> findAllCallBackByCusName(@Param("callBack") Callback callback);

    /**
     * 公共池所属客户回访记录修改
     * @param salesForm
     */
    void updateCommonPoolCus(@Param("salesForm") SalesForm salesForm);
}