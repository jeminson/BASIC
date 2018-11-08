//
//  ViewController.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
    var dataSourceDelegate: TableViewDelegateDateSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //let app = UIApplication.shared // Provided by apple -> Singleton Class
        
        dataSourceDelegate = TableViewDelegateDateSource(data: ["Jemin", "Yeji", "David", "Yoonku"])
        tblView.dataSource = dataSourceDelegate
        tblView.delegate = dataSourceDelegate
        dataSourceDelegate.delegate = self
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? String {
            if let dest = segue.destination as? SecondViewController {
                dest.data = data
            }
        }
    }
    
}

extension MainViewController: TableViewRowSelectionProtocol {
    func didSelectRow(data: String) {
        
        performSegue(withIdentifier: "go", sender: data)
        
    }
}
