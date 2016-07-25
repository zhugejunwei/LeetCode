import Darwin

// 296 ms
func lengthOfLongestSubstring(s: String) -> Int {
    var result = [Character]()
    var count = 0
    var tmp = 0
    for i in s.characters {
        if result.contains(i) == false {
            result.append(i)
            tmp += 1
        }else {
            let index = result.indexOf(i)
            for _ in 0...index! {
                result.removeAtIndex(0)
            }
            result.append(i)
            tmp = result.count
        }
        count = max(tmp, count)
    }
    return count
}

var a = "cdd"

lengthOfLongestSubstring(a)