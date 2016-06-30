import UIKit

func romanToInt(s: String) -> Int {
    var symVal = ["M":1000, "CM":900, "D":500, "CD":400, "C":100, "XC":90, "L":50, "XL":40, "X":10, "IX":9, "V":5, "IV":4, "I":1]
    var myInt = 0
    
    var myString = s
    var i = myString.startIndex
    
    while i != myString.endIndex {
        var iNext = i.successor()
        if iNext != myString.endIndex {
            if symVal[String(myString[i])] >= symVal[String(myString[iNext])] {
                myInt += symVal[String(myString[i])]!
                i = i.successor()
            } else {
                var twoSym = String()
                twoSym = String(myString[i]) + String(myString[iNext])
                myInt += symVal[twoSym]!
                i = i.advancedBy(2)
            }
        }else {
            myInt += symVal[String(myString[i])]!
            i = i.successor()
        }
    }
    return myInt
}

romanToInt("MMCM")