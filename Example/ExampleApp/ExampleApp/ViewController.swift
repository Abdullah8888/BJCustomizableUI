//
//  ViewController.swift
//  ExampleApp
//
//  Created by Abdullah on 11/02/2024.
//

import UIKit
import BJCustomizableUI

class ViewController: UIViewController {
    
    let nameTextField: BJTextField = {
        let textField = BJTextField(title: "Full name", iconPosition: .left)
        textField.fieldBorderCGolor = UIColor.red.cgColor
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(nameTextField)
        
        
        nameTextField.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, margin: .init(top: 150, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 70))
    }


}

