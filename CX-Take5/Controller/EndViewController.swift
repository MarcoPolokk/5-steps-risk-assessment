//
//  EndViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 28/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit
import M13Checkbox

class EndViewController: UIViewController {
    
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var checkbox0: M13Checkbox!
    
    public var information: String? = nil
    public var tintColor: UIColor?
    public var secondaryTintColor: UIColor?
    
    override func viewDidLoad() {
        endLabel.text = information
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (Timer) in
            self.checkbox0.setCheckState(.checked, animated: true)
        }
        checkbox0._IBStateChangeAnimation = K.Other.animation
        checkbox0.tintColor = tintColor
        checkbox0.secondaryTintColor = secondaryTintColor
    }
}
