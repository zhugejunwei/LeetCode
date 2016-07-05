import Darwin

func minPathSum(grid: [[Int]]) -> Int {
    var record = grid
    let m = grid.count, n = grid[0].count
    var i = 1
    while i < m {
        record[i][0] += record[i-1][0]
        i += 1
    }
    var j = 1
    while j < n {
        record[0][j] += record[0][j-1]
        j += 1
    }
    var row = 1
    while row < m {
        var col = 1
        while col < n {
            record[row][col] += min(record[row-1][col], record[row][col-1])
            col += 1
        }
        row += 1
    }
    return record[m-1][n-1]
}

var a = [[1,5],[3,2]]

minPathSum(a)