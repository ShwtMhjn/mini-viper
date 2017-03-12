//
//  EntityTestCases.swift
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
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
        if let path = Bundle.main.path(forResource: "MovieDataSingle", ofType: "json") {
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

    func fetchJSONFromFileOFArrays()->([String: AnyObject]?) {
        if let path = Bundle.main.path(forResource: "MovieDataArray", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: [String: AnyObject]? = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]
                    if let _jsonResult = jsonResult {
                        return _jsonResult
                    }
                } catch {}
            } catch {}
        }
        return nil
    }
    
    class MockedFilms: NSObject {
        var actor : Actor
        var director : Director
        let film : Film
        
        override init() {
        
            actor = Actor.init(name: "Bryan Cranston", biography: "Bryan Lee Cranston is an American actor, voice actor, writer and director.", dateOfBirth: Date.init(timeIntervalSince1970: -436147200), films: [], nominated: true, screenName: "Jack Donnell")
            director = Director.init(name: "Ben Affleck", biography: "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA.", dateOfBirth: Date.init(timeIntervalSince1970: 82684800), films: [], nominated: true)
            film = Film.init(name: "Argo", filmRating: FilmRating(rawValue: 3)!, rating: 7.8, languages: ["English", "Thai"], actors: [actor], director: director, releaseDate: Date.init(timeIntervalSince1970: 1350000000), nominated: true)
            super.init()
        }
    }

    //MARK: -- Not Nil --
    func testFilmMarshalInitIsNotNil() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertNotNil(film, "Actor Marshal is Nil!!!")
    }

    func testActorMarshalInit() {
        let actorMarshal : ActorMarshal = ActorMarshal.init(data: jsonObject)
        let actor : Actor = actorMarshal.getActor()!
        XCTAssertNotNil(actor, "Actor Marshal is Nil!!!")
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
    
    func testActorsFromData() {
        let actors : [Actor]? = FilmMarshal().actorsFromData(data: jsonObject.arrayForKey(Constants.kCast))
        
        XCTAssertNotNil(actors, "Actors Nil!!!")
    }


    //MARK: -- Equal --
    func testSingleAndArrayFetch() {
        let arrayJson = self.fetchJSONFromFileOFArrays()
        let arrayParsed = FilmMarshal().getFilmArray(data: arrayJson!)
        XCTAssertEqual(arrayParsed!.first?.name, MockedFilms().film.name, "Array parsing does not match")
    }
    func testFilmName() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.name, MockedFilms().film.name, "Film names do not match!!!")
    }
    
    func testFilmRating() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.rating, MockedFilms().film.rating, "Film ratings do not match!!!")
    }
    
    func testFilmRatingScore() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.filmRating, MockedFilms().film.filmRating, "Film RatingScores do not match!!!")
    }
    
    func testFilmDirectorName() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.director.name, MockedFilms().director.name, "Film firector names do not match!!!")
    }
    
    func testFilmDirectorBio() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.director.biography, MockedFilms().director.biography, "Film Director Bio is not Equal to parsed data!!!")
    }

    func testFilmDirectorDOB() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.director.dateOfBirth, MockedFilms().director.dateOfBirth, "Film Director Bio is not Equal to parsed data!!!")
    }

    func testFilmActorDOB() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.actors?.first?.dateOfBirth, MockedFilms().actor.dateOfBirth, "Film Director Bio is not Equal to parsed data!!!")
    }

    func testFilmReleaseDate() {
        let film : Film? = FilmMarshal().marshalFilmData(data: jsonObject)
        XCTAssertEqual(film?.releaseDate, MockedFilms().film.releaseDate, "Film Director Bio is not Equal to parsed data!!!")
    }

    func testGetFilm() {
//        var film = Film.init(name: "Mew", filmRating: 2, rating: 6.3, languages: ["English","Greek"], actors: [], director: director!, releaseDate: releaseDate!, nominated: nominated)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
