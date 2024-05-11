fun sumDigits(n: Int): Int {
    var s = 0
    var num = n
    while (num != 0) {
        s += num % 10
        num /= 10
    }
    return s
}

fun productDigits(n: Int): Int {
    var p = 1
    var num = n
    while (num != 0) {
        p *= num % 10
        num /= 10
    }
    return p
}

fun checkNum(n: Int): Boolean {
    return sumDigits(n) < productDigits(n)
}

fun main() {
    val numbers = readLine()!!.split(" ").map { it.toInt() }
    val result = mutableListOf<String>()
    var index = 1
    for (number in numbers) {
        if (checkNum(number)) {
            result.add(index.toString())
        }
        index++
    }
    println(result.joinToString(" "))
}
