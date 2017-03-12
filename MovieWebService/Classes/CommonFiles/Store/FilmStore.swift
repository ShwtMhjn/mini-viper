//
//  FilmStore.swift
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
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
        let data = BaseBusiness().fetchJSONFromFile(fileName: "MovieDataSingle")
        if let _data = data.result {
            films = FilmMarshal().getFilmArray(data: _data)
        }
        return films
    }
}
