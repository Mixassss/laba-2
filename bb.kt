import java.util.regex.Matcher
import java.util.regex.Pattern

fun main() {
    var stroka = "11001101000110"
    val regular = Pattern.compile("1[0]+1")
    var matcher = regular.matcher(stroka)

    while (matcher.find()) {
        println(matcher.group())
        stroka = stroka.substring(matcher.end())
        matcher = regular.matcher(stroka)
    }
}
