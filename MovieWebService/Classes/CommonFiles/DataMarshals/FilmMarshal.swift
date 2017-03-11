//
//  FilmMarshal.swift
//  MovieWebService
//
//  Created by Sasha on 03/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import Foundation

class FilmMarshal : NSObject {
//    var film : Film? 
    
    open func marshalFilmData(data: [String : AnyObject]) -> Film? {
        let name : String? = data.stringForKey(Constants.kName)
        let filmRating : FilmRating? = FilmRating(rawValue: data.integerForKey(Constants.kFilmRating))
        let rating : Double? = data.doubleForKey(Constants.kRating)
        let languages : [String]? = data.arrayForKey(Constants.kLanguages) as! [String]?
        let releaseDate : Date? = Date.init(timeIntervalSince1970: data.doubleForKey(Constants.kReleaseDate))
        let nominated : Bool = data.boolForKey(Constants.kNominated)
        let actors : [Actor]? = self.actorsFromData(data: data.arrayForKey(Constants.kCast))
        let director : Director? = self.directorFromData(data: data.dictionaryForKey(Constants.kDirector))
        let film = Film.init(name: name!, filmRating: filmRating!, rating: rating!, languages: languages!, actors: actors, director: director!, releaseDate: releaseDate!, nominated: nominated)
        return film
    }
    
    func directorFromData(data:([String : AnyObject])?) -> Director? {
        let directorMarshal : DirectorMarshal = DirectorMarshal.init(data: data!)
        return directorMarshal.getDirector()
    }

    func actorsFromData(data:[AnyObject]?) -> [Actor]? {
        var actors : [Actor]? = [Actor]()
        for actorData in data! {
            let actorMarshal : ActorMarshal = ActorMarshal.init(data: actorData as! [String : AnyObject])
            let actor = actorMarshal.getActor()
                if let _actor = actor {
                    actors?.append(_actor)
                }
        }
        return actors
    }
    func getFilmArray(data: [String : AnyObject]) -> [Film]? {
        var films : [Film]? = [Film]()
        if let _data = data.arrayForKey("films") {
            for film in _data {
                if let _film = film as? [String : AnyObject] {
                    if let marshalledFilm = marshalFilmData(data: _film) {
                        films?.append(marshalledFilm)
                    }
                }
            }
        }
        return films
    }
}
