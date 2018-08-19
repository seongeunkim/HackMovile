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
    var price: String
    var image: String
    var thumbImage: String
    var synopse: String
    var title: String
    
    init(json: [String:Any]) {
        let categoryInfo = json["category"] as! [String:Any]
        self.category = categoryInfo["name"] as! String
        self.id = json["id"] as! Int
        self.description = json["description"] as! String
        let location = json["city"] as! [String:Any]
        self.city = location["name"] as! String
        self.state = location["state"] as! String
        self.price = json["price"] as! String
        self.image = json["image"] as! String
        self.thumbImage = json["thumb"] as! String
        self.synopse = json["sinopse"] as! String
        self.title = json["title"] as! String
    }
}
