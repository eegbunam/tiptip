//
//  TipViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/26/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Calculate Tip"
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func billIsChanged(_ sender: Any) {
        
        
        if let bill = billTextField.text {
            let finalBill = Double(bill)
            let tip = Tip(bill: finalBill, percentage: 10.0)
            
            totalAmountLabel.text = tip.totalAmount
            tipLabel.text = tip.discription
            
            
        }
        
    }
    
    
    
    func setUpView(){
        Utilities.styleTextField(billTextField)
        Utilities.styleLabel(tipLabel)
        Utilities.styleLabel(totalAmountLabel)
        Utilities.styleLabel(totalLabel)
        
    }
    
    
    
}




struct Tip {
    
    var bill : Double?
    
    var percentage : Double? = 0.0
    
    
    
    init(bill :Double? , percentage : Double?) {
        self.bill = bill
        self.percentage = percentage
    }
    
    var discription : String {
        guard let percentage = percentage else {
            return ""
            
        }
        return "\(percentage)% Tip : \(tip)"
    }
    
    var tip : String {
        guard let bill = bill , let percentage = percentage else{
            return ""
        }
        return  String(format: "$%.2f", percentage/100 * bill)
    }
    
    var totalAmount  : String {
        guard let bill = bill , let percentage = percentage else{
            return ""
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


