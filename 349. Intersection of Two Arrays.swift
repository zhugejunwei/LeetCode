// using Array(Set(nums1)) to remove duplicates in an Array, 48 ms
func intersection(nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums1 = Array(Set(nums1)).sort()
    var nums2 = Array(Set(nums2)).sort()
    var res = [Int]()
    var i = 0, j = 0
    while i < nums1.count && j < nums2.count {
        if nums1[i] > nums2[j] {
            j += 1
        }else if nums1[i] < nums2[j] {
            i += 1
        }else {
            res.append(nums1[i])
            i += 1
            j += 1
        }
    }
    return res
}

// using filter(), 56 ms
func intersection(nums1: [Int], _ nums2: [Int]) -> [Int] {
    let nums1 = Array(Set(nums1)).sort()
    let nums2 = Set(nums2)
    return nums1.filter{ num in nums2.contains(num) }
}