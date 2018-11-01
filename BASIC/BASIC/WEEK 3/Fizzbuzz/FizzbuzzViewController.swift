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
        
        cell?.textLabel?.text = checkFizzbuzz(num: indexPath.row+1)
        
        if checkFizzbuzz(num: indexPath.row+1) == "fizzbuzz" {
            cell?.backgroundColor = UIColor.red
        } else if checkFizzbuzz(num: indexPath.row+1) == "buzz" {
            cell?.backgroundColor = UIColor.lightGray
        } else if checkFizzbuzz(num: indexPath.row+1) == "fizz" {
            cell?.backgroundColor = UIColor.gray
        } else {
            cell?.backgroundColor = UIColor.white
        }

        return cell!
    }
    
    func checkFizzbuzz(num : Int) -> String {
        var text : String = ""
        
        if num % 5 == 0 && num % 3 == 0 {
            text = "fizzbuzz"
        } else if num % 5 == 0 {
            text = "buzz"
        } else if num % 3 == 0 {
            text = "fizz"
        } else {
            text = String(num)
        }
        return text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fizzbuzz"
    }
    


}
