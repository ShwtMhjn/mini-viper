//
//  Film.swift
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

import Foundation

class Film : NSObject {
    open var name           : String        = Constants.kEmptyString
    open var filmRating     : FilmRating    = FilmRating.UNDEFINED
    open var rating         : Double        = Constants.kZeroDouble
    open var languages      : [String]      = []
    open var actors         : [Actor]?      = []
    open var director       : Director!
    open var releaseDate    : Date          = Constants.kGenericDate
    open var nominated      : Bool          = false
    
    init(name:String, filmRating: FilmRating, rating: Double, languages:[String], actors:[Actor]?, director: Director, releaseDate: Date, nominated:Bool) {
        self.name = name
        self.filmRating = filmRating
        self.rating = rating
        self.languages = languages
        self.actors = actors
        self.director = director
        self.releaseDate = releaseDate
        self.nominated = nominated
    }
}
