import Darwin

func maxProfit(prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    var minPrices = prices[0]
    var profit = 0
    var index = 1
    while index < prices.endIndex {
        minPrices = min(prices[index], minPrices)
        profit = max(profit, prices[index]-minPrices)
        index += 1
    }
    return profit
}

var p = [1]

maxProfit(p)