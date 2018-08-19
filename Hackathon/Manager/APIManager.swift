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
        AlamofireService.getJsonFromHttp { (json, error) in
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
    
}
