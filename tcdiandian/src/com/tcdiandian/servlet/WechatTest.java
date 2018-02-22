package com.tcdiandian.servlet;

import com.tcdiandian.model.AccessToken;
import com.tcdiandian.uitils.WechatUtil;
import net.sf.json.JSONObject;

public class WechatTest {
    public static void main(String [] strings){
        AccessToken accessToken = WechatUtil.getAccessToken();
        System.out.println(accessToken.getAccess_token());
        System.out.println(accessToken.getExpires_in());

        String menu = JSONObject.fromObject(WechatUtil.initMenu()).toString().replace("menu","button");
        JSONObject result = WechatUtil.CreateMenu(accessToken,menu);
        if (result!=null&&result.getInt("errcode")==0){
            System.out.println("创建菜单成功");
        }else {
            System.out.println(menu);
            System.out.println(""+result.getString("errmsg")+result.getString("errcode"));
        }
    }
}
