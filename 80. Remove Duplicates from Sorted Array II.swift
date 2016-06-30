import UIKit

func removeDuplicates(inout nums: [Int]) -> Int {
    var length = 0
    var index = 0
    var lastIndex = nums.count - 1
    if nums.isEmpty {
        return length
    }else if nums.count == 1 {
        return 1
    }else {
        while index != lastIndex {
            if index + 1 == lastIndex {
                if nums[index] == nums[index+1] {
                    nums.removeLast()
                    length = nums.count
                    return length
                }else {
                    length = nums.count
                    return length
                }
            }else {
                if nums[index] == nums[index+1] {
                    nums.removeAtIndex(index+1)
                    lastIndex -= 1
                    
                }else {
                    index += 1
                }
            }
        }
        length = nums.count
        return length
    }
}

var nums = [1,1,1]

removeDuplicates(&nums)