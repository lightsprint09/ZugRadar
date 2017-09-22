//
//  ZugRadarTests.swift
//  ZugRadarTests
//
//  Created by Lukas Schmidt on 22.09.17.
//  Copyright © 2017 DBSystel. All rights reserved.
//

import XCTest
@testable import ZugRadar

class ZugRadarTests: XCTestCase {
    
    
    
    func testExample() {
        let bundle = Bundle(for: ZugRadarTests.self)
        let path = bundle.path(forResource: "data", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        
        parse(data: data)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
}
