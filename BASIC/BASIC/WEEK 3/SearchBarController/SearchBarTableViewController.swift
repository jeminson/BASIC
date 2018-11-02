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
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var unfilteredArray : [String] = ["JeMin", "Yeji", "Yoonku", "David"]
    var filteredArray : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray = unfilteredArray
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
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
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredArray = unfilteredArray.filter { arr in
                return arr.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredArray = unfilteredArray
        }
        tableView.reloadData()
    }

}
