//
//  FizzbuzzViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class FizzbuzzViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FizzbuzzCell")
        
        
        if (indexPath.row+1) % 15 == 0 {
            cell?.textLabel?.text = "fizzbuzz"
            cell?.backgroundColor = UIColor.red
        } else if (indexPath.row+1) % 5 == 0 {
            cell?.textLabel?.text = "buzz"
            cell?.backgroundColor = UIColor.lightGray
        } else if (indexPath.row+1) % 3 == 0 {
            cell?.textLabel?.text = "fizz"
            cell?.backgroundColor = UIColor.gray
        } else {
            cell?.textLabel?.text = String(indexPath.row+1)
            cell?.backgroundColor = UIColor.white
        }
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fizzbuzz"
    }
    

   

}
