//
//  KeyboardViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 6..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {

    @IBOutlet weak var keyboardTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Keyboard"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification , object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

}
