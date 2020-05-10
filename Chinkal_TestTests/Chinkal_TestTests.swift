//
//  Chinkal_TestTests.swift
//  Chinkal_TestTests
//
//  Created by chinkalshah on 08/05/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import XCTest
@testable import Chinkal_Test

class Chinkal_TestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        if let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=%201&limit=10") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let response = try JSONDecoder().decode([Blog].self, from: data)
                     print(response)
                  } catch _ {
                     XCTFail("Fail")
                  }
               }
           }.resume()
        }
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
