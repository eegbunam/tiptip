//
//  TipViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/26/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit



class TipViewController: UIViewController {
    
    //Iboutlets
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
        //variables
    let defaults = UserDefaults.standard
    var defaultTip : Double?  = 12.0
    
    
    
    
    
        //view controller life cycle
    override func viewWillAppear(_ animated: Bool) {
        handleTip()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Calculate Tip"
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Change Tip", style: .done, target: self, action: #selector(handleBarButton)), animated: true)
        navigationController?.navigationBar.tintColor = .black
        setUpView()
        
    }
    
    @objc func handleBarButton(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "settings") as SettingsViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
        //Ibactions
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func billIsChanged(_ sender: Any) {
        handleTip()
        
    }
    
        //functions
    
    func handleTip()  {
        let stringValue = defaults.string(forKey: "mybill") ?? "no value"
        let tipValue = defaults.double(forKey: "tip")
        
        if stringValue == "no value"{
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: defaultTip)
                totalAmountLabel.text = tip.totalAmount
                tipLabel.text = tip.discription
                defaults.set(billTextField.text, forKey: "mybill")
                
                
            }
            
        }else{
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: tipValue)
                totalAmountLabel.text = tip.totalAmount
                tipLabel.text = tip.discription
                
            }
            
        }
        
    }
    
    
    
    func setUpView(){
        Utilities.styleTextField(billTextField)
        Utilities.styleLabel(tipLabel)
        Utilities.styleLabel(totalAmountLabel)
        Utilities.styleLabel(totalLabel)
    }
    
  
}




