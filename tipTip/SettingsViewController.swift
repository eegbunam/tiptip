//
//  SettingsViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/27/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit




class SettingsViewController: UIViewController {
    let defaults = UserDefaults.standard
    let originalY = 700.00
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
    
    
    var notifyLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 700
            , width: 300, height: 60))
        label.layer.cornerRadius = 15
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = true
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Settings"
        setUpView()
        
        
    }
    
    
    @objc func handleTapGesture(){
        view.endEditing(true)
        removeNotify()
    }
    
    @objc func handleChangeTip(){
        guard let text = tipTextField.text else {
            notifySucess(sucess: false )
            
            
            return
        }
        guard let doubleValue = Double(text) else {
            notifySucess(sucess: false)
            
            
            return
        }
        notifySucess(sucess: true)
        
        
        defaults.set(doubleValue, forKey: "tip")
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    func notifySucess(sucess : Bool ){
        
        
        
        if sucess{
            notifyLabel.text = "Sucess changing default tip"
            notifyLabel.textColor = .darkGray
            UIView.animate(withDuration: 0.3) {
                self.notifyLabel.frame.origin.y = 300
            }
        }else{
            notifyLabel.text = "Try again with a real number"
            notifyLabel.backgroundColor = .red
            notifyLabel.textColor = .darkGray
            UIView.animate(withDuration: 0.3) {
                self.notifyLabel.frame.origin.y = 300
            }
        }
        
    }
    
    func removeNotify(){
        
        
        UIView.animate(withDuration: 0.3) {
            self.notifyLabel.frame.origin.y = 700
        }
        return
        
        
    }
    
    
    
    
    
    
    func setUpView(){
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tapGesture)
        view.addSubview(notifyLabel)
        let firstStack = UIStackView(arrangedSubviews: [tipTextField, changeTipBtn])
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        firstStack.axis = .vertical
        view.addSubview(firstStack)
        firstStack.spacing = 20
        firstStack.distribution = .fillEqually
        firstStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        firstStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        firstStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    
    
}
