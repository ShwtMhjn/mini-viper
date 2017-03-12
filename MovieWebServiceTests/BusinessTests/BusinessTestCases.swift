//
//  BusinessTestCases.swift
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
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
        if let path = Bundle.main.path(forResource: "MovieDataSingle", ofType: "json") {
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
        let jsonData : [String : AnyObject]? = baseBusiness?.fetchJSONFromFile(fileName: "MovieDataSingle").result
        XCTAssertNotNil(jsonData, "JSON files not parsed")
    }

    func testFetchArrayJson() {
        let jsonData : [String : AnyObject]? = baseBusiness?.fetchJSONFromFile(fileName: "MovieDataArray").result
        XCTAssertNotNil(jsonData, "JSON files not parsed")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
