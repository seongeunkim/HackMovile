//
//  CategoryTableViewCell.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
  
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell(experience: Experience){
        
        title.text = experience.title
        local.text = "Onde: \(experience.city),\(experience.state)"
        price.text = experience.price
        thumb.load(url: experience.image)
    }
}
