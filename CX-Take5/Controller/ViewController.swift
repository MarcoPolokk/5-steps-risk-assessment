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
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var workplaceLabel: UITextField!
    @IBOutlet weak var workDescriptionLabel: UITextField!
    @IBOutlet weak var checkbox: UICheckbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

