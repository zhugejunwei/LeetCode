import Darwin

func minCost(costs: [[Int]]) -> Int {
    if costs.isEmpty {
        return 0
    }
    var lastR = costs[0][0]
    var lastG = costs[0][1]
    var lastB = costs[0][2]
    var R = lastR, G = lastG, B = lastB
    for index in 1..<costs.count {
        R = min(lastG, lastB) + costs[index][0]
        G = min(lastR,lastB) + costs[index][1]
        B = min(lastR,lastG) + costs[index][2]
        lastR = R
        lastG = G
        lastB = B
    }
    return min(R, G, B)
}

var c = [[5,8,6]]

minCost(c)


