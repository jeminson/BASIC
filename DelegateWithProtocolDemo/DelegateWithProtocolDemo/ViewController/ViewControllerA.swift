//
//  ViewController.swift
//  DelegateWithProtocolDemo
//
//  Created by Je Min Son on 1/19/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

// Step 4: Conform the protocol
// ViewControllerA adopt ClassBDelegate protocol
class ViewControllerA: UIViewController, ClassBDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View Controller A"
        
    }
    
    
    // ClassBDelegate method
    func sendString(str: String?) {
        print(str!)
    }

    @IBAction func nextButton(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
            
            let text = "Data passed successfully"
            controller.delegate = self
            controller.textFromViewControllerA = text
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}

