package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }
    @RequestMapping(value = "/mainContent")
    public String main(HttpSession httpSession){
        httpSession.setAttribute("page",0);
        return "mainContent";
    }
    @RequestMapping(value = "/userInfo")
    public String userInfo(HttpSession httpSession){
        httpSession.setAttribute("page",1);
        return "userInfo";
    }
    @RequestMapping(value = "/resetPassword")
    public String resetPassword(HttpSession httpSession){
        httpSession.setAttribute("page",1);
        return "resetPassword";
    }
    @RequestMapping(value = "/fileSearch")
    public String fileSearch(HttpSession httpSession){
        httpSession.setAttribute("page",2);
        return "fileSearch";
    }
    @RequestMapping(value = "/fileClassification")
    public String fileClassification(HttpSession httpSession){
        httpSession.setAttribute("page",2);
        return "fileClassification";
    }
}
