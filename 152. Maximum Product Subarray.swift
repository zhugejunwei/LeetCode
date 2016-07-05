import Darwin

// First Solution

//func maxProduct(nums: [Int]) -> Int {
//    var maxN = nums[0], maxT = 1, minT = 1
//    for i in 0..<nums.count {
//        let tmp1 = maxT * nums[i]
//        let tmp2 = minT * nums[i]
//        maxN = max(maxN, tmp1, tmp2)
//        maxT = max(tmp1, tmp2, 1)
//        minT = min(tmp1, tmp2, 1)
//    }
//    return maxN
//}



// Second Solution
// No matter how many negative numbers in the array, only one negative number can influence the result, the leftmost side one, or the rightmost side one, regarding 0 as a new boundary just like the boundary of an array.

func maxProduct(nums: [Int]) -> Int {
    var lP = 1, rP = 1, maxP = nums[0]
    for i in 0..<nums.count {
        lP *= nums[i]
        rP *= nums[nums.count - 1 - i]
        maxP = max(maxP, lP, rP)
        if lP == 0 {
            lP = 1
        }
        if rP == 0 {
            rP = 1
        }
    }
    return maxP
}
var a = [2,-5,-2,-4,3]
maxProduct(a)