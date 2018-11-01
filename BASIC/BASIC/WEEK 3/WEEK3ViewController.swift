//
//  WEEK3ViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class WEEK3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var week3Array : [String] = ["FizzBuzz", "Timer", "Contact List"]
    
    
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
            switch indexPath.row {
            case 0:
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FizzbuzzViewController") as? FizzbuzzViewController {
     
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case 1:
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController {
                    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell")
        
        cell?.textLabel?.text = week3Array[indexPath.row]
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WEEK 3"
    }
    



}
