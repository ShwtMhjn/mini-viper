//
//  DirectorMarshal.swift
//  MovieWebService
//
//  Created by Sasha on 07/03/17.
//

import Foundation

class DirectorMarshal : NSObject {
    var director : Director?
    
    init(data : [String : AnyObject]) {
        super.init()
        let name : String? = data.stringForKey(Constants.kName)
        let biography : String? = data.stringForKey(Constants.kBiography)
        let dateOfBirth : Date? =  Date.init(timeIntervalSince1970: data.doubleForKey(Constants.kDateOfBirth))
        let films : [Film]? = [Film]()
        let nominated : Bool = data.boolForKey(Constants.kNominated)
        
        director = Director.init(name: name!, biography: biography!, dateOfBirth: dateOfBirth!, films: films!, nominated: nominated)
    }
    
    func getDirector()->(Director?) {
        return director
    }
}
