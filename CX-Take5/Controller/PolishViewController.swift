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
import CoreGraphics

protocol DidSendDelegate {
    func updateLabel(updatedLabel: String)
}

class PolishViewController: UIViewController {
    
    var delegate: DidSendDelegate?
    
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
    var dateHolder = Date()
    var screenShot = UIImage()
    
    
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
        
        label1.text = K.Polish.label1Text
        label2.text = K.Polish.label2Text
        label2Description.text = K.Polish.label2Description
        label3.text = K.Polish.label3Text
        label3Description.text = K.Polish.label3Description
        label4.text = K.Polish.label4Text
        label4Description.text = K.Polish.label4Description
        label5.text = K.Polish.label5Text
        warningLabel.text = K.Polish.warningLabel
        
        scrollView.keyboardDismissMode = .onDrag
        
        defaultingDate()
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        defaultingDate()
    }
    
    func defaultingDate() {
        dateHolder = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        date = dateFormatter.string(from: dateHolder)
    }
    
    func resetSegue() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "endSegue", sender: nil)
        }
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (Timer) in
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    
    //MARK: - E-mail functionality
    @IBAction func sendPressed(_ sender: UIButton) {
        let ss = doScreenShot()
        screenShot = ss!
        showMailComposer()
    }
    
    func doScreenShot() -> UIImage? {
        
        // save initial values
        var image = UIImage()
        let savedContentOffset = scrollView.contentOffset
        let savedFrame = scrollView.frame
        let savedBackgroundColor = scrollView.backgroundColor
        
        UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, false, 0.0)
        // make temp view with scroll view content size
        let tempView = UIView(frame: CGRect.init(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height))
        // reset offset to top left point
        scrollView.contentOffset = CGPoint.zero
        // set frame to content size
        scrollView.frame = CGRect.init(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        // remove background
        scrollView.backgroundColor = UIColor.clear
        
        // save superview
        let tempSuperView = scrollView.superview
        // remove scrollView from old superview
        scrollView.sendSubviewToBack(view)
        // and add to tempView
        tempView.addSubview(scrollView)
        
        // render view
        tempView.layer.render(in: UIGraphicsGetCurrentContext()!)
        // and get image
        image = UIGraphicsGetImageFromCurrentImageContext()!
        
        // and return everything back
        tempView.subviews[0].sendSubviewToBack(view)
        tempSuperView?.addSubview(scrollView)
        
        // restore saved settings
        self.scrollView.contentOffset = savedContentOffset;
        self.scrollView.frame = savedFrame;
        self.scrollView.backgroundColor = savedBackgroundColor
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }
        
        let composer = MFMailComposeViewController()
        let none = K.Polish.none
        composer.mailComposeDelegate = self
        composer.setSubject(K.Polish.subject)
        composer.setMessageBody("\(K.Polish.data1)\(nameTextField.text ?? none)\n \(K.Polish.data2)\(date)\n \(K.Polish.data3)\(workplaceTextField.text ?? none)\n \(K.Polish.data4)\(workDescriptionTextField.text ?? none)\n\n \(label1.text ?? none)\n \(K.Polish.comm)\(label1TextField.text ?? none)\n\n \(label2.text ?? none)\n \(K.Polish.comm)\(label2TextField.text ?? none)\n\n \(label3.text ?? none)\n \(K.Polish.comm)\(label3TextField.text ?? none)\n\n \(label4.text ?? none)\n \(K.Polish.comm)\(label4TextField.text ?? none)\n\n \(label5.text ?? none)\n \(K.Polish.comm)\(label5TextField.text ?? none)\n", isHTML: false)
        
        let myData: Data = screenShot.pngData()!
        composer.addAttachmentData(myData, mimeType: "image/png", fileName: "Take5.png")
        present(composer, animated: true)
        
    }
}

//MARK: - UITextFieldDelegate
extension PolishViewController: UITextFieldDelegate {
    
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
extension PolishViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            let label = "Błąd"
            delegate?.updateLabel(updatedLabel: label)
            resetSegue()
            return
        }
        
        switch result {
        case .cancelled:
            let label = "Anulowano"
            delegate?.updateLabel(updatedLabel: label)
        case .failed:
            let label = "Błąd przy wysyłaniu"
            delegate?.updateLabel(updatedLabel: label)
        case .saved:
            let label = "Zapisano"
            delegate?.updateLabel(updatedLabel: label)
        case .sent:
            let label = "Wysłano"
            delegate?.updateLabel(updatedLabel: label)
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true)
        resetSegue()
    }
}
