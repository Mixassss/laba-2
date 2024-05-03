func sumOfDigits(_ n: Int) -> Int {
    var sum = 0
    var number = n
    while number > 0 {
        sum += number % 10
        number /= 10
    }
    return sum
}

func productOfDigits(_ n: Int) -> Int {
    var product = 1
    var number = n
    while number > 0 {
        product *= number % 10
        number /= 10
    }
    return product
}

func checkNumber(_ n: Int) -> Bool {
    return sumOfDigits(n) < productOfDigits(n)
}

let numbers = [3, 27, 14, 99]
var index = 1
for number in numbers {
    if checkNumber(number) {
        print(index, terminator: " ")
    }
    index += 1
}
