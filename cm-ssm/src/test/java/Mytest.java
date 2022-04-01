import org.junit.Test;

/**
 * @ClassName Mytest.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/17  11:57
 * @Version : 1.0
 **/
public class Mytest {
    @Test
    public void test1(){
        String s= "12";
        for (String s1 : s.split(",")) {
            System.out.println(s1);
        }
    }
}
