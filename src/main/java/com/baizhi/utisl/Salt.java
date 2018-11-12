package com.baizhi.utisl;

import java.util.Random;

public class Salt {
    public static String getSalt(Integer lenth){
        String s="abcdefgijklmnopqrstevwxyz1234567890";
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<lenth;i++){
            Random r=new Random();
            int d=r.nextInt(s.length());
            String ss = s.substring(d,d+1);
            sb.append(ss);
        }
        return sb.toString();
    }
}
