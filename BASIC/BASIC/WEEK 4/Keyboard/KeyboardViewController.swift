//
//  KeyboardViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 6..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    @IBOutlet weak var keyboardTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Keyboard"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        // finding the keyboard height
        if let userinfo = notification.userInfo {
            let duration = userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            if let keyboardSize = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                self.bottomContraint.constant += keyboardSize.height
            }
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let userinfo = notification.userInfo {
            
            let duration = userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            self.bottomContraint.constant = 171
            
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

}
