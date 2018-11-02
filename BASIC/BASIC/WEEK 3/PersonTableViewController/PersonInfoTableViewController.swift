//
//  ContactInfoTableViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 2..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

protocol DetailPersonInfo {
    func savePersonInfo(object: PersonInformation, editPersonInfo: Bool)
}

class PersonInfoTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var personInforTableView: UITableView!
    
    var person: PersonInformation?
    var delegate: DetailPersonInfo?
    var isEdit: Bool = false
    
    var placeHolderArray : [String] = ["Name", "Age", "Phone Number"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Informations"
        
        if person == nil {
            person = PersonInformation()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeHolderArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoTableViewCell", for: indexPath) as! PersonInfoTableViewCell
        
        cell.editTextField.tag = indexPath.row
        cell.editTextField.delegate  = self
        
        switch indexPath.row {
        case 0:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = person?.name
        case 1:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = person?.age
        case 2:
            cell.editTextField.placeholder = placeHolderArray[indexPath.row]
            cell.editTextField.text = person?.phoneNumber
        default:
            break
        }
        

        return cell
    }


    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 && textField.tag == 2 {
            textField.keyboardType = .numbersAndPunctuation
        } else {
            textField.keyboardType = .default
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            person?.name = textField.text
        case 1:
            person?.age = textField.text
        case 2:
            person?.phoneNumber = textField.text
        default:
            break
        }
    }

    @IBAction func savePersonInfoActionButton(_ sender: UIButton) {
        
        view.endEditing(true)
        

        
        if let obj = person  {
            if let _ = obj.name, let _  = obj.age, let _ = obj.phoneNumber {
                delegate?.savePersonInfo(object: obj, editPersonInfo: isEdit)
                navigationController?.popViewController(animated: true)
            }
        }
        
        
    }
    


}
