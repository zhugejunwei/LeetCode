import Darwin

// O(n^2), 68 ms

func threeSumClosest(nums: [Int], _ target: Int) -> Int {
    let nums = nums.sort()
    var sum = Int.max/2
    for i in 0..<nums.count {
        var tmp = 0
        var left = i + 1, right = nums.count - 1
        while left < right {
            tmp = nums[i] + nums[left] + nums[right]
            if tmp < target {
                left += 1
            }else {
                right -= 1
            }
            sum = abs(tmp - target) < abs(sum - target) ? tmp : sum
        }
    }
    return sum
}

let a = [0,1,2], target = 0

threeSumClosest(a, target)

