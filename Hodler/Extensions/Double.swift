//
//  Double.swift
//  Hodler
//
//  Created by Naji Achkar on 09/12/21.
//

import Foundation

extension Double {
    
    func computeDecimal()-> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
    
        numberFormatter.maximumFractionDigits = 8
        return numberFormatter.string (from: NSNumber (value: self)) ?? ""
    }
}

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
    
    func formatNumberWithAbbreviation() -> String {
        let num = abs(Double(self))
        
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted) B"
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted)M"
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted)K"
        case 1...:
            return "\(num)"
        default:
            return "\(num)"
        }
    }
    
    func asNumberString()-> String {
        return String( format: "%.2f", self)
    }
    
    func asPercentString()-> String {
        return asNumberString() + "%"
    }
    
}

