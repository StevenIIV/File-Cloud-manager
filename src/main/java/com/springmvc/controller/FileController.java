package com.springmvc.controller;

import com.filemanager.fileclassification.classificationFile;
import com.filemanager.filesearch.searchFile;
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
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class FileController {

    @RequestMapping(value = "/fileSearch",method = RequestMethod.POST)
    @ResponseBody
    public String fileSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        searchFile searchFile=new searchFile();
        File[] files=null;
        searchFile.changeTOList(request.getParameter("fileName"),request.getParameter("filePath"));
        files=searchFile.getFileList();
        for(File f:files){
            System.out.println(f.getName()+" "+f.getAbsolutePath()+" "+new Date(f.lastModified()).toString());
        }
        List<Map<String,Object>> list=new ArrayList<>();
        for(int i=0;i<files.length;i++){
            Map map=new HashMap();
            map.put("fileName",files[i].getName());
            map.put("filePath",files[i].getAbsolutePath());
            map.put("fileTime",new Date(files[i].lastModified()).toString());
            list.add(map);
        }
        String json=JSONArray.toJSONString(list);
        return json;
    }

    @RequestMapping(value = "/fileClassification",method = RequestMethod.POST)
    @ResponseBody
    public String fileClassification(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        classificationFile classificationFile=new classificationFile();
        int res=classificationFile.handlePath(new File(request.getParameter("sourcePath")),new File(request.getParameter("outputPath")));
        Map<String,List<String>> map=classificationFile.getMap();
        List<String> list=new ArrayList<>();
        for(String key:map.keySet()){
            list.add(key);
            System.out.println(key);
        }
        map.put("suffixName",list);

        List<Map<String,List<String>>> maplist=new ArrayList<>();
        maplist.add(map);
        String json=JSONArray.toJSONString(maplist);
        return json;
    }

}
