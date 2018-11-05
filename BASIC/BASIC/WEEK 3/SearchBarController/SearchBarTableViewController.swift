//
//  SearchBarViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 2..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class SearchBarTableViewController: UITableViewController, UISearchResultsUpdating {
    

    @IBOutlet weak var nameSearchBar: UISearchBar!
    @IBOutlet var nameTableView: UITableView!
    
    let nameSearchController = UISearchController(searchResultsController: nil)
    
    var unfilteredArray : [String] = ["JeMin", "Yeji", "Yoonku", "David"]
    var filteredArray : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray = unfilteredArray
        nameSearchController.searchResultsUpdater = self
        nameSearchController.hidesNavigationBarDuringPresentation = false
        nameSearchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = nameSearchController.searchBar
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = filteredArray else {
            return 0
        }
        return array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        
        if let array = filteredArray {
            let arr = array[indexPath.row]
            cell.textLabel!.text = arr
        }
    
        return cell
    }
    
    
    func updateSearchResults(for nameSearchController: UISearchController) {
        if let nameSearchText = nameSearchController.searchBar.text, !nameSearchText.isEmpty {
            filteredArray = unfilteredArray.filter { arr in
                return arr.lowercased().contains(nameSearchText.lowercased())
            }
            
        } else {
            filteredArray = unfilteredArray
        }
        tableView.reloadData()
    }

}
