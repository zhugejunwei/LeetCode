import Darwin


// MLE

func superPow(a: Int, _ b: [Int]) -> Int {
    var b = b
    if b.isEmpty {
        return 1
    }
    let lastDigit = b.last!
    b.popLast()
    return powMod(superPow(a, b), 10) * powMod(a, lastDigit) % 1337
}

func powMod(x: Int, _ y: Int) -> Int {
    let x = x % 1337
    var res = 1
    for _ in 0..<y {
        res = (res * x) % 1337
    }
    return res
}

// Math solution, 36 ms

func pow(x: Int, _ n: Int, _ mod: Int) -> Int {
    var x = x % mod, n = n, mod = mod
    var ret = 1
    while n != 0 {
        if n&1 != 0 {
            ret = ret * x % mod
        }
        x = x * x % mod
        n >>= 1
    }
    return ret
}

func superPow(a: Int, _ b: [Int]) -> Int {
    if a % 1337 == 0 {
        return 0
    }
    var p = 0
    for i in b {
        p = (p * 10 + i) % 1140
    }
    if p == 0 {
        p += 1140
    }
    return pow(a, p, 1337)
}


