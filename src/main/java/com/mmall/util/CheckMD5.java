package com.mmall.util;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: CheckMD5
 * @date: 2019/05/28 11:29
 * @description:
 */
public class CheckMD5 {
    public static void main(String[] args) {
        String psd = "123456";
        String s = MD5Util.encrypt(psd);
        System.out.println(s);
    }
}
