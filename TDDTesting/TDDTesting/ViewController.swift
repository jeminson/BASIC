//
//  ViewController.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var dataSourceDelegate: TableViewDelegateDateSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //let app = UIApplication.shared // Provided by apple -> Singleton Class
        
        dataSourceDelegate = TableViewDelegateDateSource(data: ["Jemin", "Yeji", "David", "Yoonku"])
        tblView.dataSource = dataSourceDelegate
    }


}

