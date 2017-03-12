//
//  Actor.swift
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

import Foundation

class Actor : GenericRole {
    open var screenName : String = Constants.kEmptyString
    
    init(name:String, biography: String, dateOfBirth: Date, films:[Film]?, nominated:Bool, screenName:String) {
        super.init(name: name, biography: biography, dateOfBirth: dateOfBirth, films: films, nominated: nominated)
        self.screenName = screenName
    }
}
