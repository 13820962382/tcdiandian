import mode.CardCode;
import utils.DbUtil;
import utils.RadomNum;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Test {
    public static void main (String args[]){

//            System.out.println("所有劵码中的一个："+RadomNum.getCode(10));

        List list = RadomNum.allCode(5);
        for (int i = 0; i < list.size(); i++) {
            CardCode code = new CardCode();
            code.setCard_code(list.get(i).toString());
            code.setCard_state("false");
            DbUtil.addData(code);
        }
    }

}
