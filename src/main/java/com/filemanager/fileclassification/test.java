package com.filemanager.fileclassification;

import java.io.File;
import java.util.List;
import java.util.Map;

public class test {
    public static void main(String[] args) {
        classificationFile classificationFile=new classificationFile();
        String sourcePath="E:\\新建文件夹";
        String outputPath="E:\\新建文件夹 (2)";
        int res=classificationFile.handlePath(new File(sourcePath),new File(outputPath));
        Map<String,List<String>> map=classificationFile.getMap();
        System.out.println(res);
        for(String key:map.keySet()){
            List<String> list=map.get(key);
            System.out.println(key+"/"+list.size());
            for (int i=0;i<list.size();i++){
                if(i==list.size()-1){
                    System.out.println(list.get(i));
                }
                else System.out.print(list.get(i)+"、");
            }
        }
    }
}
