//
//  ViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/26/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let lTip = [0.1 , 0.15, 0.3]
        
        
        let bill = Double(billField.text!) ?? 0
        //get bill amount
        //calculate tip and total
        let tip = bill * lTip[tipSegment.selectedSegmentIndex]
        //update tip and total labels
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
    
}

