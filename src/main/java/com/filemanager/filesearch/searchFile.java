package com.filemanager.filesearch;

import javax.swing.table.DefaultTableModel;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;

public class searchFile {
    private Collection<File> collection = new ArrayList<File>();
    private File[] fileList = null;
    private String fileName,filePath;

    public File[] getFileList() {
        return fileList;
    }

    public void changeTOList(String fileName,String filePath){
        this.filePath=filePath;
        this.fileName=fileName;
        fileList=null;
        fileList=listDirectory(new File(filePath),fileName);
    }

    public  File[] listDirectory(File dir, String fileName) throws IllegalArgumentException {
        if(!dir.exists()) {
            throw new IllegalArgumentException("目录：" + dir + "不存在.");
        }
        if(!dir.isDirectory()) {
            throw new IllegalArgumentException(dir + "不是目录");
        }
		/*
		String[] filename = dir.list();
		for (String string : filename) {
			System.out.println(dir + string);
		}*/
        File[] files = dir.listFiles();
        if(files != null && files.length > 0) {
            for (File file : files) {
                if(file.isDirectory()) {
                    listDirectory(file, fileName);

                }
                else {
                    if(file.getName().contains(fileName)) {
                        collection.add(file);
                    }
                }
            }
        }
        return collection.toArray(new File[0]);
    }
}
