//
//  BillBrain.swift
//  SplitCheck
//
//  Created by Mahoto Sasaki on 6/6/20.
//  Copyright © 2020 mo3aru. All rights reserved.
//

import Foundation

struct BillBrain {
    var bill:Bill?
    
    func getBill() -> String {
        return String(format: "%.2f", bill?.total ?? 0)
    }
    
    func getSplitNum() -> Int {
        return bill?.splitNumber ?? 0
    }
    
    func getTipInt() -> Int {
        let tipInt:Int = Int((bill?.tipPercent ?? 0) * 100)
        return tipInt
    }
    
    mutating func calculateBill(amount:Float, tipPercent:Float, splitNumber:Int) {
        let total = (amount + (amount * tipPercent)) / Float(splitNumber)
        bill = Bill(amount: amount, tipPercent: tipPercent, splitNumber: splitNumber, total: total)
    }
}
