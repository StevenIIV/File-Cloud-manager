package com.filemanager.sftp;

import java.util.List;
import java.util.Objects;

public class sftptest {
    private Sftp sftp=null;
    public sftptest() {
        this.sftp=new Sftp("118.25.6.121",22,3000,"root","qwe123456");
    }

    public List showList(){
        List list=sftp.ls("/User/steven");
        return list;
    }


    public static void main(String[] args) {
        Sftp ssftp=new Sftp("118.25.6.121",22,3000,"root","qwe123456");
        ssftp.login();
        List s=ssftp.ls("/User/steven");
        for(int i=0;i<s.size();i++){
            System.out.println(((String[]) s.get(i))[0]+" "+((String[]) s.get(i))[1]);
        }
    }
}
