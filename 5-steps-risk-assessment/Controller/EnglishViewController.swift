//
//  EnglishViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 05/01/2021.
//  Copyright © 2021 Paweł Kozioł. All rights reserved.
//

import MessageUI

class EnglishViewController: MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = K.English.label1Text
        label2.text = K.English.label2Text
        label2Description.text = K.English.label2Description
        label3.text = K.English.label3Text
        label3Description.text = K.English.label3Description
        label4.text = K.English.label4Text
        label4Description.text = K.English.label4Description
        label5.text = K.English.label5Text
        warningLabel.text = K.English.warningLabel
    }
    
    override func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }
        
        let composer = MFMailComposeViewController()
        let none = K.English.none
        composer.mailComposeDelegate = self
        composer.setSubject(K.English.subject)
        composer.setMessageBody("\(K.English.data1)\(nameTextField.text ?? none)\n \(K.English.data2)\(date)\n \(K.English.data3)\(workplaceTextField.text ?? none)\n \(K.English.data4)\(workDescriptionTextField.text ?? none)\n\n \(label1.text ?? none)\n \(K.English.comm)\(label1TextField.text ?? none)\n\n \(label2.text ?? none)\n \(K.English.comm)\(label2TextField.text ?? none)\n\n \(label3.text ?? none)\n \(K.English.comm)\(label3TextField.text ?? none)\n\n \(label4.text ?? none)\n \(K.English.comm)\(label4TextField.text ?? none)\n\n \(label5.text ?? none)\n \(K.English.comm)\(label5TextField.text ?? none)\n", isHTML: false)
        
        let myData: Data = screenShot.pngData()!
        composer.addAttachmentData(myData, mimeType: "image/png", fileName: "Take5.png")
        present(composer, animated: true)
        
    }
    
    override func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            sendEndLabel = K.English.error
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
            resetSegue()
            return
        }
        
        switch result {
        case .cancelled:
            sendEndLabel = K.English.cancelled
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
        case .failed:
            sendEndLabel = K.English.failed
            tintColor = K.Other.red
            secondaryTintColor = K.Other.red
        case .saved:
            sendEndLabel = K.English.saved
            tintColor = K.Other.green
            secondaryTintColor = K.Other.green
        case .sent:
            sendEndLabel = K.English.sent
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
