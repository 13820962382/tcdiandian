package com.tcdiandian.servlet;

import com.tcdiandian.model.TextMessage;
import com.tcdiandian.uitils.CheckUtil;
import com.tcdiandian.uitils.MessageUtil;
import org.dom4j.DocumentException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "WechatServlet")
public class WechatServlet extends HttpServlet {
    public static final String MESSAGE_TEXT = "text";
    public static final String MESSAGE_IMAGE = "image";
    public static final String MESSAGE_VOICE= "voice";
    public static final String MESSAGE_VIDEO = "video";
    public static final String MESSAGE_LINK = "link";
    public static final String MESSAGE_LOCATION = "location";
    public static final String MESSAGE_SUBSCRIBE = "subscribe";
    public static final String MESSAGE_UNSUBSCRIBE = "unsubscribe";
    public static final String MESSAGE_EVEN = "even";
    public static final String MESSAGE_VIEW = "view";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            Map map = MessageUtil.xmlToMap(request);
            String toUserName = (String) map.get("ToUserName");
            String fromUserName = (String) map.get("FromUserName");
            String msgType = (String) map.get("MsgType");
            String content = (String) map.get("Content");
            String message = null;
            switch (msgType){
                //设置关键字回复
                case MESSAGE_TEXT:
                    TextMessage textMessage = new TextMessage();
                    if (content.equals("1")){
                        textMessage.setContent("您回复内容是：1、了解公众号开发");
                    }else if (content.equals("2")){
                        textMessage.setContent("您回复内容是：2、了解小程序开发");
                    }else if (content.equals("3")){
                        textMessage.setContent("您回复内容是：3、了解app开发");
                    }else if (content.equals("?")) {
                        textMessage.setContent(MessageUtil.autoAnswer());
                    }else {
                        writer.close();
                    }
                    message = MessageUtil.messageToXml(fromUserName,toUserName,MESSAGE_TEXT,textMessage);
                    break;
                case MESSAGE_SUBSCRIBE:
                    //设置关注回复
                    TextMessage subscribe = new TextMessage();
                    subscribe.setContent(MessageUtil.autoAnswer());
                    message = MessageUtil.messageToXml(fromUserName,toUserName,MESSAGE_TEXT,subscribe);
                    break;
            }
            System.out.println(message);
            writer.print(message);
        } catch (DocumentException e) {
            e.printStackTrace();
        }finally {
            writer.close();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        PrintWriter writer = response.getWriter();
        if (CheckUtil.checkSignature(signature,timestamp,nonce)){
            System.out.print(echostr);
            writer.print(echostr);
        }
        writer.close();

    }
}
