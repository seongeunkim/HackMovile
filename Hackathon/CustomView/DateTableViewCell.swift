//
//  DateTableViewCell.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumb.layer.cornerRadius = 10
        self.thumb.clipsToBounds = true
        self.thumb.layer.borderWidth = 3
    }
    
//    func populateCell(booking: Booking){
//        
//        title.text = experience.title
//        local.text = "Onde: \(experience.city),\(experience.state)"
//        price.text = String(format: "R$ %.02f por pessoa", experience.price)
//        thumb.load(url: "https://st.depositphotos.com/1226177/4047/v/950/depositphotos_40477545-stock-illustration-pop-art-comic-speech-bubble.jpg")
//    }
}

