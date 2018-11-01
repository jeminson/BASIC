//
//  WEEK3ViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class WEEK3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var week3Array : [String] = ["FizzBuzz"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return week3Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell")
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WEEK 3"
    }
    



}
