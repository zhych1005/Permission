package com.mmall.param;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: MonthVisitSearchForm
 * @date: 2019/06/17 16:36
 * @description:
 */
@Getter
@Setter
@ToString
public class MonthVisitSearchForm {

    private String cusPhone;

    private String deptName;

    private Integer deptId;

    private Integer cusstatus;

    private String cusname;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fromtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date totime;
}
