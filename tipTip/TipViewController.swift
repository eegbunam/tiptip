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
        let stringValue = defaults.string(forKey: "mybill") ?? "no value"
        let totalAmount = defaults.string(forKey: "mytotal") ?? "no value"
        print("\(stringValue)stringval" , totalAmount , "values of things")
        billTextField.text = stringValue
        totalAmountLabel.text = totalAmount
        peoplePicker.selectRow(defaults.integer(forKey: "row"), inComponent: 0, animated: true)
        handleTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Calculate Tip"
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Change Tip", style: .done, target: self, action: #selector(handleBarButton)), animated: true)
        navigationController?.navigationBar.tintColor = .black
        peoplePicker.delegate = self
        billTextField.becomeFirstResponder()
        
        setUpView()
        
    }
    
    @objc func handleBarButton(){
        saveData()
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
        
        if stringValue == "no value" {
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: defaultTip)
                globaltotalAmount = tip.totolAmountDouble
                tipLabel.text = tip.discription
                totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(peoplePicker.selectedRow(inComponent: 0) + 1 ))
                saveData()
            }
            
        }else{
            if let bill = billTextField.text {
                let finalBill = Double(bill)
                let tip = Tip(bill: finalBill, percentage: tipValue)
                globaltotalAmount =  tip.totolAmountDouble
                totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(peoplePicker.selectedRow(inComponent: 0) + 1))
                tipLabel.text = tip.discription
                saveData()
                
            }
            
        }
        
    }
    
    func saveData(){
        defaults.set(row, forKey: "row")
        defaults.set(billTextField.text, forKey: "mybill")
        defaults.set(totalAmountLabel.text, forKey: "mytotal")
    }
    
    func setUpView(){
        Utilities.styleTextField(billTextField)
        Utilities.styleLabel(tipLabel)
        Utilities.styleLabel(totalAmountLabel)
        Utilities.styleLabel(totalLabel)
    }
    
    
}

//Hnadle PickerView

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
        totalAmountLabel.text = Tip.divide(bill: globaltotalAmount, by: Double(row + 1 ))
        saveData()
    }
    
    
}




