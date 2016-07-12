import Darwin

// 108 ms, iterative solution

//func myPow(x: Double, _ n: Int) -> Double {
//    var y = x, m = n
//    var ans = 1.0
//    if m == 0 { return 1 }
//    if m < 0 {
//        m = -m
//        y = 1/y
//    }
//    while m > 0 {
//        if(m&1 == 1) { ans *= y }
//        y *= y
//        print("\(ans, y)")
//        m >>= 1
//    }
//    return ans
//}


// double x, 20 ms

//func myPow(x: Double, _ n: Int) -> Double {
//    var y = x, m = n
//    if m == 0 { return 1 }
//    if m < 0 {
//        m = -m
//        y = 1/y
//    }
//    return m&0b1 == 0 ? myPow(y*y, m/2) : y*myPow(y*y, m/2)
//}



// double myPow, 20 ms

//func myPow(x: Double, _ n: Int) -> Double {
//    let y = x, m = n
//    if m == 0 { return 1 }
//    let t = myPow(y, m/2)
//    if m&1 == 1 {
//        return m > 0 ? y*t*t : 1/y*t*t
//    }else {
//        return t*t
//    }
//}



// nest myPow, 16 ms

func myPow(x: Double, _ n: Int) -> Double {
    if(n<0) { return 1/x * myPow(1/x, -(n+1)) }
    if(n==0) { return 1 }
    if(n==2) { return x*x }
    if(n%2==0) { return myPow( myPow(x, n/2), 2) }
    else { return x*myPow( myPow(x, n/2), 2) }
}

var a = 5.0
var b = -1
myPow(a, b)