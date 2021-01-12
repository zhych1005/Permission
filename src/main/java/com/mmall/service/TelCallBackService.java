package com.mmall.service;

import com.mmall.dao.TelCallBackMapper;
import com.mmall.dao.TelVisitFormMapper;
import com.mmall.model.TelCallBack;
import com.mmall.model.TelVisitForm;
import com.mmall.util.BeanValidator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: TelCallBackService
 * @date: 2019/07/02 16:24
 * @description:
 */

@Service
public class TelCallBackService {

    @Resource
    private TelCallBackMapper telCallBackMapper;

    @Resource
    private TelVisitFormMapper telVisitFormMapper;

    /**
     * 新增电访客户的回访记录，修改电访客户表的更新时间
     * @param telCallBack
     */
    public void addTelCallBack(TelCallBack telCallBack) {
        SimpleDateFormat sb = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        BeanValidator.check(telCallBack);
        TelCallBack telCall = TelCallBack.builder().cusId(telCallBack.getCusId()).cusname(telCallBack.getCusname()).deptId(telCallBack.getDeptId())
                .userid(telCallBack.getUserid()).username(telCallBack.getUsername()).build();
        telCall.setVisitTime(new Date());
        telCall.setFlag(1);
        telCall.setRemark("☆" + sb.format(new Date()) + " : " + telCallBack.getRemark() + '\r' + '\n');
        telCallBackMapper.insertSelective(telCall);
        TelVisitForm telVisitForm = new TelVisitForm();
        telVisitForm.setUpdateTime(telCall.getVisitTime());
        telVisitForm.setId(telCall.getCusId());
        telVisitFormMapper.updateTelVisit(telVisitForm);
    }

    public List<TelCallBack> findTelCallBackByCusName(TelCallBack telCallBack) {
        return telCallBackMapper.findTelCallBackByCusName(telCallBack);
    }
}