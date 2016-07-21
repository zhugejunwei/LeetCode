import Darwin

// 68 ms

func longestConsecutive(nums: [Int]) -> Int {
    var record = [Int:Int]()
    var result = 0
    for num in nums {
        if record[num] == nil {
            let left = record[num - 1]
            let right = record[num + 1]
            let sum = (left ?? 0) + (right ?? 0) + 1
            record[num] = sum
            
            result = max(result,sum)
            
            if left != nil {
                record[num - left!] = sum
            }
            if right != nil {
                record[num + right!] = sum
            }
            
        }else {
            continue
        }
    }
    return result
}
