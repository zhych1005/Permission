package com.mmall.controller;

import com.mmall.common.JsonData;
import com.mmall.model.Callback;
import com.mmall.service.CallbackService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: CallbackController
 * @date: 2019/07/01 17:29
 * @description:
 */
@Controller
@RequestMapping("/callBack")
public class CallbackController {

    @Resource
    private CallbackService callbackService;

    @RequestMapping("/addCallBack.json")
    @ResponseBody
    public JsonData addCallBack(Callback callback) {
        callbackService.addCallBack(callback);
        return JsonData.success();
    }

    @RequestMapping("/findAllCallBackByCusName.json")
    @ResponseBody
    public JsonData findAllCallBackByCusName(Callback callback) {
        return JsonData.success(callbackService.findAllCallBackByCusName(callback));
    }
}