//
//  FourthNotificationViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class FourthNotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fourth"
    }
    

    @IBAction func actionButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: keyValue), object: "Test")
    }

}
