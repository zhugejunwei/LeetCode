import Darwin

func numTrees(n: Int) -> Int {
    var array = [Int](count: n+1, repeatedValue: 0)
    array[0] = 1
    array[1] = 1
    if n >= 2 {
        for i in 2...n {
            for j in 0..<i {
                array[i] += array[j]*array[i-1-j]
            }
        }
    }
    return array[n]
}


numTrees(2)