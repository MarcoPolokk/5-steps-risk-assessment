//
//  ViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 20/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit
import UICheckbox_Swift

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var workplaceLabel: UITextField!
    @IBOutlet weak var workDescriptionLabel: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label1TextField: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2Description: UILabel!
    @IBOutlet weak var label2TextField: UITextField!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label3Description: UILabel!
    @IBOutlet weak var label3TextField: UITextField!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label4TextField: UITextField!
    @IBOutlet weak var label4Description: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label5TextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = K.Polish.label1Text
        label2.text = K.Polish.label2Text
        label2Description.text = K.Polish.label2Description
        label3.text = K.Polish.label3Text
        label3Description.text = K.Polish.label3Description
        label4.text = K.Polish.label4Text
        label5.text = K.Polish.label5Text
        
    }
}

