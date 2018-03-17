import java.util.Random;

public class Test {
    public static void main (String args[]){
        Random random = new Random();
        StringBuffer randomStr = new StringBuffer();
        for (int i = 0; i < 8; i++) {
            int num = random.nextInt(10);
            randomStr.append(String.valueOf(num));
        }
        System.out.println(randomStr.toString());
    }
}
