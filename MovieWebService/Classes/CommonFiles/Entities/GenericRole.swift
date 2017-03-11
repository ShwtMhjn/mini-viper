//
//  GenericRole.swift
//  MovieWebService
//
//  Created by Sasha on 03/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import Foundation

class GenericRole: NSObject {
    open var name : String? = Constants.kEmptyString
    open var biography : String? = Constants.kEmptyString
    open var dateOfBirth : Date? = Constants.kGenericDate
    open var films : [Film]? = []
    open var nominated : Bool = false
        
    init(name:String, biography: String, dateOfBirth: Date, films:[Film]?, nominated:Bool) {
        self.name = name
        self.biography = biography
        self.dateOfBirth = dateOfBirth
        self.films = films
        self.nominated = nominated
    }
}
