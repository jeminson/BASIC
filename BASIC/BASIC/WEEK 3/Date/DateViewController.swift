//
//  DateViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 1..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    @objc func setUpDate() {
        
        let date = Date()
        print(date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-dd-yyyy"        // MMM -> Oct (String), MM -> 10 (Int)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "MM-dd-yyyy"
        
        let dateString = formatter.string(from: date)

        let dateString2 = formatter2.string(from: date)

        
        dateLabel.text = dateString
        dateLabel2.text = dateString2
        
        let convertDate = formatter.date(from: dateString)
        print(convertDate!)
        let convertDate2 = formatter2.date(from: dateString2)
        print(convertDate2!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Date"
        
        setUpDate()
    }


}
