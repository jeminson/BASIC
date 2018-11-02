//
//  PlistViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 1..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit


class PlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var personArray: [[String : String]] = [[:]]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlistTableViewCell") as! PlistTableViewCell
        
        cell.firstnameLabel.text = "first name: \(personArray[indexPath.row]["New item"]!)"
        cell.lastnameLabel.text = "last name: \(personArray[indexPath.row]["New item - 2"]!)"
        cell.ageLabel.text = "age: \(personArray[indexPath.row]["New item - 3"]!)"
        cell.zipcodeLabel.text = "zip code: \(personArray[indexPath.row]["New item - 4"]!)"
        cell.phonenumberLabel.text = "phone number: \(personArray[indexPath.row]["New item - 5"]!)"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "P list"
        
        

        if let path = Bundle.main.path(forResource: "Person", ofType: "plist") {
            let array = NSArray(contentsOfFile: path)

            
            personArray = array as! [[String : String]]
            

            
        }
    }
    



}
