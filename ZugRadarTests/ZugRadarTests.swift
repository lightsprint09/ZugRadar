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
        
        let request = URLRequest(url: URL(string: "http://www.apps-bahn.de/bin/livemap/query-livemap.exe/dny?L=vs_livefahrplan&performLocating=1&performFixedLocating=10&look_requesttime=16:39:30&livemapRequest=yes&ts=20170922&")!)
        let expectationN = expectation(description: "hi")
        let task = URLSession(configuration: .default).dataTask(with: request, completionHandler: { data2, response, _ in
            print(String(bytes: data2!, encoding: .utf8))
            print(response, data2!)
            let trains = parse(data: data2!)
            expectationN.fulfill()
            
        })
        task.resume()
        waitForExpectations(timeout: 10, handler: nil)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
}
