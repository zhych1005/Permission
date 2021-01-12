package com.mmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author: Administrator
 * @projectName: Permission
 * @className: AdminController
 * @date: 2019/05/14 14:33
 * @description:
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("index.page")
    public ModelAndView index() {
        return new ModelAndView("admin");
    }

    @RequestMapping("first.page")
    public ModelAndView dashboard() {
        return new ModelAndView("dashboard");
    }

    @RequestMapping("totalData.page")
    public ModelAndView totalData() {
        return new ModelAndView("totalData");
    }
}