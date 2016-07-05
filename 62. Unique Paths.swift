import Darwin

// First Version

//func uniquePaths(m: Int, _ n: Int) -> Int {
//    var record = Array(count: m+1, repeatedValue: Array(count: n+1, repeatedValue: 1))
//    var row = 2
//    while row <= m {
//        var col = 2
//        while col <= n {
//            record[row][col] += record[row-1][col] + record[row][col-1]
//            col += 1
//        }
//        row += 1
//    }
//    return record[m][n]
//}


// Optimized Version

import Darwin

func uniquePaths(m: Int, _ n: Int) -> Int {
    if m > n { return uniquePaths(n, m) }
    var record = Array(count: n, repeatedValue: 1)
    for _ in 1..<m {
        for col in 1..<n {
            record[col] += record[col-1]
        }
    }
    return record[n-1]
}

uniquePaths(3,3)