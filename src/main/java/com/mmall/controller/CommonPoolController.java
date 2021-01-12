package com.mmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: CommonPoolController
 * @date: 2019/07/05 15:42
 * @description:
 */

@Controller
@RequestMapping("/common")
public class CommonPoolController {

    @RequestMapping("/visitCommonPool.page")
    public ModelAndView visitCommonPool() {
        return new ModelAndView("visitCommonPool");
    }

    @RequestMapping("/telCommonPool.page")
    public ModelAndView telCommonPool() {
        return new ModelAndView("telCommonPool");
    }
}
