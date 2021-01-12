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
 * @author: Administrator
 * @projectName: Permission
 * @className: SalesFormParam
 * @date: 2019/05/29 17:08
 * @description: 销售经理添加客户的字段
 */
@ToString
@Getter
@Setter
public class SalesFormParam {

    private Integer id;

    private Integer deptId;

    private Integer userid;

    @NotBlank(message = "客户姓名")
    private String cusname;

    private String proxy;

    @NotNull(message = "客户性别")
    private Integer cussex;

    @NotBlank(message = "客户的手机号")
    @Length(min = 11, max = 11, message = "手机号码必须为11位")
    private String cusPhone;

    @Length(min = 0, max = 12, message = "电话号码必须为8位(8位不含区号)或者12位(12位含区号)")
    private String custel;

    @NotNull(message = "客户状态")
    private Integer cusstatus;

    private Date updateTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfContract;

    private String ownProperty;

    private String age;

    @NotBlank(message = "客户职业")
    private String profession;

    @NotBlank(message = "置业目的")
    private String purpose;

    @NotBlank(message = "客户所在区域")
    private String area;

    private String familyStructure;

    private String placeOfDomicile;

    private String maritalStatus;

    @NotBlank(message = "限购状态")
    private String restrictedPurchase;

    private String remark;

    @NotBlank(message = "首访渠道")
    private String firstVisit;

    private String paymentMethod;

    @NotBlank(message = "关注点")
    private String focus;

    private String defect;

    @NotBlank(message = "意向户型")
    private String desirable;

    @NotBlank(message = "意向价位")
    private String price;

    private Integer cusSource;
}