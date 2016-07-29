import Darwin

// bitwise solution, 12 ms

func getSum(a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    let sum = a ^ b
    let carry = (a & b) << 1
    return getSum(sum, carry)
}

getSum(1, 1)

