package com.tcdiandian.uitils;

import com.tcdiandian.model.*;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class WechatUtil {

    private static final String APPID = "wx1ba20f6438042f8c";
    private static final String APPSECRET = "bf80f0cd3c6cf22d08cabc93691d2057";
    private static final String GET_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
    private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

    /**
     * 使用GET请求方式获取Token
     * @param url
     * @return
     */
    public static JSONObject doGetStr(String url){
        DefaultHttpClient client = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        JSONObject jsonObject = null;
        try {
            HttpResponse response = client.execute(httpGet);
            HttpEntity entity = response.getEntity();
            if (entity!=null){
                String result = EntityUtils.toString(entity,"UTF-8");
                jsonObject = JSONObject.fromObject(result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    /**
     * 使用GET请求方式获取Token
     * @param url
     * @param outStr
     * @return
     */
    public static JSONObject doPostGStr(String url,String outStr){
        DefaultHttpClient client = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(url);
        JSONObject jsonObject = null;
        try {
            httpPost.setEntity(new StringEntity(outStr,"UTF-8"));
            HttpResponse response = client.execute(httpPost);
            String result = EntityUtils.toString(response.getEntity(),"UTF-8");
            jsonObject = JSONObject.fromObject(result);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    /**
     * 获取AccessToken
     * @return
     */
    public static AccessToken getAccessToken(){
        AccessToken accessToken = new AccessToken();
        String url = GET_TOKEN_URL.replace("APPID",APPID).replace("APPSECRET",APPSECRET);
        JSONObject jsonObject = doGetStr(url);
        if (jsonObject!=null){
            accessToken.setAccess_token(jsonObject.getString("access_token"));
            accessToken.setExpires_in(jsonObject.getInt("expires_in"));
        }
        return accessToken;
    }

    public static Menu initMenu(){

        CommonButton commonButton1 = new CommonButton();
        commonButton1.setType("click");
        commonButton1.setName("公众号开发");
        commonButton1.setKey("btn1");

        CommonButton commonButton2 = new CommonButton();
        commonButton2.setType("click");
        commonButton2.setName("小程序开发");
        commonButton2.setKey("btn2");

        CommonButton commonButton3 = new CommonButton();
        commonButton3.setType("click");
        commonButton3.setName("app开发");
        commonButton3.setKey("btn3");

        ComplexButton button = new ComplexButton();
        button.setName("菜单");
        button.setSub_button(new CommonButton[]{commonButton1, commonButton2, commonButton3});


        Menu menu = new Menu();
        menu.setMenu(new Button[]{button, commonButton1, commonButton2,});
        return menu;

    }

    public static JSONObject CreateMenu(AccessToken accessToken,String menu){
//       int result = 0;
       String url = CREATE_MENU_URL.replace("ACCESS_TOKEN",accessToken.getAccess_token());
        JSONObject jsonObject = doPostGStr(url,menu);
//       if (jsonObject!=null){
//          result = jsonObject.getInt("errcode");
//
//       }
        return jsonObject;
    }
}
