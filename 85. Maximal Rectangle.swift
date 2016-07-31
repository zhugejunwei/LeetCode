/* My first solution, interesting solution.
 left to right
 top to bot
 max area
 */


import Darwin

/*
 
 Another solution: using area = (right - left) * height, this is also a smart solution.
 
 */

// 176 ms
func maximalRectangle(matrix: [[Character]]) -> Int {
    if matrix.isEmpty {
        return 0
    }
    let m = matrix.count
    let n = matrix[0].count
    var left = Array(count: n, repeatedValue: 0)
    var right = Array(count: n, repeatedValue: n)
    var height = Array(count: n, repeatedValue: 0)
    var maxA = 0
    for i in 0..<m {
        var curLeft = 0, curRight = n
        // height, left
        for j in 0..<n {
            if matrix[i][j] == "1" {
                height[j] += 1
                left[j] = max(left[j], curLeft)
            }else {
                height[j] = 0
                left[j] = 0
                curLeft = j + 1
            }
        }
        // right
        var k = n - 1
        while k >= 0 {
            if matrix[i][k] == "1" {
                right[k] = min(right[k], curRight)
            }else {
                right[k] = n
                curRight = k
            }
            k -= 1
        }
        // area
        for j in 0..<n {
            maxA = max(maxA, (right[j] - left[j]) * height[j])
        }
    }
    return maxA
}


