package com.mmall.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@JsonInclude(value= JsonInclude.Include.NON_NULL)
public class TelVisitForm {
    private Integer id;

    private Integer deptId;

    private Integer userid;

    private String cusname;

    private Integer cussex;

    private String proxy;

    private String cusPhone;

    private String custel;

    private String area;

    private String grundlagen;

    private String acreage;

    private String focus;

    private String operator;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date operatortime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date timeOfVisit;

    private Integer cusstatus;

    private String remark;

    private String telCallRemark;

    private String name;
}