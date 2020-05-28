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
        if percentage == 0.0{
            let tip =  bill + (0.1 * bill)
            return  String(format: "$%.2f", tip)
        }else{
            let tip =  bill + (percentage/100 * bill)
            return  String(format: "$%.2f", tip)
        }
        
    }
    
    
}




