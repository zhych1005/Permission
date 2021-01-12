package com.mmall.controller;

import com.mmall.model.SysUser;
import com.mmall.service.SysUserService;
import com.mmall.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: UserController
 * @date: 2019/05/15 14:50
 * @description: 用户的Controller
 */

@Controller
public class UserController {

    @Resource
    private SysUserService sysUserService;

    @RequestMapping("/logout.page")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        String path = "signin.jsp";
        response.sendRedirect(path);
    }

    @RequestMapping("/chKey.page")
    public void chKey(HttpServletResponse response) throws IOException {
        response.sendRedirect("chKey.jsp");
    }

    /**
     * 用户密码的修改
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping("/updateKey.page")
    public void updateKey(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String rePassword = request.getParameter("rePassword");
        Integer id = Integer.parseInt(request.getParameter("id"));

        SysUser sysUser = sysUserService.findById(id);
        String errorMsg = "";
        String ret = request.getParameter("ret");

        if (sysUser.getStatus() != 1) {
            errorMsg = "用户已被冻结，请联系管理员";
        } else if (!sysUser.getPassword().equals(MD5Util.encrypt(oldPassword))) {
            errorMsg = "原始密码错误，请重新输入";
        } else if (!newPassword.equals(rePassword)) {
            errorMsg = "新密码两次输入不一致，请重新输入";
        } else {
            sysUserService.updatePassword(id, rePassword);
            if (StringUtils.isNotBlank(ret)) {
                response.sendRedirect(ret);
            } else {
                response.sendRedirect("/login.page");
            }
            return;
        }
        request.setAttribute("error", errorMsg);
        if (StringUtils.isNotBlank(ret)) {
            request.setAttribute("ret", ret);
        }
        String path = "chKey.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }


    /**
     * 用户登录
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping("/login.page")
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        SysUser sysUser = sysUserService.findByKeyword(username);
        String errorMsg = "";
        String ret = request.getParameter("ret");

        if (StringUtils.isBlank(username)) {
            errorMsg = "用户名不可以为空";
        } else if (StringUtils.isBlank(password)) {
            errorMsg = "密码不可以为空";
        } else if (sysUser == null) {
            errorMsg = "查询不到指定的用户";
        } else if (!sysUser.getPassword().equals(MD5Util.encrypt(password))) {
            errorMsg = "用户名或密码错误";
        } else if (sysUser.getStatus() != 1) {
            errorMsg = "用户已被冻结，请联系管理员";
        } else {
            // login success
            request.getSession().setAttribute("user", sysUser);
            if (StringUtils.isNotBlank(ret)) {
                response.sendRedirect(ret);
            } else {
                response.sendRedirect("/admin/index.page");
            }
            return;
        }

        request.setAttribute("error", errorMsg);
        request.setAttribute("username", username);

        if (StringUtils.isNotBlank(ret)) {
            request.setAttribute("ret", ret);
        }
        String path = "signin.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }
}