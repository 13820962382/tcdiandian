package com.tcdiandian.uitils;

import com.sun.org.apache.xerces.internal.xs.XSTerm;
import com.tcdiandian.model.TextMessage;
import com.thoughtworks.xstream.XStream;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
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
     * 将text消息转为xml
     * @param textMessage
     * @return
     */
    public static String textMessageToXml(TextMessage textMessage){
        XStream xStream = new XStream();
        xStream.alias("xml",textMessage.getClass());

        return xStream.toXML(textMessage);

    }
}
