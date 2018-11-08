//
//  TableViewDelegateDateSource.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class TableViewDelegateDateSource: NSObject {
    
    let data: [String]
    init(data: [String]) {
        
        self.data = data
    
    }

}

extension TableViewDelegateDateSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    
}
