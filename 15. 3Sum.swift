import Darwin

// O(n^2), 72 ms, the key is jump through all the consecutive equal values.

func threeSum(nums: [Int]) -> [[Int]] {
    let nums = nums.sort()
    var result = [Array<Int>]()
    if nums.count < 3 {
        return []
    }
    var i = 0
    while i < nums.count {
        if nums[i] > 0 {
            break
        }
        var left = i + 1, right = nums.count - 1
        while left < right {
            if nums[i] + nums[left] + nums[right] > 0 {
                right -= 1
            }else if nums[i] + nums[left] + nums[right] < 0 {
                left += 1
            }else {
                let cur = [nums[i], nums[left], nums[right]]
                result.append(cur)
                while left < right && nums[left] == cur[1] {
                    left += 1
                }
                while left < right && nums[right] == cur[2] {
                    right -= 1
                }
            }
        }
        while i + 1 < nums.count && nums[i+1] == nums[i] {
            i += 1
        }
        i += 1
    }
    return result
}

let a = [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]

threeSum(a)