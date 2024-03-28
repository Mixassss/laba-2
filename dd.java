import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class dd {
   public static void main(String[] args){
    String stroka = "11001101000110";
        Pattern regular = Pattern.compile("1[0]+1");
        Matcher matcher = regular.matcher(stroka);
        
        while (matcher.find()) {
            System.out.println(matcher.group());
            stroka = stroka.substring(matcher.end());
            matcher = regular.matcher(stroka);
        }
    }
}
