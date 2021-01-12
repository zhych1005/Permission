package com.mmall.service;

import com.mmall.dao.CallbackMapper;
import com.mmall.dao.SalesFormMapper;
import com.mmall.model.Callback;
import com.mmall.model.SalesForm;
import com.mmall.util.BeanValidator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: CallbackService
 * @date: 2019/07/01 17:04
 * @description:
 */
@Service
public class CallbackService {
    @Resource
    private CallbackMapper callbackMapper;

    @Resource
    private SalesFormMapper salesFormMapper;

    /**
     * 新增客户的回访时间，修改客户表的更新时间
     * @param callback
     */
    public void addCallBack(Callback callback) {
        SimpleDateFormat sb = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        BeanValidator.check(callback);
        Callback call = Callback.builder().cusId(callback.getCusId()).cusname(callback.getCusname()).deptId(callback.getDeptId()).userid(callback.getUserid())
                .username(callback.getUsername()).build();
        call.setVisitTime(new Date());
        call.setFlag(1);
        call.setRemark(sb.format(new Date()) + " : " + callback.getRemark() + '\r' + '\n');
        callbackMapper.insertSelective(call);
        SalesForm salesForm = new SalesForm();
        salesForm.setUpdateTime(call.getVisitTime());
        salesForm.setId(call.getCusId());
        salesFormMapper.updateVisit(salesForm);
    }

    /**
     * 查询当前用户的客户的更新记录
     * @param callback
     * @return
     */
    public List<Callback> findAllCallBackByCusName(Callback callback) {
        return callbackMapper.findAllCallBackByCusName(callback);
    }
}