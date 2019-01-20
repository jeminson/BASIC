//
//  ViewController.swift
//  NotificationCenterDemo
//
//  Created by Je Min Son on 1/20/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  
    @IBOutlet weak var countryChosenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home View Controller"
        
        NotificationCenter.default.addObserver(self, selector: #selector(setToKorea(notification:)), name: .korea, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setToJapan(notification:)), name: .japan, object: nil)
        
    }

    @objc func setToKorea(notification: NSNotification) {
        countryChosenLabel.text = "Korea"
    }

    @objc func setToJapan(notification: NSNotification) {
        countryChosenLabel.text = "Japan"
    }
}

extension Notification.Name {
    static let korea = Notification.Name("Korea")
    static let japan = Notification.Name("Japan")
}
