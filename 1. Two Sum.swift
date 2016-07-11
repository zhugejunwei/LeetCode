import Darwin

// 996ms - bad solution

//func twoSum(nums: [Int], _ target: Int) -> [Int] {
//    for i in 0..<nums.count {
//        if target >= 0 && nums[i] <= target {
//            for j in i+1..<nums.count {
//                if nums[i] + nums[j] == target {
//                    return [i,j]
//                }
//            }
//        }else if target < 0 && nums[i] >= target {
//            for j in i+1..<nums.count {
//                if nums[i] + nums[j] == target {
//                    return [i,j]
//                }
//            }
//        }
//    }
//    return [0,1]
//}



// Nicer solution - 148ms

func twoSum(nums: [Int], _ target: Int) -> [Int] {
    var result = Array(count:2, repeatedValue: -1)
    var sorted = nums
    sorted = sorted.sort()
    var left = 0, right = sorted.count-1
    var stop = 0
    while left < right && stop == 0 {
        if sorted[left] + sorted[right] < target {
            left += 1
        }else if sorted[left] + sorted[right] > target {
            right -= 1
        }else {
            stop = 1
        }
    }
    for i in 0..<sorted.count {
        if nums[i] == sorted[left] && result[0] == -1 {
            result[0] = i
        }else if nums[i] == sorted[right] {
            result[1] = i
        }
    }
    
    return result.sort()
}


//var a = [2, 7, 11, 15, 1, 3, 4]
var b = [2,1,9,4,4,56,90,3], target = 8

twoSum(b, target)
