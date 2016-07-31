import Darwin

// RunTime Error

//func combinationSum4(nums: [Int], _ target: Int) -> Int {
//    let nums = nums.sort()
//    var res = Array(count: target + 1, repeatedValue: 0)
//    res[0] = 1
//    for i in 1...target {
//        for n in nums {
//            if n <= i {
//                res[i] += res[i - n]
//            }else {
//                break
//            }
//        }
//    }
//    return res[target]
//}

let nums = [3, 33, 333], target = 10000

combinationSum4(nums, target)