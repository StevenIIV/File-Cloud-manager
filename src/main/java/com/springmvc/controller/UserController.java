package com.springmvc.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.springmvc.model.User;
import com.springmvc.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession=request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;setchar=UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        int id=userService.checkUser(username,password);
        //return String转到page控制器的弹窗中文就是一团问号，没办法了
        if(id==-1){
            out.print("<script language='javascript'>alert('用户名或密码错误');window.location.href='/web/';</script>");
        }
        else{
            User user=userService.getUser(id);
            httpSession.setAttribute("user",user);
            out.print("<script language='javascript'>alert('登陆成功');window.location.href='/web/mainContent';</script>");
        }
    }
    @RequestMapping(value = "/resetPassword.do",method = RequestMethod.POST)
    public void reset(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;setchar=UTF-8");
        User user=(User)httpSession.getAttribute("user");
        String oldpassword=request.getParameter("oldpassword");
        String newpassword=request.getParameter("newpassword");
        if(user.getPassword().equals(oldpassword)){
            user.setPassword(newpassword);
            int res=userService.updateUser(user);
            if(res==1){
                httpSession.setAttribute("user",user);
                out.print("<script language='javascript'>alert('修改成功');window.location.href='/web/resetPassword';</script>");
            }
            else{
                out.print("<script language='javascript'>alert('修改失败');window.location.href='/web/resetPassword';</script>");
            }
        }
        else{
            out.print("<script language='javascript'>alert('密码错误');window.location.href='/web/resetPassword';</script>");
        }
    }
}