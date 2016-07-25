import Darwin

// dp, 16 ms
func wiggleMaxLength(nums: [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    var f = 1
    var b = 1
    for i in 1..<nums.count {
        if (nums[i] > nums[i-1]) {
            f = b + 1
        }
        else if nums[i] < nums[i-1] {
            b = f + 1
        }
    }
    return max(f, b);
}

let input = [1,2,3,4,5,6,7,8,9]
wiggleMaxLength(input)