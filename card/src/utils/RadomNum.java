package utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RadomNum {
    public static String createNum (){
        Random random = new Random();
        StringBuffer randomStr = new StringBuffer();
        for (int i = 0; i < 8; i++) {
            int num = random.nextInt(10);
            randomStr.append(String.valueOf(num));
        }
        return randomStr.toString();
    }

    public static List allCode(int number){
        List<String> list = new ArrayList();
        for (int i = 0; i < number; i++) {
            list.add(createNum());
            System.out.println(list.get(i));
        }
        return list;
    }
    public static String getCode(int number){

        String code = null;
        Random random = new Random();
        code = (String) allCode(number).get(random.nextInt(number));
        return code;
    }
}
