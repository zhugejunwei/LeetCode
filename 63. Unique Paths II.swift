import Darwin

// O(mn) space

func uniquePathsWithObstacles(obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var count = Array(count: m, repeatedValue: Array(count: n, repeatedValue: 1))
    for i in 0..<m {
        if obstacleGrid[i][0] == 1 {
            for n in i..<m {
                count[n][0] = 0
            }
        }
    }
    for j in 0..<n {
        if obstacleGrid[0][j] == 1 {
            for n in j..<n {
                count[0][n] = 0
            }
        }
    }
    for i in 1..<m {
        for j in 1..<n {
            if obstacleGrid[i][j] == 1 {
                count[i][j] = 0
            }else {
                count[i][j] = count[i][j-1] + count[i-1][j]
            }
        }
    }
    print("\(count)")
    return count[m-1][n-1]
    
}


