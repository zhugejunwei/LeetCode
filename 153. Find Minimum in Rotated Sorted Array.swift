import Darwin

// Linear search, 20 ms

//func findMin(nums: [Int]) -> Int {
//    if nums.isEmpty { return 0 }
//    if nums.count == 1 { return nums[0] }
//    for i in 1..<nums.count {
//        if nums[i] < nums[i-1] {
//            return nums[i]
//        }
//    }
//    return nums[0]
//}


// Binary Search, 24 ms

func findMin(nums: [Int]) -> Int {
    var left = 0, right = nums.count-1
    //    if nums.isEmpty { return 0 }
    if nums[left] <= nums[right] {
        return nums[left]
    }
    while left+1 < right {
        let mid = (left + right)/2
        if nums[mid] > nums[left] {
            left = mid
        }else {
            right = mid
        }
    }
    return nums[right]
}

//var a = [4,5,6,7,0,1,2]

var a = [7,1]

findMin(a)