import Darwin

// solution from "discuss", 36 ms

func kSmallestPairs(nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
    var res = [[Int]]()
    if nums1.isEmpty || nums2.isEmpty {
        return res
    }
    var arr = Array(count: nums1.count, repeatedValue: 0)
    var start = 0
    let maxLength = nums2.count
    var index = 0
    var tmp = 0
    var k = k
    while k > 0 && start < arr.count {
        var min = nums1[start] + nums2[arr[start]]
        index = start
        for i in start+1..<arr.count {
            tmp = nums1[i] + nums2[arr[i]]
            if tmp < min {
                min = tmp
                index = i
            }
            if arr[i] == 0 {
                break
            }
        }
        let result = [nums1[index], nums2[arr[index]]]
        res.append(result)
        arr[index] += 1
        if arr[index] >= maxLength {
            start += 1
        }
        k -= 1
    }
    return res
}
