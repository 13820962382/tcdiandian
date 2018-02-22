package com.tcdiandian.uitils;

import com.sun.org.apache.xerces.internal.xs.XSTerm;
import com.tcdiandian.model.MessageBase;
import com.tcdiandian.model.TextMessage;
import com.thoughtworks.xstream.XStream;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MessageUtil {
    /**
     * 将xml转换为map集合
     * @param request
     * @return map
     * @throws IOException
     * @throws DocumentException
     */
    public static Map xmlToMap(HttpServletRequest request) throws IOException, DocumentException {
        Map<String,String> map = new HashMap<String,String>();
        //从request中获取输入流，将dom节点放入map中
        InputStream ins = request.getInputStream();
        SAXReader reader = new SAXReader();
        Document document = reader.read(ins);
        Element element = document.getRootElement();
        List<Element> list = element.elements();
        for (Element e:list) {
            map.put(e.getName(),e.getText());
        }
        ins.close();
        return map;
    }

    /**
     * 将消息转为xml
     * @param message
     * @return
     */
    public static String messageToXml(String fromUserName, String toUserName,  String msgType, MessageBase message){
        XStream xStream = new XStream();
        xStream.alias("xml",message.getClass());
        message.setFromUserName(toUserName);
        message.setToUserName(fromUserName);
        message.setMsgType(msgType);
        message.setCreateTime(new Date().getTime());
        return xStream.toXML(message);
    }

    /**
     * 构建自动回复消息
     * @return
     */
    public static String autoAnswer(){
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("请按提示操作：\n\n");
        stringBuffer.append("回复 \"1\"了解公众号开发\n\n");
        stringBuffer.append("回复 \"2\"了解小程序开发\n\n");
        stringBuffer.append("回复 \"3\"了解app开发\n\n");
        stringBuffer.append("回复 \"?\" 调出此菜单\n\n");
        return stringBuffer.toString();
    }
}
