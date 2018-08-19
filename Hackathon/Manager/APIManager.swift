//
//  APIManager.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation

class APIManager {
    
    static func getExperiences(completion: @escaping ([Experience]?, Errors?) -> Void) {
        AlamofireService.getJsonFromHttp(url: "http://192.168.25.43:3000/experiences/") { (json, error) in
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
        AlamofireService.getJsonFromHttp(url: "http://192.168.25.43:3000/home/") { (json, error) in
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
    
}
