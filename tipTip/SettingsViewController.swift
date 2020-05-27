//
//  SettingsViewController.swift
//  tipTip
//
//  Created by Ebuka Egbunam on 5/27/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 navigationController?.navigationBar.prefersLargeTitles = true
     
         title = "Settings"
        
    }
    
    var text1 : UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        label.layer.cornerRadius = 7
        label.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 17)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }
    


}
