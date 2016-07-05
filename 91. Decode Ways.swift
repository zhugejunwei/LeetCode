import UIKit

func reverse(x: Int) -> Int {
    var myX = x
    var myOutput:Double = 0
    
    while ((myX > 9 || myX < -9) && myX % 10 == 0) {
        myX = myX / 10
    }
    while myX != 0 {
        myOutput = myOutput * 10 + Double(myX % 10)
        myX = myX / 10
    }
    if myOutput > Double(Int32.max) || myOutput < Double(Int32.min) {
        return 0
    }else {
        return Int(myOutput)
    }
    
}

reverse(-12120)