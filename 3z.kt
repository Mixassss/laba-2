fun sumOfDigits(n: Int): Int {
    var sum = 0
    var num = n
    while (num > 0) {
        sum += num % 10
        num /= 10
    }
    return sum
}

fun productOfDigits(n: Int): Int {
    var product = 1
    var num = n
    while (num > 0) {
        product *= num % 10
        num /= 10
    }
    return product
}

fun checkNumber(n: Int): Boolean {
    return sumOfDigits(n) < productOfDigits(n)
}

fun main() {
    val numbers = listOf(3, 27, 14, 99)
    var index = 1
    for (number in numbers) {
        if (checkNumber(number)) {
            print("$index ")
        }
        index++
    }
}
