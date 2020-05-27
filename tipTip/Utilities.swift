//
//  Utilities.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/26/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//



import Foundation
import UIKit


class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        //bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        textfield.textColor = .black
    
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        textfield.layer.cornerRadius = 7
        
        var myMutableStringTitle = NSMutableAttributedString()
        let Name : String = textfield.placeholder ?? ""

        myMutableStringTitle =
            
            NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font:UIFont(name: "ArialRoundedMTBold", size: 14.0)!]) // Font
        myMutableStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: Name.count))    // Color
        textfield.attributedPlaceholder = myMutableStringTitle
        
    }
    
    
    static func styleLabel(_ label : UILabel) {
        label.layer.cornerRadius = 7
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 17)
        label.adjustsFontSizeToFitWidth = true
    
        
        
        
    }
    

    
}


