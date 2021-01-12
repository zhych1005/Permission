package com.mmall.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@JsonInclude(value= JsonInclude.Include.NON_NULL)
public class TelCallBack {
    private Integer telCallId;

    private Integer cusId;

    private Integer deptId;

    private Integer userid;

    private String username;

    private String cusname;

    private Date visitTime;

    @NotBlank(message = "回访记录")
    private String remark;

    private Integer flag;
}