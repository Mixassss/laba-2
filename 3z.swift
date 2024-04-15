func sumOfDigits(_ n: Int) -> Int {
    return String(n).compactMap { Int(String($0)) }.reduce(0, +)
}

func productOfDigits(_ n: Int) -> Int {
    var result = 1
    for digit in String(n) {
        if let digitValue = Int(String(digit)) {
            result *= digitValue
        }
    }
    return result
}

func findNumbers(_ sequence: [Int]) -> [Int] {
    var result = [Int]()
    for (index, number) in sequence.enumerated() {
        if number >= 0 && sumOfDigits(number) < productOfDigits(number) {
            result.append(index + 1)
        }
    }
    return result
}

let sequence = [3, 27, 14, 99]
let output = findNumbers(sequence)
print(output)