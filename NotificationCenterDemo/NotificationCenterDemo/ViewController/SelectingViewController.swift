//
//  SelectingViewController.swift
//  NotificationCenterDemo
//
//  Created by Je Min Son on 1/20/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

class SelectingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Selecting View Controller"
    }
    

    @IBAction func countryButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            NotificationCenter.default.post(name: .korea, object: nil)
        case 2:
            NotificationCenter.default.post(name: .japan, object: nil)
        default:
            break
        }
        navigationController?.popViewController(animated: true)
    }
    

}
