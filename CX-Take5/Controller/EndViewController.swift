//
//  EndViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 28/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class EndViewController: UIViewController, DidSendDelegate {
    
    var polishViewController = PolishViewController()
    
    @IBOutlet weak var endLabel: UILabel!
    
    
    override func viewDidLoad() {
        polishViewController.delegate = self
        updateLabel(updatedLabel: endLabel.text!)
    }
    
    func updateLabel(updatedLabel: String) {
        DispatchQueue.main.async {
            self.endLabel.text = updatedLabel
        }
    }
}
