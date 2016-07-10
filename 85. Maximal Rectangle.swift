/*
 This question has a wrong test case:
 
 ["000","000","000","000"], this is not [[Character]]
 
 So I can't figure out whether my solution is right or not.
 
 Another solution: using area = (right - left) * height, this is also a smart solution.
 
 */

import Darwin

func maximalRectangle(matrix: [[Character]]) -> Int {
    if matrix.isEmpty {
        return 0
    }
    let row = matrix.count
    let col = matrix[0].count
    var max = 0
    var count = Array(count: row, repeatedValue: Array(count: col, repeatedValue: 0))
    // count assign values
    for i in 0..<row {
        for j in 0..<row {
            if matrix[i][j] == "1" {
                count[i][j] = 1
            }
        }
    }
    // boundary cases
    if row == 1 && col == 1 {
        return matrix[0][0] == "1" ? 1 : 0
    }
    if row == 1 {
        for j in 1..<col {
            count[0][j] += (count[0][j] == 0 || count[0][j-1] == 0) ? 0 : count[0][j-1]
        }
        return count[0].maxElement()!
    }
    if col == 1{
        for i in 1..<row {
            count[i][0] += (count[i][0] == 0 || count[i-1][0] == 0) ? 0 : count[i-1][0]
            if count[i][0] > max {
                max = count[i][0]
            }
        }
        return max
    }
    // left to right sum
    for i in 0..<row {
        for j in 1..<col {
            count[i][j] += (count[i][j] == 0 || count[i][j-1] == 0) ? 0 : count[i][j-1]
        }
    }
    // top to bottom sum
    var cur = count[1][0]
    var pre = count[0][0]
    for j in 0..<col {
        for i in 1..<row {
            cur = count[i][j]
            if pre == cur {
                count[i][j] += count[i-1][j]
            }else {
                count[i][j] = count[i][j] + count[i-1][j] - abs(count[i][j] - count[i-1][j])
            }
            pre = cur
        }
    }
    // get the MAX value
    for i in 0..<row {
        for j in 0..<col {
            if count[i][j] > max {
                max = count[i][j]
            }
        }
    }
    return max
}

var a: [[Character]] = ["000","000","000","000"]
maximalRectangle(a)
