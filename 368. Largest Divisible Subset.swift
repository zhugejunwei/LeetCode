import Darwin

// 308 ms
func largestDivisibleSubset(nums: [Int]) -> [Int] {
    let len = nums.count
    var nums = nums.sort()
    var tmp = Array(count: nums.count, repeatedValue: 0)
    var pre = Array(count: nums.count, repeatedValue: 0)
    var m = 0
    var mi = 0
    for i in 0..<len {
        var j = i
        while j >= 0 {
            if nums[i] % nums[j] == 0 && tmp[i] < tmp[j] + 1 {
                tmp[i] = tmp[j] + 1
                pre[i] = j
                
                if tmp[i] > m {
                    m = tmp[i]
                    mi = i
                }
            }
            j -= 1
        }
    }
    var res = [Int]()
    for _ in 0..<m {
        res.append(nums[mi])
        mi = pre[mi]
    }
    return res
}


var a = [1,3,9,18,90,180,360,720]

largestDivisibleSubset(a)