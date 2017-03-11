//
//  EntityTestCases.swift
//  MovieWebService
//
//  Created by Sasha on 03/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import XCTest

class EntityTestCases: XCTestCase {
    var jsonObject : [String: AnyObject]! = nil
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.fetchJSONFromFile()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func fetchJSONFromFile() {
        if let path = Bundle.main.path(forResource: "MovieData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: [String: AnyObject]? = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]
                    if let _jsonResult = jsonResult {
                        jsonObject = _jsonResult
                    }
                } catch {}
            } catch {}
        }
    }
    
    func testFilmMarshalInit() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertNotNil(film)
    }

    func testActorMarshalInit() {
        let actorMarshal : ActorMarshal = ActorMarshal.init(data: jsonObject)
        let actor : Actor = actorMarshal.getActor()!
        XCTAssertNotNil(actor)
    }
    
    func testDirectorMarshalInit() {
        let directorMarshal : DirectorMarshal = DirectorMarshal.init(data: jsonObject.dictionaryForKey(Constants.kDirector)!)
        XCTAssertNotNil(directorMarshal, "Director Marshal is Nil!!!")
    }
    
    func testdirectorFromData() {
        let directorMarshal : DirectorMarshal = DirectorMarshal.init(data: jsonObject.dictionaryForKey(Constants.kDirector)!)
        let director = directorMarshal.getDirector()
        XCTAssertNotNil(director, "Director is Nil!!!")
    }

    func testGetFilm() {
//        var film = Film.init(name: "Mew", filmRating: 2, rating: 6.3, languages: ["English","Greek"], actors: [], director: director!, releaseDate: releaseDate!, nominated: nominated)

    }
    
    func testActorsFromData() {
        let actors : [Actor]? = FilmMarshal().actorsFromData(data: jsonObject.arrayForKey(Constants.kCast))

        XCTAssertNotNil(actors, "Actors NIL!!!")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
