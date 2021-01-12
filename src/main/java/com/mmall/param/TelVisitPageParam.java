package com.mmall.param;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: TelVisitPageParam
 * @date: 2019/06/14 18:27
 * @description:
 */
@Setter
@Getter
@ToString
public class TelVisitPageParam {

    private String cusPhone;

    private Integer userid;

    private Integer deptId;

    private Integer cusstatus;

    private String cusname;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fromtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date totime;
}