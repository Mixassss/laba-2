func sumDigits(_ n: Int) -> Int {
    var s = 0
    var num = n
    while num != 0 {
        s += num % 10
        num /= 10
    }
    return s
}

func productDigits(_ n: Int) -> Int {
    var p = 1
    var num = n
    while num != 0 {
        p *= num % 10
        num /= 10
    }
    return p
}

func checkNum(_ n: Int) -> Bool {
    return sumDigits(n) < productDigits(n)
}

if let input = readLine() {
    let numbers = input.split(separator: " ").compactMap { Int($0) }
    var result: [String] = []
    var index = 1
    for number in numbers {
        if checkNum(number) {
            result.append(String(index))
        }
        index += 1
    }
    print(result.joined(separator: " "))
}
