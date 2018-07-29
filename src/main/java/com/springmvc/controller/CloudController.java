package com.springmvc.controller;

import com.filemanager.fileclassification.classificationFile;
import com.filemanager.filesearch.searchFile;
import com.filemanager.sftp.SFTPUtil;
import com.jcraft.jsch.SftpException;
import com.springmvc.model.User;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class CloudController {
    @RequestMapping(value = "/showCloud",method = RequestMethod.POST)
    public String showCloud(HttpSession httpSession) throws SftpException {
        User user=(User)httpSession.getAttribute("user");
        String username=user.getUsername();
        String path=String.format("/User/%s",username);
        SFTPUtil sftp = new SFTPUtil("root", "qwe123456", "118.25.6.121", 22);
        sftp.login();
        Vector list =sftp.listFiles(path);

        for(int i=0;i<list.size();i++){
            System.out.println(list.get(i));
        }
        httpSession.setAttribute("cloudList",list);
        sftp.logout();
        return "redirect:/showcloud";
    }
}
