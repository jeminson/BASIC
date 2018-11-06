//
//  ThirdNotificationViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ThirdNotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Third"
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationFunctionName), name: NSNotification.Name(rawValue: keyValue), object: nil)
    }
    
    @objc func notificationFunctionName(notification: NSNotification) {
        print(notification)
        print(notification.object!)
    }
    

    

}
