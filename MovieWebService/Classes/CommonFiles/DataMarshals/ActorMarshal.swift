//
//  ActorMarshal.swift
//  MovieWebService
//
//  Created by Sasha on 03/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

import Foundation

class ActorMarshal : NSObject {
    var actor : Actor?
    init(data : [String : AnyObject]) {
        super.init()
        let name : String? = data.stringForKey(Constants.kName)
        let screenName : String? = data.stringForKey(Constants.kScreenName)
        let biography : String? = data.stringForKey(Constants.kBiography)
        let dateOfBirth : Date? =  Date.init(timeIntervalSince1970: data.doubleForKey(Constants.kDateOfBirth))
        let films : [Film]? = [Film]()
        let nominated : Bool = data.boolForKey(Constants.kNominated)
        
        actor = Actor.init(name: name!, biography: biography!, dateOfBirth: dateOfBirth!, films: films!, nominated: nominated, screenName: screenName!)
    }
    
    func getActor()->(Actor?) {
        return actor
    }
}
