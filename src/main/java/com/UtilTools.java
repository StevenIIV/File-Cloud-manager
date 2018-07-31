package com;

public class UtilTools {
    public static String checkImage(String filename){
        String suffix="";
        for(int i=filename.length()-1;i>=0;i--){
            char c=filename.charAt(i);
            if(c=='.'){
                suffix=filename.substring(i+1,filename.length());
                break;
            }
        }
        if(suffix.equals("")) return "barcode_result_page_type_file_dir_icon.png";
        else {
            if(suffix.equals("jpg")||suffix.equals("png")) return "barcode_result_page_type_img_icon.png";
        }
        return "barcode_result_page_type_unkonwn_icon.png";
    }
}
