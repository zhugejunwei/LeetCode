import Darwin

// using Dictionary, 160 ms
// Basic idea: sum2 - k = sum1, length = sum2.index - sum1.index

func maxSubArrayLen(nums: [Int], _ k: Int) -> Int {
    var sumIndex = [Int:Int]()
    var res = 0
    var sum = 0
    for i in 0..<nums.count {
        sum += nums[i]
        if sum == k {
            res = i + 1
        }else if sumIndex[sum - k] != nil {
            res = max(res, i - sumIndex[sum - k]!)
        }
        if sumIndex[sum] == nil {
            sumIndex[sum] = i
        }
    }
    return res
}

let  nums = [-2, -1, 2, 1], k = 1

maxSubArrayLen(nums, k)




// O(n^2), TLE
//
//func maxSubArrayLen(nums: [Int], _ k: Int) -> Int {
//    var count = 0
//    for i in 0..<nums.count {
//        var j = i + 1
//        var tmp = nums[i]
//        var tc = 0
//        if tmp == k {
//            tc = 1
//        }else {
//            tc = 0
//        }
//        while j < nums.count {
//            tmp += nums[j]
//            j += 1
//            if tmp == k {
//                tc = j - i
//            }
//        }
//        count = max(count, tc)
//    }
//    return count
//}



