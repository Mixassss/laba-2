import kotlin.text.StringBuilder

fun main() {
    val str = "sd10sds101sdd100101"
    var inState = 0
    var out = StringBuilder()

    for (i in str.indices) {
        when {
            str[i] == '1' && inState == 0 -> {
                inState = 1
                out.append('1')
            }
            str[i] == '1' && inState == 2 -> {
                out.append('1')
                println(out.toString())
                inState = 0
                continue
            }
            str[i] == '0' && (inState == 1 || inState == 2) -> {
                out.append('0')
                inState = 2
            }
            inState == 1 || inState == 2 -> {
                inState = 0
            }
        }
    }
}
