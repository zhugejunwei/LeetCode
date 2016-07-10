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

/*
 func reverse(x: Int) -> Int {
 var sign = 1
 var mx = x
 if mx < 0 {
 sign = -1
 mx *= -1
 }
 while mx % 10 == 0 && mx != 0 {
 mx /= 10
 }
 var rx = 0.0
 var stop = 0
 while stop == 0 {
 if mx < 10 {
 stop = 1
 }
 rx = rx * 10 + Double(mx) % 10
 mx /= 10
 }
 if rx > Double(INT32_MAX) {
 return 0
 }else {
 return Int(rx) * sign
 }
 }
 */