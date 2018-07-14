package com.filemanager.fileclassification;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class classificationFile {

    private Map<String,List<String>> map;

    public Map<String, List<String>> getMap() {
        return map;
    }

    public  int handlePath(File sourcePath, File outputPath) {
        map=new HashMap<String, List<String>>();
        if (sourcePath == null || outputPath == null)
            return 0;
        for (File file : sourcePath.listFiles()) {
            if (file.isDirectory()) {
                handlePath(file, outputPath);
            }
            else {
                String fileName = file.getName();
                if (fileName.contains(".")) {
                    String suffix = fileName.substring(fileName.lastIndexOf('.') + 1);
                    if(map.containsKey(suffix)){
                        List<String> list=map.get(suffix);
                        list.add(fileName.substring(0,fileName.indexOf('.')));
                        map.put(suffix,list);
                    }
                    else{
                        List<String> list = new ArrayList<>();
                        list.add(fileName.substring(0,fileName.indexOf('.')));
                        map.put(suffix,list);
                    }
                    copy(file, new File(outputPath, suffix));
                }
                else {
                    copy(file, new File(outputPath, "nosuffix"));
                }
            }
        }
        return 1;
    }

    public void copy(File sourceFile, File targetDir) {
        System.out.println("copying " + sourceFile);
        if (!targetDir.exists()) {
            targetDir.mkdir();
        }
        try {
            FileInputStream fis = new FileInputStream(sourceFile);
            FileOutputStream fos = new FileOutputStream(new File(targetDir, sourceFile.getName()));
                byte[] buf = new byte[102400];
                int available = 0;
                while ((available = fis.available()) > buf.length) {
                    fis.read(buf);
                    fos.write(buf);
            }
            fis.read(buf, 0, available);
            fos.write(buf, 0, available);
            fis.close();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
