//
//  ImageFromServerTests.swift
//  BASICTests
//
//  Created by Je Min Son on 2018. 11. 9..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//


import XCTest
@testable import BASIC

class ImageFromServerTests: XCTestCase {
    
    // TARGET: ASYNC API TESTING
    var instanceVC : ImageFromServerViewController?
    
    let urlString = "https://jsonplaceholder.typicode.com/albums/1/photos"
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        instanceVC = ImageFromServerViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        instanceVC = nil
    }
    
    func testAsyncAPITesting() {
//        instanceVC?.downloadJSON()
        guard let url = URL(string: self.urlString) else {return} // Early Exit
        
        // Setting the expectation
        let testExpectation = expectation(description: "Setting the Project Test Case Expectation")
        
        let dataTask = URLSession.shared.dataTask(with: url) {
            (imgData, imgResponse, apiError) in
            
            // Method 1. XCTAssertNil(apiError, "YOU'VE GOT AN ERROR!")         // ASSERTION STATEMENTS
            //           XCTAssertNotNil(imgData, "ERROR MSG!")
            
            
            // Method 2. Use if statement
            if((apiError) == nil) {
                // Test case should pass -> No error
                testExpectation.fulfill()
            }
            
            if(imgData != nil) {
                testExpectation.fulfill()
            }
            
            if let httpResponse = imgResponse as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {     // OK
                    
                }
                else {
                    // To Be Checked 
                }
            }
        }
        
        dataTask.resume()
        
        //wait(for: [testExpectation], timeout: 4)
        self.waitForExpectations(timeout: 20, handler: nil)
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
