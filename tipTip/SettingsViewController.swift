//
//  SettingsViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/27/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit


protocol settingsDelegate {
    func didChangeTip(tip : Double)
}

class SettingsViewController: UIViewController {
    
    var delegate :settingsDelegate?
  
    var changeTipBtn : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Change Default tip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 17)
        button.addTarget(self, action: #selector(handleChangeTip), for: .touchUpInside)
        button.backgroundColor = .darkGray
        
        return button
    }()
    
    
    var tipTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.frame = .zero
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Add a default tip"
        textField.keyboardType = .decimalPad
        return textField
        
    }()
    
    
    var sucessLabel : UILabel = {
        let label = UILabel(frame: CGRect(x:0, y: 300
            , width: 300, height: 60))
        label.layer.cornerRadius = 15
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Settings"
        setUpView()
        
        
    }
    
    
    @objc func handleChangeTip(){
        print("button is being pressed")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tip") as! TipViewController
        self.delegate = vc

        delegate?.didChangeTip(tip: Double(tipTextField.text!)!)
        performSegue(withIdentifier: "goBack", sender: self)
      
    }

    
    
    func setUpView(){
        
        let firstStack = UIStackView(arrangedSubviews: [tipTextField, changeTipBtn])
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        firstStack.axis = .vertical
        //Utilities.styleTextField(tipTextField)
        view.addSubview(firstStack)
    
        firstStack.spacing = 20
        firstStack.distribution = .fillEqually
        firstStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        firstStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        firstStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    
    
}
