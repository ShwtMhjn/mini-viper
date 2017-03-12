 //
 //  BaseBusiness.swift
 //  MovieWebService
 //
 //  Created by Sasha on 08/03/17.
 //
 
 import UIKit
 
 class BaseBusiness: NSObject {
    
    open func fetchJSONFromFile(fileName: String)->(result:[String : AnyObject]? , error:NSError?) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                let jsonResult = self.parseJsonData(jsonData as Data)
                return jsonResult
            } catch {}
        }
        return (nil , self.jsonFailureError())
    }
    
    func parseJsonData(_ data : Data)->(result:[String : AnyObject]? , error:NSError?) {
        do {
            let jsonResponse: [String : AnyObject]? = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]
            if let _jsonResponse = jsonResponse {
                return (_jsonResponse as [String : AnyObject]? , nil)
            }
            else {
                return (nil , self.jsonFailureError())
            }
        }
        catch let error as NSError {
            return (nil , error)
            
        }
    }
    
    func jsonFailureError() -> NSError {
        let userInfo: [NSObject : AnyObject] =
            [
                NSLocalizedDescriptionKey as NSObject :  NSLocalizedString(Constants.kErrorDomainJSONSerializationFailure, value: Constants.kErrorDescriptionJSONSerializationFailure, comment: Constants.kEmptyString) as AnyObject,
                NSLocalizedFailureReasonErrorKey as NSObject : NSLocalizedString(Constants.kErrorDomainJSONSerializationFailure, value: "JSON Serialization has failed", comment: "") as AnyObject
        ]
        let error : NSError = NSError(domain: Constants.kErrorDomainJSONSerializationFailure, code: 4444, userInfo: userInfo)
        return error
    }
 }
