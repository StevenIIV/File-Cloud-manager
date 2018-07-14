package com.filemanager.filesearch;

import java.io.File;
import java.util.Date;

public class test {
    public static void main(String[] args) {
        searchFile searchFile=new searchFile();
        File[] files=null;
        searchFile.changeTOList("1","D:\\施雨非");
        files=searchFile.getFileList();

        for(File f:files){
            System.out.println(f.getName()+" "+f.getAbsolutePath()+" "+new Date(f.lastModified()).toString());
        }
    }
}
