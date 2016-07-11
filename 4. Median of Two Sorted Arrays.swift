import Darwin


// Bad Solution, 236 ms

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    var num = nums1 + nums2
    num = num.sort()
    if num.count & 0b01 == 1 {
        return Double(num[(num.count-1)>>1])
    }else {
        return Double(num[num.count>>1] + num[num.count>>1-1])/2
    }
}


// O(log(min(M,N)))
// 104 ms

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count < nums2.count {
        return findMedianSortedArrays(nums2, nums1) // nums2 smaller
    }
    if nums2.isEmpty {
        return Double(nums1[(nums1.count-1)>>1] + nums1[(nums1.count)>>1])/2
    }
    var lo = 0, hi = nums2.count*2
    while (lo <= hi) {
        let mid2 = (lo + hi) / 2
        let mid1 = nums1.count + nums2.count - mid2
        let l1:Double = mid1 <= 0 ? Double(INT16_MIN) : Double(nums1[(mid1-1)/2])
        let l2:Double = mid2 <= 0 ? Double(INT16_MIN) : Double(nums2[(mid2-1)/2])
        let r1:Double = (mid1 >= nums1.count*2) ? Double(INT32_MAX) : Double(nums1[mid1/2])
        let r2:Double = (mid2 >= nums2.count*2) ? Double(INT32_MAX) : Double(nums2[mid2/2])
        if l1 > r2 {
            lo = mid2 + 1
        }else if l2 > r1 {
            hi = mid2 - 1
        }else {
            return Double(max(l1,l2) + min(r1,r2))/2
        }
    }
    return -1
}


// Another good solution, 92 ms

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    let size1 = nums1.count, size2 = nums2.count
    if(size1 > size2) {
        return findMedianSortedArrays(nums2, nums1) // nums1.count < nums2.count
    }
    let half = (size1+size2-1)/2
    var mid1 = 0, mid2 = 0
    var low = 0, high = half > size1 ? size1 : half
    while(low < high)
    {
        mid1 = (low+high)/2
        mid2 = half - mid1
        if(nums1[mid1] < nums2[mid2]) {
            low = mid1 + 1
        }
        else {
            high = mid1
        }
    }
    
    var a:Double, b:Double, c:Double, d:Double
    //get bigger one
    c = half-low < size2 ? Double(nums2[half-low]) : Double(INT_FAST16_MIN)
    d = low > 0 ?  Double(nums1[low-1]) : Double(INT_FAST16_MIN)
    a = c > d ? c : d
    if((size1+size2)&1 == 1) {
        return a
    }
    //get the smaller
    c = half-low+1 < size2 ? Double(nums2[half-low+1]) : Double(INT32_MAX);
    d = low < size1 ? Double(nums1[low]) : Double(INT32_MAX);
    b = c < d ? c : d
    return (a+b)/2
}
