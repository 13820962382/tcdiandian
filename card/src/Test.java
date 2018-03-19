import mode.CardCode;
import utils.DbUtil;
import utils.RadomNum;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Test {
    public static void main (String args[]){

//            System.out.println("所有劵码中的一个："+RadomNum.getCode(10));

      /*  List list = RadomNum.allCode(5);
        for (int i = 0; i < list.size(); i++) {
            CardCode code = new CardCode();
            code.setCard_code(list.get(i).toString());
            code.setCard_state("false");
            DbUtil.addData(code);
        }*/

//      DbUtil.queryData()

        //动态加载类
//        Class mode = null;
//        try {
//            mode = Class.forName("mode.Information");
//            //获取类的所有方法
//            Method[] methods = mode.getDeclaredMethods();
//            for (int i = 0; i < methods.length; i++) {
//                //获取方法的返回值类型
//                Class returnType =  methods[i].getReturnType();
//                System.out.print(returnType + " ");
//                //获取方法的参数的类型
//                if (returnType.toString().equals("void")){
//                    String params = methods[i].getName().substring(3,4).toLowerCase()+methods[i].getName().substring(4);
//                    System.out.println("方法的参数: "+ params);
//                    methods[i].invoke(methods[i].getName(),params);
//                }
//
//                System.out.println();
//            }
//
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            e.printStackTrace();
//        }

//        DbUtil.modifyData("2");
        List<CardCode> list = DbUtil.queryData("14656175");
        System.out.println(list.get(0).getCard_state());
    }

}
