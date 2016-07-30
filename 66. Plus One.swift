// simpler version, 16 ms

func plusOne(digits: [Int]) -> [Int] {
    var d = digits
    var i = d.count - 1
    while i >= 0 {
        if d[i] < 9 {
            d[i] += 1
            return d
        }else {
            d[i] = 0
        }
        i -= 1
    }
    var res = Array(count: digits.count + 1, repeatedValue: 0)
    res[0] = 1
    return res
}
