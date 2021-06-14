import Foundation

class StockMaximize {
    
    func getCount(prices: [Int]) -> Int {
        var profit = 0
        for price in prices {
            profit += prices .last! - price
        }
        return profit
    }
    
    func countProfit(prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var profit = 0
        var somePrice = [Int]()
        somePrice.append(prices.first!)
        
        for index in 0...(prices.count-2) {
            if prices [index] <= prices [index+1] {
                somePrice.append(prices[index+1])
            } else {
                if somePrice.count > 1 {
                    profit += getCount(prices: somePrice)
                }
                somePrice.removeAll()
                somePrice.append(prices[index+1])
            }
        }
        
        if somePrice.count > 1 {
            profit += getCount(prices: somePrice)
        }
        return profit
    }
}
