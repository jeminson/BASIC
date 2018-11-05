//
//  ExtensionsViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ExtensionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Extensions"
        
        
        // Using my own function instead of using pre-defined function
        // 1. Create extension String
        // 2. Add your own functions
        let strValue = "Hello"
        print(strValue.length)
        print(strValue.upper)
        print(strValue.lower)

        
        let tomorrowDate = Date().tomorrow
        print(tomorrowDate!)
        let dayAfterTmrw = Date().dayAfterTmrw
        print(dayAfterTmrw!)
        let yesterdayDate = Date().yesterday
        print(yesterdayDate!)
        
    }

}

extension ExtensionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtensionsTableViewCell") as! ExtensionsTableViewCell
        
        return cell
    }
}
