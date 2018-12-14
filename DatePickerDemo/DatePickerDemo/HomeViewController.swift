//
//  ViewController.swift
//  DatePickerDemo
//
//  Created by Je Min Son on 12/14/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dobDatePickerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var dobStringValue : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //IBActions
    @IBAction func toolBarAction(_ sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            dobTextField.text = ""
            openDatePicker(bool: false)
            dobTextField.resignFirstResponder()
        case 2:
            dobTextField.text = dobStringValue
            dobLabel.text = dobStringValue
            openDatePicker(bool: false)
            dobTextField.resignFirstResponder()
        default:
            break
        }
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dobStringValue = formatter.string(from: dobDatePicker.date)
    }    
}

extension HomeViewController {
    
    func openDatePicker(bool: Bool) {
        UIView.animate(withDuration: 1.5) {
            self.dobDatePickerTopConstraint.constant = self.dobDatePickerTopConstraint.constant == 650 ? 387 : 650
            self.view.layoutIfNeeded()
        }
    }
}


extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        openDatePicker(bool : true)
    }
}
