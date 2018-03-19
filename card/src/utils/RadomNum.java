package utils;

import mode.CardCode;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RadomNum {

    /**
     *拼接一个8位的劵码
     * @return
     */
    public static String createNum (){
        Random random = new Random();
        StringBuffer randomStr = new StringBuffer();
        for (int i = 0; i < 8; i++) {
            int num = random.nextInt(10);
            randomStr.append(String.valueOf(num));
        }
        return randomStr.toString();
    }

    /**
     * 生成number个电子劵码
     * @param number
     * @return
     */
    public static List createCode(int number){
        List<String> list = new ArrayList();
        CardCode code = new CardCode();
        for (int i = 0; i <= number; i++) {
            list.add(createNum());
            //打印劵码
            System.out.println(list.get(i));

            code.setCard_code(list.get(i));
            code.setCard_state("未核销");
            //获取数据库的劵码
            List<CardCode> codeList = DbUtil.queryFrom();
            if (codeList!=null){
                String data_code = codeList.get(i).getCard_code();
                //避免生成和数据库中一样的劵码
                if (!data_code.equals(list.get(i))){
                    DbUtil.addData(code);
                }
            }

        }
        return list;
    }

    /**
     * 返回一个随机劵码
     * @return
     */
    public static String getCode(){

        List<CardCode> list = DbUtil.queryFrom();
        Random random = new Random();
        int number = random.nextInt(list.size());
        if (!list.get(number).getCard_state().equals("已核销")){
            String codeStr  = list.get(number).getCard_code();
            return codeStr;
        }
        return getCode();
    }

    public static  String state(String cardCode){
        String state =  null;
        List<CardCode> list = DbUtil.queryData(cardCode);
        if (list!=null){
            state = list.get(0).getCard_state();
        }

        return state;
    }
}
