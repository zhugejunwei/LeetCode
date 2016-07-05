import Darwin

// First Version

//func minimumTotal(triangle: [[Int]]) -> Int {
//    var myT = triangle
//    for row in 0..<triangle.count {
//        for col in 0..<triangle[row].count {
//            if row > 0 {
//                if col == 0 {
//                    myT[row][0] += myT[row-1][0]
//                }else if col == triangle[row].count-1 {
//                    myT[row][triangle[row].count-1] += myT[row-1][triangle[row].count-2]
//                }else {
//                    myT[row][col] += min(myT[row-1][col-1], myT[row-1][col])
//                }
//            }
//        }
//    }
//    return myT[myT.count-1].minElement()!
//}



// Updated Version

//func minimumTotal(triangle: [[Int]]) -> Int {
//    var myT = Array(count: triangle.count, repeatedValue: 0)
//    var pre = Array(count: triangle.count, repeatedValue: 0)
//    myT[0] = triangle[0][0]
//    pre[0] = triangle[0][0]
//    for row in 1..<triangle.count {
//        for col in 0..<triangle[row].count {
//            if col == 0 {
//                myT[0] = triangle[row][0] + pre[0]
//            }else if col == triangle[row].count-1 {
//                myT[triangle[row].count-1] = triangle[row][triangle[row].count-1] + pre[triangle[row].count-2]
//            }else {
//                myT[col] = triangle[row][col] + min(pre[col-1], pre[col])
//            }
//        }
//        swap(&myT, &pre)
//    }
//    return pre.minElement()!
//}



// Optimized Version, O(n) extra space

func minimumTotal(triangle: [[Int]]) -> Int {
    var myT = triangle[triangle.count-1]
    var row = triangle.count - 2
    while row >= 0 {
        for col in 0...row {
            myT[col] = triangle[row][col] + min(myT[col],myT[col+1])
        }
        row -= 1
    }
    return myT[0]
}

//var a = [[2],[3,4],[6,5,7],[4,1,8,3]]
var a = [[-7],[-2,1],[-5,-5,9],[-4,-5,4,4],[-6,-6,2,-1,-5],[3,7,8,-3,7,-9],[-9,-1,-9,6,9,0,7],[-7,0,-6,-8,7,1,-4,9],[-3,2,-6,-9,-7,-6,-9,4,0],[-8,-6,-3,-9,-2,-6,7,-5,0,7],[-9,-1,-2,4,-2,4,4,-1,2,-5,5],[1,1,-6,1,-2,-4,4,-2,6,-6,0,6],[-3,-3,-6,-2,-6,-2,7,-9,-5,-7,-5,5,1]]
// -63

//var a = [[-1],[2,3],[1,-1,-3]]
minimumTotal(a)

