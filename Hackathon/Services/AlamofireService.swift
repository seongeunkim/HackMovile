//
//  AlamofireService.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireService {
    
    static func getJsonFromHttp(completion: @escaping(Any?, Errors?) -> Void) {
        let todoEndpoint: String = "http://192.168.25.43:3000/experiences/"
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    completion(nil, .InvalidJson)
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        completion(nil, .ResponseError)
                        print("Error: \(error)")
                    }
                    return
                }
                
                completion(json, nil)
        }
    }

}