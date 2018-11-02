//
//  WEEK3ViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class WEEK3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var week3Array : [String] = ["FizzBuzz", "Timer", "Contact List", "Settings", "Date", "P list", "Picker", "PersonTableVC with SearchBar"]

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return week3Array.count
    }
    
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title : String = week3Array[indexPath.row]
        let message : String = "go check it out"
        
        let alertController = UIAlertController(title: "\(title)", message: String("\(message)"), preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .default)
        let okAction = UIAlertAction(title: "GO", style: .default) { action in
            switch title {
            case "FizzBuzz":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FizzbuzzViewController") as? FizzbuzzViewController {
     
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Timer":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "PersonTableVC with SearchBar":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PersonTableViewController") as? PersonTableViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Contact List":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Settings":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Date":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DateViewController") as? DateViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "P list":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PlistViewController") as? PlistViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Picker":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            default: break
                
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        week3Array.sort()
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell")
        
        cell?.textLabel?.text = week3Array[indexPath.row]
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WEEK 3"
    }
    

    

}
