import Darwin

// O(n^3), 472 ms

//func threeSumSmaller(nums: [Int], _ target: Int) -> Int {
//    if nums.isEmpty {
//        return 0
//    }
//    var count = 0
//    for i in 0..<nums.count {
//        for j in i+1..<nums.count {
//            for k in j+1..<nums.count {
//                if nums[i] + nums[j] + nums[k] < target {
//                    count += 1
//                }
//            }
//        }
//    }
//    return count
//}

// O(n^2), 48 ms, key is sort() first

func threeSumSmaller(nums: [Int], _ target: Int) -> Int {
    let nums = nums.sort()
    var count = 0
    for i in 0..<nums.count {
        var left = i + 1, right = nums.count-1
        while left < right {
            if nums[i] + nums[left] + nums[right] < target {
                count += right - left
                left += 1
            }else {
                right -= 1
            }
            
        }
    }
    return count
}