import Darwin

func rob(nums: [Int]) -> Int {
    var houses = nums
    if houses.count == 0 {
        return 0
    }
    for index in 0..<houses.count {
        if index > 1 {
            houses[index] += houses[0...index-2].maxElement()!
        }
    }
    return houses.maxElement()!
}

var a = [2,1]

rob(a)