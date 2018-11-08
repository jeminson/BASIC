//
//  TableViewTest.swift
//  TDDTestingTests
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import XCTest
@testable import TDDTesting

class TableViewTest: XCTestCase {

    var dataSourceDelegate: TableViewDelegateDateSource!
    var tableView: UITableView!
    var mock: TableViewDelegateMock!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        dataSourceDelegate = TableViewDelegateDateSource(data: ["Test1", "Test2", "Test3", "Test4"])
        tableView =  UITableView()
        tableView.dataSource = dataSourceDelegate
        tableView.delegate = dataSourceDelegate
        mock = TableViewDelegateMock()
        dataSourceDelegate.delegate = mock
    }

    override func tearDown() {
        dataSourceDelegate = nil 
    }
    
    func testTableViewNumberOfSection() {
        let sections = dataSourceDelegate.numberOfSections(in: tableView)
        XCTAssert(sections == 1, "Table view should have only one section.")
    }

    func testTableViewRowSection() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        dataSourceDelegate.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssert(mock.data == "Test1", "Correct")
    }
    
}
