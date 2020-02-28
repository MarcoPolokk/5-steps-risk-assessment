//
//  LanguageViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 28/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var languageButton: UIButton!
    
    @IBAction func polishButtonPressed(_ sender: UIButton) {
    }
    
}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
