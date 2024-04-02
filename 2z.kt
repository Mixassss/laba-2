import java.util.*

fun main() {
    print("Enter a Roman numeral: ")
    val num = readLine()
    if (num != null) {
        println("Number: ${romToInt(num)}")
    }
}

fun romToInt(s: String): Int {
    val romNums = mapOf('I' to 1, 'V' to 5, 'X' to 10, 'L' to 50, 'C' to 100, 'D' to 500, 'M' to 1000)
    var res = romNums[s[s.length - 1]] ?: 0
    for (i in s.length - 2 downTo 0) {
        if (romNums[s[i]]!! < romNums[s[i + 1]]!!) {
            res -= romNums[s[i]]!!
        } else {
            res += romNums[s[i]]!!
        }
    }
    return res
}
