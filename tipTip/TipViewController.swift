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
    
    
    @IBOutlet weak var peoplePicker: UIPickerView!
    
        //variables
    let defaults = UserDefaults.standard
    var defaultTip : Double?  = 12.0
    var globaltotalAmount : Double?
    var row : Int = 1
    
    
    
    
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
        billTextField.becomeFirstResponder()
        
        peoplePicker.delegate = self
        
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
    
    func handleTip(){
        let stringValue = defaults.string(forKey: "mybill") ?? "no value"
        let tipValue = defaults.double(forKey: "tip")
        
        if stringValue == "no value"{
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: defaultTip)
                globaltotalAmount = tip.totolAmountDouble
                tipLabel.text = tip.discription
                totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(row + 1 ))
                defaults.set(billTextField.text, forKey: "mybill")
                
                
            }
            
        }else{
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: tipValue)
                globaltotalAmount =  tip.totolAmountDouble
                totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(row + 1 ))
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

extension TipViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
        totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(row + 1 ))
    }
    
    
}




