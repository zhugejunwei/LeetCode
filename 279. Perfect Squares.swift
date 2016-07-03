import Darwin

// DP
func numSquares(n: Int) -> Int {
    struct sta {
        static var record = [0,1]
    }
    while sta.record.count <= n {
        var val = sta.record.count, minNum = sta.record.count
        for i in 1...Int(sqrt(Double(val))) {
            let tmp = val - i * i
            minNum = min(minNum, tmp == 0 ? 1 : 1+sta.record[tmp])
        }
        sta.record.append(minNum)
    }
    return sta.record[n]
}

numSquares(112)

// Use Dictionary -- slower
//struct dic {
//    static var numDic = [0:0,1:1]
//}
//
//func numSquares(n: Int) -> Int {
//    var d = dic()
//    while dic.numDic.count <= n {
//
//        var minVal = dic.numDic.count, val = dic.numDic.count
//        for index in 1...Int(sqrt(Double(val))) {
//            let curNum = val - index * index
//            minVal = min(minVal, curNum == 0 ? 1 : 1 + dic.numDic[curNum]!)
//        }
//        dic.numDic[val] = minVal
//    }
//    return dic.numDic[n]!
//}



// DP



// Lagrange's four-square theorem
// 4^k(8m+7)

//func numSquares(n: Int) -> Int {
//    var myN = n
//    while myN & 3 == 0 {
//        myN >>= 2 // myN /= 4
//    }
//    if myN % 8 == 7 {
//        return 4
//    }
//    var index = Int(sqrt(Double(n)))
//    while index > 0 {
//        let tmp = Double(n - index * index)
//        let sqrtTmp = Int(sqrt(tmp))
//        if n == sqrtTmp * sqrtTmp + index * index {
//            return sqrtTmp == 0 ? 1 : 2
//        }
//        index -= 1
//    }
//    return 3
//}





