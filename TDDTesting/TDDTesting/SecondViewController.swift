//
//  SecondViewController.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var data : String?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = data 

    }
    

}
