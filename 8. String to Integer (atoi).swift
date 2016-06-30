import UIKit


func myAtoi(str: String) -> Int {
    var sign: Double = 1
    let myStr = str
    var myInt: Double = 0
    var intArray = [Double]()
    var index = myStr.startIndex
    
    if myStr.isEmpty {
        return 0
    }
    
    while myStr[index] == " " {
        
        index = index.successor()
        
        if index == myStr.endIndex {
            return 0
        }
        while myStr[index] == "0" {
            
            index = index.successor()
            
            if index == myStr.endIndex {
                return 0
            }
        }
    }
    
    if myStr[index] == "+" || myStr[index] == "-" || myStr[index] == "0"{
        if myStr[index] == "-" {
            sign = -1
        }
        if index.successor() == myStr.endIndex {
            return 0
        }
        index = index.successor()
        while myStr[index] == "0" {
            
            index = index.successor()
            
            if index == myStr.endIndex {
                return 0
            }
        }
        if index == myStr.endIndex {
            return 0
        }else if myStr[index] <= "9" && myStr[index] >= "1" {
            for i in index..<myStr.endIndex {
                if myStr[i] <= "9" && myStr[i] >= "0" {
                    let curString = String(myStr[i])
                    if let curInt = Double(curString) {
                        intArray += [curInt]
                    }
                }else {
                    break
                }
            }
        } else {
            return 0
        }
    }else if myStr[index] > "9" || myStr[index] < "1" {
        return 0
    } else {
        for i in index..<myStr.endIndex {
            if myStr[i] <= "9" && myStr[i] >= "0" {
                let curString = String(myStr[i])
                if let curInt = Double(curString) {
                    intArray += [curInt]
                }
            }else {
                break
            }
        }
    }
    
    for index in intArray {
        myInt = myInt * 10 + index
    }
    myInt = myInt * sign
    
    if myInt > Double(Int32.max) {
        return Int(Int32.max)
    } else if myInt < Double(Int.min) {
        return Int.min
    } else {
        return Int(myInt)
    }
    }
    
    myAtoi("2147483648")
