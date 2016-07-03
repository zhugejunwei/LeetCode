import Darwin

/* DP - Kadane's Algorithm
 
 func maxSubArray(nums: [Int]) -> Int {
 if nums.isEmpty {
 return 0
 }else if nums.count == 1{
 return nums.first!
 } else {
 var myNum = nums
 var final = nums[0]
 var i = 1
 while i < myNum.endIndex {
 if myNum[i-1] > 0 {
 myNum[i] = myNum[i-1] + myNum[i]
 }
 final = max(myNum[i], final)
 i += 1
 }
 return final
 }
 }
 
 */

// Another Approach

func maxSubArray(nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }
    var final = nums[0]
    var sum = 0
    var index = 0
    while index < nums.endIndex {
        sum = sum + nums[index]
        final = max(sum, final)
        sum = max(sum, 0)
        index += 1
    }
    return final
}

var p = [-1]

maxSubArray(p)