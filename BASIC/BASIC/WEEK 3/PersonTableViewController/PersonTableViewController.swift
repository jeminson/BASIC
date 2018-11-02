//
//  ContactTableViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 2..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController, UISearchBarDelegate, DetailPersonInfo {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var personTableView: UITableView!
    
    var personInfoArray: Array<PersonInformation> = []
    var personInfoOriginalArray: Array<PersonInformation> = []
    

//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if !(searchBar.text?.isEmpty)! {
//            personInfoArray = personInfoOriginalArray.filter({($0.name!.uppercased().contains(searchBar.text!))})
//        }
//
//        tableView.reloadData()
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            personInfoArray = personInfoOriginalArray
        } else {
            searchBar.text = searchText.uppercased()
            personInfoArray = personInfoOriginalArray.filter({($0.name!.uppercased().contains(searchBar.text!))})
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        personInfoArray = personInfoOriginalArray
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    
    
    func savePersonInfo(object: PersonInformation, editPersonInfo: Bool) {
        
        if editPersonInfo {
            personTableView.reloadData()
            
        } else {
            personInfoArray.append(object)
            personTableView.reloadData()
        }
        personInfoOriginalArray = personInfoArray
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
    }

    @objc func buttonAction(_ sender: UIBarButtonItem) {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "PersonInfoTableViewController") as? PersonInfoTableViewController {
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personInfoArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as! PersonTableViewCell

        let obj = personInfoArray[indexPath.row]
        cell.nameLabel.text = "Name: \(obj.name!)"
        cell.ageLabel.text = "Age: \(obj.age!)"
        cell.phoneNumberLabel.text = "Phone Number: \(obj.phoneNumber!)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Edit", message: "", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { action in
            print("delete \(indexPath.row)")
        }
        let editAction = UIAlertAction(title: "Edit", style: .default) { action in
            let obj = self.personInfoArray[indexPath.row]
            
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PersonInfoTableViewController") as? PersonInfoTableViewController {
                
                controller.person = obj
                controller.delegate = self
                controller.isEdit = true
                
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(editAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }



}
