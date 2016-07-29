import Darwin

// dp solution, 884 ms
//func getMoneyAmount(n: Int) -> Int {
//    var num = Array(count: n+1, repeatedValue: Array(count: n+1, repeatedValue: 0))
//    return dp(&num, 1, n)
//}
//
//func dp(inout num: [[Int]], _ s: Int, _ e: Int) -> Int {
//    if s >= e {
//        return 0
//    }
//    if num[s][e] != 0 {
//        return num[s][e]
//    }
//    var res = Int.max
//    for x in s...e {
//        let tmp = x + max(dp(&num, s, x-1), dp(&num, x+1, e))
//        res = min(res, tmp)
//    }
//    num[s][e] = res
//    return res
//}

// bottom up, iteration solution,  468 ms

func getMoneyAmount(n: Int) -> Int {
    if n == 1 {
        return 0
    }
    var num = Array(count: n+1, repeatedValue: Array(count: n+1, repeatedValue: 0))
    for j in 2...n {
        var i = j - 1
        while i > 0 {
            var res = Int.max
            for k in i+1..<j {
                let tmp = k + max(num[i][k-1],num[k+1][j])
                res = min(res,tmp)
            }
            num[i][j] = i+1 == j ? i : res
            i -= 1
        }
    }
    return num[1][n]
}

getMoneyAmount(1)