import Foundation

let stroka = "11001101000110"
let regular = try! NSRegularExpression(pattern: "1[0]+1")
let range = NSRange(location: 0, length: stroka.utf16.count)

var startIndex = 0
while let match = regular.firstMatch(in: stroka, options: [], range: NSRange(startIndex..<stroka.utf16.count)) {
    if let swiftRange = Range(match.range, in: stroka) {
        print(String(stroka[swiftRange]))
        startIndex = match.range.upperBound
    }
}
