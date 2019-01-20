//
//  ViewControllerB.swift
//  DelegateWithProtocolDemo
//
//  Created by Je Min Son on 1/19/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

// Step 1: Add protocol
protocol ClassBDelegate {
    func sendString(str: String?)
}

class ViewControllerB: UIViewController {

    @IBOutlet weak var textFromViewControllerALablel: UILabel!
    // Step 2: Create delegate property
    var delegate : ClassBDelegate?
    
    var textFromViewControllerA : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View Controller B"
        
        textFromViewControllerALablel.text = textFromViewControllerA
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        // Step 3: Add delegate method call 
        delegate?.sendString(str: "Hello")
        navigationController?.popViewController(animated: true)
    }
    
}
