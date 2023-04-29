//
//  Double.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/28/23.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        currencyFormatter.string(for: self) ?? ""
    }
}
