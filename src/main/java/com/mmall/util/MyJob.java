package com.mmall.util;

import com.mmall.dao.SalesFormMapper;
import com.mmall.dao.TelVisitFormMapper;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: Superman
 * @projectName: Permission
 * @className: MyJob
 * @date: 2019/06/26 23:10
 * @description:
 */
@EnableScheduling
public class MyJob implements Job {

    public static int count = 1;

    @Autowired
    private SalesFormMapper salesFormMapper;

    @Autowired
    private TelVisitFormMapper telVisitFormMapper;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        SimpleDateFormat sb = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
        System.out.println("进入定时任务！");
        salesFormMapper.putCommonPoolCus();
        telVisitFormMapper.putCommonPoolTelCus();

        System.out.println(sb.format(new Date()) + " → " + "第" + count++ + "次执行");
    }
}