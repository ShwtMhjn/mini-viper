//
//  FilmStore.swift
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import Foundation

class FilmStore : NSObject {
    static fileprivate var filmStore : FilmStore?

    var films : [Film]? = nil
    
    open class func sharedInstance () -> FilmStore {
        
        if let sharedObject = filmStore {
            return sharedObject
        }
        
        filmStore = FilmStore()
        return filmStore!
    }
    
    func findAndStoreFilms()->[Film]? {
        let data = BaseBusiness().fetchJSONFromFile(fileName: "MovieData")
        if let _data = data.result {
            films = FilmMarshal().getFilmArray(data: _data)
        }
        return films
    }
}
