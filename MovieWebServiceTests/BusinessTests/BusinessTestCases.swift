//
//  BusinessTestCases.swift
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import XCTest

class BusinessTestCases: XCTestCase {
    var baseBusiness : BaseBusiness? = nil
    var jsonObject : Any? = nil
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        baseBusiness = BaseBusiness()
        self.fetchJSONFromFile()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        baseBusiness = nil
        jsonObject = nil
        super.tearDown()
    }
    
    func fetchJSONFromFile() {
        if let path = Bundle.main.path(forResource: "MovieData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    /*let jsonResult: [AnyObject]? = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyObject]
                    if let _jsonResult = jsonResult {
                        jsonObject = _jsonResult
                    }*/
                    jsonObject = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) //as? [AnyObject]
                } catch {}
            } catch {}
        }
    }
    
    func testFetchJson() {
        let jsonData : [String : AnyObject]? = baseBusiness?.fetchJSONFromFile(fileName: "MovieData").result
//        var isEqual : Bool = false
//        let isEqual : Bool = false
//        if let _jsonData = jsonData {
//        if let _ = jsonData {
//            isEqual = (NSDictionary(dictionary: _jsonData).isEqual(to: jsonObject!)) ? true : false
//        }
//        XCTAssertTrue(isEqual, "JSON files do not match")
        XCTAssertNotNil(jsonData, "JSON files not parsed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
