import Darwin

// Linear search just as a contrast, 24 ms

//func search(nums: [Int], _ target: Int) -> Int {
//    for num in nums {
//        if target == num {
//            return nums.indexOf(num)!
//        }
//    }
//    return -1
//}


// Binary Search, 24 ms

func search(nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count-1
    while left <= right {
        let mid = (left + right)/2
        if nums[mid] == target {
            return mid
        }
        if nums[left] <= nums[mid] {
            if target >= nums[left] && target <= nums[mid] {
                right = mid
            }else {
                left = mid + 1
            }
        }else if nums[mid] < nums[right] {
            if target > nums[mid] && target <= nums[right] {
                left = mid + 1
            }else {
                right = mid
            }
        }else if nums[left] == nums[right] {
            if target == nums[mid] {
                return mid
            }else {
                return -1
            }
        }
    }
    return -1
}

var a = [3,1]
search(a, 1)