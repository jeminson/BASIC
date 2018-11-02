//
//  ContactInfoViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

// What is optional and required for protocol?
protocol DetailInfo {
    func saveContactInfo(object: ContactInfo, editContactInfo: Bool)
}

class ContactInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    var contact: ContactInfo?
    var delegate: DetailInfo?
    var isEdit: Bool = false
    
    var placeHolderArray : [String] = ["First Name", "Last Name", "Zip Code"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeHolderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInfoTableViewCell") as! ContactInfoTableViewCell
        
        cell.editTextField.tag = indexPath.row
        cell.editTextField.delegate  = self
        
        switch indexPath.row {
        case 0:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = contact?.firstName
        case 1:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = contact?.lastName
        case 2:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = contact?.zipCode
        default:
            break
        }
        
        

        return cell
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 2 {
            textField.keyboardType = .numbersAndPunctuation
        } else {
            textField.keyboardType = .default
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            contact?.firstName = textField.text
        case 1:
            contact?.lastName = textField.text
        case 2:
            contact?.zipCode = textField.text
        default:
            break
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Informations"
        
        if contact == nil {
            contact = ContactInfo()
        }
    }
    

    @IBAction func saveActionButton(_ sender: UIButton) {
        
        view.endEditing(true)
        
        if let obj = contact  {
            if let _ = obj.firstName, let _  = obj.lastName, let _ = obj.zipCode {
                delegate?.saveContactInfo(object: obj, editContactInfo: isEdit)
                navigationController?.popViewController(animated: true)
            }
        }

    }
    

}
