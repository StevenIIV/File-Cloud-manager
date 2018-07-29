package com.filemanager.sftp;

import com.jcraft.jsch.SftpException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Vector;

public class test {
    public static void main(String[] args) throws SftpException, FileNotFoundException {
        SFTPUtil sftp = new SFTPUtil("root", "qwe123456", "118.25.6.121", 22);
        sftp.login();
        /*File file = new File("D:\\timg.jpg");
        InputStream is = new FileInputStream(file);
        sftp.upload("/User","steven", "test_sftp.jpg", is);*/
        Vector List =sftp.listFiles("/User/steven");
        for(int i=0;i<List.size();i++){
            String s=List.get(i).toString();
            System.out.println(s);
        }
        sftp.logout();
    }
}
