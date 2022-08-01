//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Casey Kim on 2022/07/29.
//

import Foundation

class tipCalculator {
    
    var billBeforeTip: Double = 0
    var TipAmount: Double = 0
    var TipPercentage: Double = 0
    var TotalAmount: Double = 0
    
    init (billBeforeTip: Double, TipPercentage: Double)
    {
        self.billBeforeTip = billBeforeTip
        self.TipPercentage = TipPercentage
    }
    
    func calculateTip() {
        TipAmount = billBeforeTip * TipPercentage
        TotalAmount = TipAmount + billBeforeTip
    }
}
