package com.springmvc.controller;

import com.filemanager.fileclassification.classificationFile;
import com.filemanager.filesearch.searchFile;
import com.filemanager.sftp.SFTPUtil;
import com.filemanager.sftp.Sftp;
import com.jcraft.jsch.SftpException;
import com.springmvc.model.User;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

@Controller
public class CloudController {
    @RequestMapping(value = "/showCloud")
    public String showCloud(HttpSession httpSession) throws SftpException {
        User user=(User)httpSession.getAttribute("user");
        String username=user.getUsername();
        String path=String.format("/User/%s",username);
        Sftp sftp=new Sftp("118.25.6.121",22,3000,"root","qwe123456");;
        sftp.login();
        List list=sftp.ls("/User/steven");
        httpSession.setAttribute("cloudList",list);
        httpSession.setAttribute("page",3);
        sftp.logout();
        return "showCloud";
    }

    @RequestMapping(value = "/download/{id}",method = RequestMethod.GET)
    public void download(@PathVariable int id,HttpSession httpSession,HttpServletRequest request,
                         HttpServletResponse response) throws IOException, SftpException {
        SFTPUtil sftp = new SFTPUtil("root", "qwe123456", "118.25.6.121", 22);
        sftp.login();
        List list= (List) httpSession.getAttribute("cloudList");
        String filename=((String[]) list.get(id))[0];
        byte[] file=sftp.download("/User/steven",filename);
        OutputStream outputStream = null;
        outputStream = response.getOutputStream();
        response.setContentType("application/octet-stream;charset=UTF-8");// 设置文件输出类型
        response.setHeader("Content-disposition", "attachment; filename="
                + new String(filename.getBytes("utf-8"), "ISO8859-1"));//设置下载的文件名
        outputStream.write(file);
    }
}
