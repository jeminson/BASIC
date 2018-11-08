//
//  SingletonClassTest.swift
//  TDDTestingTests
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import XCTest
@testable import TDDTesting

class SingletonClassTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSingletonClass() {
        
        // creating new object, so both have different state which means that these two are differnt, not the same 
        let singletonObject = SingletonClass.shared
        let singletonObject1 = SingletonClass.shared // cannot use SingletonClass() <- because inside SingletonClass has initialized 
        
        XCTAssert(singletonObject === singletonObject1, "Both should have same reference.")
    }

}
