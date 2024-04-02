fun sumOfDigits(n: Int): Int {
    return n.toString().sumBy { it.toString().toInt() }
}

fun productOfDigits(n: Int): Int {
    var result = 1
    n.toString().forEach { result *= it.toString().toInt() }
    return result
}

fun findNumbers(sequence: List<Int>): List<Int> {
    val result = mutableListOf<Int>()
    sequence.forEachIndexed { index, number ->
        if (number >= 0 && sumOfDigits(number) < productOfDigits(number)) {
            result.add(index + 1)
        }
    }
    return result
}

fun main() {
    val sequence = listOf(3, 27, 14, 99)
    val output = findNumbers(sequence)
    println(output)
}
