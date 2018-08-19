//
//  Availability.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation

class Availability {
    
    var month: String
    var day: Int
    var period: String
    
    init(json: [String:Any]) {
        self.month = json["month"] as! String
        self.day = json["day"] as! Int
        self.period = json["period"] as! String
    }
}
