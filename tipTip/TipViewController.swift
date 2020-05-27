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
    let defaults = UserDefaults.standard
    
    var defaultTip : Double?  = 12.0
    
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(billTextField.text, forKey: "mybill")
        defaults.set(, forKey: "mybill")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let bill = billTextField.text {
            print(defaultTip)
            let finalBill = Double(bill)
            let tip = Tip(bill: finalBill, percentage: defaultTip)
            totalAmountLabel.text = tip.totalAmount
            tipLabel.text = tip.discription
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Calculate Tip"
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleBarButton)), animated: true)
        navigationController?.navigationBar.tintColor = .black
        setUpView()
        
    }
    
    @objc func handleBarButton(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "settings") as SettingsViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func handlechnageTip () {
        if let bill = billTextField.text {
            let finalBill = Double(bill)
            let tip = Tip(bill: finalBill, percentage: defaultTip)
            totalAmountLabel.text = tip.totalAmount
            tipLabel.text = tip.discription
            
            
        }
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func billIsChanged(_ sender: Any) {
        if let bill = billTextField.text {
            let finalBill = Double(bill)
            let tip = Tip(bill: finalBill, percentage: defaultTip)
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

extension TipViewController : settingsDelegate {
    func didChangeTip(tip: Double) {
  
        
    }
}


