import Darwin

// Using sort(), 452 ms

func majorityElement(nums: [Int]) -> Int {
    var n = nums.sort()
    return n[n.count/2]
}

// Very nice solution, 40 ms
// Is this Moore voting algorithm?

class Solution {
    func majorityElement(nums: [Int]) -> Int {
        var major = nums[0]
        var count = 1
        for i in 1..<nums.count {
            if count == 0 {
                major = nums[i]
                count += 1
            }else if major == nums[i] {
                count += 1
            }else {
                count -= 1
            }
        }
        return major
    }
}

// Dictionary, 116 ms

func majorityElement(nums: [Int]) -> Int {
    var count = [Int:Int]() // count[nums[i]:count]
    for i in 0..<nums.count {
        if count[nums[i]] != nil {
            count[nums[i]]! += 1
        }else {
            count[nums[i]] = 1
        }
    }
    let v = count.values.maxElement()!
    var a = count.filter{ $0.1 == v }.map{ $0.0 }
    return a[0]
    
    //    return count.keysForValue(v)[0] // Using function below
}

/*
 // function 1
 extension Dictionary where Value: Equatable {
 /// Returns all keys mapped to the specified value.
 /// ```
 /// let dict = ["A": 1, "B": 2, "C": 3]
 /// let keys = dict.keysForValue(2)
 /// assert(keys == ["B"])
 /// assert(dict["B"] == 2)
 /// ```
 func keysForValue(value: Value) -> [Key] {
 return flatMap { (key: Key, val: Value) -> Key? in
 value == val ? key : nil
 }
 }
 }
 
 // function 2
 func allKeysForValue<K, V : Equatable>(dict: [K : V], val: V) -> [K] {
 return dict.filter{ $0.1 == val }.map{ $0.0 }
 }
 */


// Bit manipulation, can't deal with nagetive nums, to be modified.

//func majorityElement(nums: [Int]) -> Int {
//    var bit = Array(count: 32, repeatedValue: 0)
//    for num in nums {
//        for i in 0..<32 {
//            if (num>>(31-i) & 1) == 1 {
//                bit[i] += 1
//            }
//        }
//    }
//    var ret = 0
//    for i in 0..<32 {
//        bit[i] = bit[i]>nums.count/2 ? 1 : 0
//        ret += bit[i] * (1<<(31-i))
//    }
//    return ret
//}


