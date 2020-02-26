//
//  ViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 20/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit
import MessageUI
import M13Checkbox

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var workplaceTextField: UITextField!
    @IBOutlet weak var workDescriptionTextField: UITextField!
    @IBOutlet weak var label1TextField: UITextField!
    @IBOutlet weak var label2TextField: UITextField!
    @IBOutlet weak var label3TextField: UITextField!
    @IBOutlet weak var label4TextField: UITextField!
    @IBOutlet weak var label5TextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2Description: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label3Description: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label4Description: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var checkbox1: M13Checkbox!
    @IBOutlet weak var checkbox2: M13Checkbox!
    @IBOutlet weak var checkbox3: M13Checkbox!
    @IBOutlet weak var checkbox4: M13Checkbox!
    @IBOutlet weak var checkbox5: M13Checkbox!
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    var date = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        workplaceTextField.delegate = self
        workDescriptionTextField.delegate = self
        label1TextField.delegate = self
        label2TextField.delegate = self
        label3TextField.delegate = self
        label4TextField.delegate = self
        label5TextField.delegate = self
        
        label1.text = K.Polish.label1Text
        label2.text = K.Polish.label2Text
        label2Description.text = K.Polish.label2Description
        label3.text = K.Polish.label3Text
        label3Description.text = K.Polish.label3Description
        label4.text = K.Polish.label4Text
        label4Description.text = K.Polish.label4Description
        label5.text = K.Polish.label5Text
        warningLabel.text = K.Polish.warningLabel
        
        checkbox1._IBStateChangeAnimation = K.Other.animation
        checkbox2._IBStateChangeAnimation = K.Other.animation
        checkbox3._IBStateChangeAnimation = K.Other.animation
        checkbox4._IBStateChangeAnimation = K.Other.animation
        checkbox5._IBStateChangeAnimation = K.Other.animation
        checkbox1.boxType = .square
        checkbox2.boxType = .square
        checkbox3.boxType = .square
        checkbox4.boxType = .square
        checkbox5.boxType = .square
        
        scrollView.keyboardDismissMode = .onDrag
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateHolder = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        date = dateFormatter.string(from: dateHolder)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        showMailComposer()
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setSubject(K.Polish.subject)
        
        composer.setMessageBody("Imię i nazwisko:\(nameTextField.text)\n Data:\(date)\n Miejsce:\(workplaceTextField.text)\n Opis pracy:\(workDescriptionTextField.text)\n\n 1. Zatrzymaj się, rozejrzyj, sprawdź otoczenie\n Komentarz:\(label1TextField.text)\n 2. Przemyśl wykonywaną pracę\n Komentarz:\(label2TextField.text)\n 3. Zidentyfikuj Zagrożenia\n Komentarz:\(label3TextField.text)\n 4. Kontroluj oraz Komunikuj Ryzyko Komentarz:\(label4TextField.text)\n 5. Czy mogę wykonać to zadanie bezpiecznie?\n Komentarz:\(label5TextField.text)\n", isHTML: false)
        
        present(composer, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        workplaceTextField.endEditing(true)
        workDescriptionTextField.endEditing(true)
        label1TextField.endEditing(true)
        label2TextField.endEditing(true)
        label3TextField.endEditing(true)
        label4TextField.endEditing(true)
        label5TextField.endEditing(true)
        return true
    }
}

//MARK: - MFMailComposeViewControllerDelegate
extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true)
    }
}
