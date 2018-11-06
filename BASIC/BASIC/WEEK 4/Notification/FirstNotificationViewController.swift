//
//  NotificationViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

let keyValue = "KeyValuePass"

class FirstNotificationViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First Notification"
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationFunctionName), name: NSNotification.Name(rawValue: keyValue), object: nil)
    }
    
    @objc func notificationFunctionName(notification: NSNotification) {
        print(notification)
        print(notification.object!)
    }
    
    

    
}
