//
//  TableViewDelegateDateSource.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit


protocol TableViewRowSelectionProtocol {
    func didSelectRow(data: String)
}

class TableViewDelegateDateSource: NSObject {
    
    let data: [String]
    var delegate: TableViewRowSelectionProtocol?
    
    init(data: [String]) {
        
        self.data = data
    
    }

}

extension TableViewDelegateDateSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return rows based on complex logic
        return data.count
    }
    
    // This cannot be done on test case
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    
}


extension TableViewDelegateDateSource: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = data[indexPath.row]
        delegate?.didSelectRow(data: value)
        
        print(value)
    }
}
