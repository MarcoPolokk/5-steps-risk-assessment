//
//  PolishViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 11/12/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import MessageUI

class PolishViewController: MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = K.Polish.label1Text
        label2.text = K.Polish.label2Text
        label2Description.text = K.Polish.label2Description
        label3.text = K.Polish.label3Text
        label3Description.text = K.Polish.label3Description
        label4.text = K.Polish.label4Text
        label4Description.text = K.Polish.label4Description
        label5.text = K.Polish.label5Text
        warningLabel.text = K.Polish.warningLabel
        
    }
    
    override func showMailComposer() {
        
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
    
    override func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            sendEndLabel = K.Polish.error
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
            resetSegue()
            return
        }
        
        switch result {
        case .cancelled:
            sendEndLabel = K.Polish.cancelled
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
        case .failed:
            sendEndLabel = K.Polish.failed
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
        case .saved:
            sendEndLabel = K.Polish.saved
            tintColor = K.Other.green
            secondaryTintColor = K.Other.green
        case .sent:
            sendEndLabel = K.Polish.sent
            tintColor = K.Other.green
            secondaryTintColor = K.Other.green
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true)
        print(sendEndLabel)
        resetSegue()
        return
    }
    
}
