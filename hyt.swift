import Foundation

var str = "sd10sds101sdd100101"
var inVar = 0
var out = ""

for i in 0..<str.count {
    let char = str[str.index(str.startIndex, offsetBy: i)]
    
    if char == "1" && inVar == 0 {
        inVar = 1
        out = "1"
        continue
    }
    
    if char == "1" && inVar == 2 {
        out += "1"
        print(out)
        inVar = 0
        i -= 1
    }
    
    if char == "0" && (inVar == 1 || inVar == 2) {
        out += "0"
        inVar = 2
    } else if inVar == 1 || inVar == 2 {
        inVar = 0
    }
}
