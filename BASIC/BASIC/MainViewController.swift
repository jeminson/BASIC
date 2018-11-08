//
//  ViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var topicArray : [[String : String]] = [[:]]
    var subTitleArray : [[String : String]] = [[:]]

    func numberOfSections(in tableView: UITableView) -> Int {
        return topicArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var weekNum : String?
        
        switch section {
        case 0:
            weekNum = "Week 1"
        case 1:
            weekNum = "Week 2"
        case 2:
            weekNum = "Week 3"
        case 3:
            weekNum = "Week 4"
        default:
            break
        }
        
        return weekNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfRow : Int?
        
        switch section {
        case 0 :
            numOfRow = topicArray[0].count
        case 1:
            numOfRow = topicArray[1].count
        case 2:
            numOfRow = topicArray[2].count
        case 3:
            numOfRow = topicArray[3].count
        default:
            break
        }
        return numOfRow!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        
        cell.titleLabel.text = topicArray[indexPath.section][String(indexPath.row)]
        cell.subTitleLabel.text = subTitleArray[indexPath.section][String(indexPath.row)]
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topicTitle : String = topicArray[indexPath.section][String(indexPath.row)]!
        
        setAlertMessage(title: topicTitle)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
        
        if let path = Bundle.main.path(forResource: "Topic", ofType: "plist") {
            let array = NSArray(contentsOfFile: path)
            
            topicArray = array as! [[String : String]]
        }
        
        if let path = Bundle.main.path(forResource: "Subtitle", ofType: "plist") {
            let array = NSArray(contentsOfFile: path)
            
            subTitleArray = array as! [[String : String]]
        }

    }


}



extension MainViewController {
    
    func setAlertMessage(title: String) {
        let alertController = UIAlertController(title: "Go Go Go", message: "Let's check it out!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "No thanks", style: .default)
        let goAction = UIAlertAction(title: "Okay", style: .default) { action in
            
            switch title {
            case "Contact List":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Date":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DateViewController") as? DateViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Fizzbuzz":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FizzbuzzViewController") as? FizzbuzzViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Person":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PersonTableViewController") as? PersonTableViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Picker":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "P list":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "PlistViewController") as? PlistViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "SearchBar":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "SearchBarTableViewController") as? SearchBarTableViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Timer":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Extensions":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ExtensionsViewController") as? ExtensionsViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "CornerRadius":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "CornerRadiusViewController") as? CornerRadiusViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Notification":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FirstNotificationViewController") as? FirstNotificationViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Queue":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "QueueViewController") as? QueueViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case "Keyboard":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "KeyboardViewController") as? KeyboardViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                
            case "ImageFromServer":
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ImageFromServerViewController") as? ImageFromServerViewController {
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            default:
                break
            }
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(goAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
}
