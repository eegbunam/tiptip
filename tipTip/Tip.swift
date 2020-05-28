//
//  Tip.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/27/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import Foundation

struct Tip {
    
    var bill : Double?
    
    var percentage : Double? = 0.0
    
    init(bill :Double? , percentage : Double?) {
        self.bill = bill
        self.percentage = percentage
    }
    
    var discription : String {
        guard let percentage = percentage else {
            return "10% Tip :$0.00"
            
        }
        
        return "\(percentage)% Tip : \(tip)"
    }
    
    var tip : String {
        guard let bill = bill , let percentage = percentage else{
            return "$0.00"
        }
        return  String(format: "$%.2f", percentage/100 * bill)
    }
    
    var totalAmount  : String {
        guard let bill = bill , let percentage = percentage else{
            return "$0.00"
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        if percentage == 0.0{
            let tip =  bill + (0.1 * bill) as NSNumber
            return formatter.string(from: tip)!
        }else{
            let tip =  bill + (percentage/100 * bill) as NSNumber
             return formatter.string(from: tip)!
        }
        
    }
    
    var totolAmountDouble : Double {
        guard let bill = bill , let percentage = percentage else{
            return 0.00
             }
        let tip =  bill + (percentage/100 * bill)
        return  tip
    }
    
    
    static func divide(bill : Double? , by people: Double?) -> String{
        guard let bill = bill else {
             return "$0.00"
        }
        guard let people = people else{
             return "$0.00"
            
        }
        let finalBill = bill/people
        
        return String(format: "$%.2f", finalBill)
        
    }
    
    
}




