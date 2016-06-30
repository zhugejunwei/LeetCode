import UIKit

func intToRoman(num: Int) -> String {
    var sym = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    var val = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    var myString = String()
    
    var myNum = num
    
    for i in val.indices {
        while myNum >= val[i] {
            myNum -= val[i]
            myString += sym[i]
        }
    }
    
    return myString
}

intToRoman(4)
