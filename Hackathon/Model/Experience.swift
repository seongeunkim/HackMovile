//
//  Experience.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation

class Experience {
    
    var category: String
    var id: Int
    var description: String
    var city: String
    var state: String
    var price: Double
    var image: String
    var thumbImage: String
    var synopse: String
    var title: String
    
    init(json: [String:Any]) {
        self.category = json["category"] as! String
        self.id = json["id"] as! Int
        self.description = json["description"] as! String
        self.city = json["city"] as! String
        self.state = json["state"] as! String
        self.price = json["price"] as! Double
        self.image = json["image"] as! String
        self.thumbImage = json["thumb"] as! String
        self.synopse = json["sinopse"] as! String
        self.title = json["title"] as! String
    }
}
