//
//  Constants.swift
//  MovieWebService
//
//  Created by Sasha on 03/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import Foundation

//MARK: -- Enum -- FILMRATING --
@objc public enum FilmRating : Int {
    case G,
    PG,
    PG13,
    R,
    NC17,
    UNDEFINED
}

struct Constants {
    
    //MARK: -- Parsing Keys
    //MARK: -- Parsing Keys -- COMMON --
    static let kEmptyString : String = "";
    static let kZeroInteger : Int   = 0
    static let kZeroDouble  : Double = 0

    static let kGenericDate : Date = Date.distantPast;
    static let kNominated   : String = "nominated";
    
    //MARK: -- Parsing Keys -- FILM --
    static let kFilmRating  : String = "filmRating";
    static let kLanguages   : String = "languages";
    static let kReleaseDate : String = "releaseDate";
    static let kCast        : String = "cast";
    static let kRating      : String = "rating";
    static let kDirector    : String = "director";
    static let kActor       : String = "actor";
    
    //MARK: -- Parsing Keys -- GENERIC ROLE --
    static let kDateOfBirth : String = "dateOfBirth";
    static let kName        : String = "name";
    static let kBiography   : String = "biography";
    
    //MARK: -- Parsing Keys -- ACTOR --
    static let kScreenName  : String = "screenName";
    
    //MARK: -- Errors --
    static let kErrorDomainJSONSerializationFailure  : String = "JSONSerializationFailure";
    static let kErrorDescriptionJSONSerializationFailure : String = "Please use a valid file for JSON input"
    
    //MARK: -- Enum -- Values
    static let kFilmRatingEnum : Array = ["G", "PG", "PG13", "R", "NC17", "UNDEFINED"]
  
    //MARK: -- Keys for List --
    static let kListKeysArray : Array  = [kName, kFilmRating, kRating, kReleaseDate];
    
    //MARK: -- Formatters --
    static let kReleaseDateFormat : String = "MMM-dd-yyyy";
}
