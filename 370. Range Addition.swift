import Darwin

// 888 ms
func getModifiedArray(length: Int, _ updates: [[Int]]) -> [Int] {
    var result = Array(count: length, repeatedValue: 0)
    for sub in updates {
        let startIndex = sub[0]
        let endIndex = sub[1]
        let inc = sub[2]
        result[startIndex] += inc
        if endIndex < length - 1 {
            result[endIndex + 1] -= inc
        }
    }
    var count = 0
    for i in 0..<length {
        count += result[i]
        result[i] = count
    }
    return result
}

let length = 5
let updates = [
    [1,  3,  2],
    [2,  4,  3],
    [0,  2, -2]
]

getModifiedArray(length, updates)