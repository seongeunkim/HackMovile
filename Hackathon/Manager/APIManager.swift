//
//  APIManager.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation

let API: String = "http://192.168.25.43:3000"

class APIManager {
    
    static func getExperiences(completion: @escaping ([Experience]?, Errors?) -> Void) {
        AlamofireService.getJsonFromHttp(url:"\(API)/experiences/") { (json, error) in
            if (error != nil) {
                completion(nil, error)
                return
            }
            guard let resultArray = json as? [[String: Any]] else {
                completion(nil, .JsonParseError)
                return
            }
            let experiences = resultArray.map({ (element) in
                return Experience(json: element)
            })
            completion(experiences, nil)
        }
    }
    
    static func getHomeDetails(completion: @escaping ([String: Any]?, Errors?) -> Void) {
        AlamofireService.getJsonFromHttp(url: "\(API)/home/") { (json, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            guard let result = json as? [String:Any] else {
                completion(nil, .JsonParseError)
                return
            }
            completion(result, nil)
        }
    }

    static func getAvailabilities(completion: @escaping ([Availability]?, Errors?) -> Void) {
        AlamofireService.getJsonFromHttp(url:"\(API)/home/") { (json, error) in
            if (error != nil) {
                completion(nil, error)
                return
            }
            guard let resultDict = json as? [String: Any] else {
                completion(nil, .JsonParseError)
                return
            }
            let highlights = resultDict["highlights"] as! [[String: Any]]
            let first = highlights[0] as! [String: Any]
            let result = first["availability"] as! [[String: Any] ]
            let availabilities = result.map({ (element) in
                return Availability(json: element as! [String : Any])
            })
            
            completion(availabilities, nil)
        }
    }
    
}
