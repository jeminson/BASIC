//
//  ContactInfoViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var placeHolderArray : [String] = ["First Name", "Last Name", "Zip Code"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeHolderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInfoCell")
        
        
        
        
        return cell!
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Informations"
    }
    

    @IBAction func saveActionButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
