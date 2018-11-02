//
//  DateViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 1..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class DateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var datePickerConstraintHeight: NSLayoutConstraint!
    
    var stringValue : String?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    /* Date Picker */
    @IBOutlet weak var datePickerDOB: UIDatePicker!
    @IBOutlet weak var dateTextField: UITextField!
    
    @objc func setUpDate() {
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-dd-yyyy"        // MMM -> Oct (String), MM -> 10 (Int)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "MM-dd-yyyy"
        
        let dateString = formatter.string(from: date)

        let dateString2 = formatter2.string(from: date)

        
        dateLabel.text = "Today is \(dateString)"
        dateLabel2.text = "Today is \(dateString2)"
        
        let convertDate = formatter.date(from: dateString)
        print(convertDate!)
        let convertDate2 = formatter2.date(from: dateString2)
        print(convertDate2!)
    }
    
    func openDatePicker(bool : Bool) {
        UIView.animate(withDuration: 1.5) {
            self.datePickerConstraintHeight.constant = self.datePickerConstraintHeight.constant == 500 ? 180 : 500
            self.view.layoutIfNeeded()
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Date"
        
        setUpDate()
    }
    
    @IBAction func doneActionButton(_ sender: UIBarButtonItem) {
        dateTextField.text = stringValue
        openDatePicker(bool : false)
        dateTextField.resignFirstResponder()
    }
    
    @IBAction func cancelActionButton(_ sender: UIBarButtonItem) {
        dateTextField.text = ""
        openDatePicker(bool : false)
        dateTextField.resignFirstResponder()
    }
    
    @IBAction func datePickerActionButton(_ sender: UIDatePicker) {
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd"
        
        stringValue = formatter.string(from: datePickerDOB.date)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        openDatePicker(bool : true)
    }
    

    
    
    

}
