package com.mmall.param;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author: Superman
 * @projectName: Permission
 * @className: TelVisitAddParam
 * @date: 2019/06/14 22:17
 * @description:
 */

@ToString
@Getter
@Setter
public class TelVisitAddParam {
    private Integer id;

    private Integer deptId;

    private Integer userid;

    @NotBlank(message = "姓名")
    private String cusname;

    @NotNull(message = "客户性别")
    private Integer cussex;

    private String proxy;

    @NotBlank(message = "客户手机号")
    @Length(min = 11, max = 11, message = "手机号码必须为11位")
    private String cusPhone;

    @Length(min = 0, max = 12, message = "电话号码必须为8位(8位不含区号)或者12位(12位含区号)")
    private String custel;

    private String area;

    @NotBlank(message = "获知途径")
    private String grundlagen;

    @NotBlank(message = "面积")
    private String acreage;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date operatortime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;

    @NotBlank(message = "关注点")
    private String focus;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date timeOfVisit;

    @NotNull(message = "客户状态")
    private Integer cusstatus;

    private String remark;
}
