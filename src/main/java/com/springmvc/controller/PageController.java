package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class PageController {

    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }
    @RequestMapping(value = "/mainContent")
    public String main(){
        return "mainContent";
    }
    @RequestMapping(value = "/userInfo")
    public String userInfo(){
        return "userInfo";
    }
    @RequestMapping(value = "/resetPassword")
    public String resetPassword(){
        return "resetPassword";
    }
    @RequestMapping(value = "/fileSearch")
    public String fileSearch(){
        return "fileSearch";
    }
    @RequestMapping(value = "/fileClassification")
    public String fileClassification(){
        return "fileClassification";
    }
}
