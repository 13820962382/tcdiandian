package com.tcdiandian.uitils;

import java.util.Arrays;

public class CheckUtil {
    private static final String token = "tcdiandian" ;

    public static boolean checkSignature(String signature,String timestamp,String nonce){

        String arr[] = new String[]{token,signature,timestamp,nonce};
        Arrays.sort(arr);
        //拼接字符串
        StringBuffer content = new StringBuffer();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        String temp = Sha1.encode(content.toString());
        return temp.equals(signature);
    }

}
