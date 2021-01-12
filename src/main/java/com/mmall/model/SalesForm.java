package com.mmall.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.DecimalMin;
import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@JsonInclude(value= JsonInclude.Include.NON_NULL)
public class SalesForm {

    private Integer id;

    private Integer deptId;

    private Integer userid;

    @NotBlank(message = "客户的姓名")
    private String cusname;

    private String proxy;

    @NotBlank(message = "客户性别")
    private Integer cussex;

    @NotBlank(message = "客户的手机号不可以为空")
    @Length(min = 11, max = 11, message = "手机号码必须为11位")
    private String cusPhone;

    @Length(min = 8, max = 12, message = "电话号码必须为8位(8位不含区号)或者12位(12位含区号)")
    private String custel;

    @NotBlank(message = "客户的状态")
    private Integer cusstatus;

    private String operator;

    private Date operatortime;

    private Date updateTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfContract;

    private String ownProperty;

    private String operatorip;

    private String age;

    @NotBlank(message = "客户的职业")
    private String profession;

    @NotBlank(message = "置业用途")
    private String purpose;

    @NotBlank(message = "客户所在的区域")
    private String area;

    private String familyStructure;

    private String placeOfDomicile;

    private String maritalStatus;

    @NotBlank(message = "是否限购")
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

    private String callRemark;

    private String name;

    private SalesForm salesForm1;
}