package com.mmall.controller;

import com.mmall.common.JsonData;
import com.mmall.model.TelCallBack;
import com.mmall.service.TelCallBackService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: TelCallBackController
 * @date: 2019/07/02 16:43
 * @description:
 */
@Controller
@RequestMapping("/TelCallBack")
public class TelCallBackController {

    @Resource
    private TelCallBackService telCallBackService;

    @RequestMapping("/addTelCallBack.json")
    @ResponseBody
    public JsonData addTelCallBack(TelCallBack telCallBack) {
        telCallBackService.addTelCallBack(telCallBack);
        return JsonData.success();
    }

    @RequestMapping("/findTelCallBackByCusName.json")
    @ResponseBody
    public JsonData findTelCallBackByCusName(TelCallBack telCallBack) {
        return JsonData.success(telCallBackService.findTelCallBackByCusName(telCallBack));
    }
}