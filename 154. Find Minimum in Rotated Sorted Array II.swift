import Darwin

// As a contrast, 28 ms

//func findMin(nums: [Int]) -> Int {
//    return nums.minElement()!
//}


// Binary Search, 28 ms

func findMin(nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1
    while left < right {
        let mid = (left + right)/2
        if nums[mid] > nums[right] {
            left = mid + 1
        }else if nums[mid] >= nums[left] && nums[mid] <= nums[right] {
            right = right - 1
        }else if nums[mid] < nums[left] && nums[mid] <= nums[right] {
            right = mid
        }
    }
    return nums[right]
}



// Another solution, similar with 2nd, 34 ms

func findMin(nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1
    while left < right {
        let mid = (left + right)/2
        if nums[mid] > nums[right] {
            left = mid + 1
        }else if nums[mid] < nums[right] {
            right = mid
        }else {
            right -= 1
        }
    }
    return nums[right]
}

var a = [2,0]

findMin(a)