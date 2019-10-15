//
//  ThirdChallenge.swift
//  VanHack Algorithm
//
//  Created by Kamal Maged on 2019-10-15.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation

protocol StockProtocol {
    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) -> [Stock]
}
class Stock {
    var stock = [StockPrice]()
    func parseJSON() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [Dictionary<String, Any>]
                for dictionary in json {
                    
                    let dateString = dictionary["date"]
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "d-mmm-yyyy"
                    guard let date = dateFormatter.date(from: dateString as! String) else { return }
                    let open = dictionary["open"] as! String
                    let high = dictionary["high"] as! String
                    let low = dictionary["low"] as! String
                    let close = dictionary["close"] as! String
                    let stockPrice = StockPrice(date: date, open: open , high: high, low: low, close: close)
                    
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
    }
}

class StockPrice: StockProtocol{
    var date: Date?
    var open: String?
    var high: String?
    var low: String?
    var close: String?
    init(date: Date, open: String, high: String, low: String, close: String) {
        self.date = date
        self.open = open
        self.high = high
        self.low = low
        self.close = close
    }
    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) -> [Stock] {
        <#code#>
    }
}
