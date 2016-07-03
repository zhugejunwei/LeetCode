import Darwin

// Newton's
func isPerfectSquare(num: Int) -> Bool {
    var val = Float(num)
    var last: Float
    repeat {
        last = val
        val = (val + Float(num)/val)/2
    }while abs(val - last) > FLT_EPSILON
    if Double(val) * Double(val) == Double(num) {
        return true
    }else {
        return false
    }
}

isPerfectSquare(16)

// Fastest invSqrt

//func isPerfectSquare(num: Int) -> Bool {
//    let halfx = 0.5 * num
//    var y = x
//    var i : Int32 = 0
//    memcpy(&i, &y, 4)
//    i = 0x5f3759df - (i >> 1)
//    memcpy(&y, &i, 4)
//    y = y * (1.5 - (halfx * y * y))
//    
//}