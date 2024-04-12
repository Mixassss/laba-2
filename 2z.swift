import Foundation

func romToInt(_ s: String) -> Int {
    let romNums: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var res = romNums[s.last!] // Численное значение для последнего символа
    
    for i in (0..<s.count-1).reversed() {
        if romNums[s[s.index(s.startIndex, offsetBy: i)]]! < romNums[s[s.index(s.startIndex, offsetBy: i+1)]]! {
            res! -= romNums[s[s.index(s.startIndex, offsetBy: i)]]! // Если меньшая цифра перед большей, вычитаем ее значение
        } else {
            res! += romNums[s[s.index(s.startIndex, offsetBy: i)]]! // Складываем значения
        }
    }
    
    return res!
}

print("Введите римское число: ", terminator: "")
if let num = readLine() {
    print("Число: \(romToInt(num))")
}