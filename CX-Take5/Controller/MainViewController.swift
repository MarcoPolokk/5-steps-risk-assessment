//
//  MainViewController.swift
//  CX-Take5
//
//  Created by Paweł Kozioł on 20/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit
import MessageUI
import M13Checkbox
import CoreGraphics

class MainViewController: UIViewController {
    
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
    var sendEndLabel = String()
    var tintColor = UIColor()
    var secondaryTintColor = UIColor()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? EndViewController {
            destinationVC.information = self.sendEndLabel
            destinationVC.tintColor = self.tintColor
            destinationVC.secondaryTintColor = self.secondaryTintColor
            return
        }
    }
    
    func resetSegue() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "endSegue", sender: nil)
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
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.height),
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        updateViewConstraints()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func showMailComposer() {
    }
    
}

//MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    
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
extension MainViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    }
    
}
