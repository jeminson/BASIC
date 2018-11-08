//
//  TableViewDelegateMock.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import Foundation
@testable import TDDTesting

class TableViewDelegateMock: TableViewRowSelectionProtocol {
    
    var data: String!
    var isSelected = false
    
    func didSelectRow(data: String) {
        self.data = data
        isSelected = true
    }
    
}
