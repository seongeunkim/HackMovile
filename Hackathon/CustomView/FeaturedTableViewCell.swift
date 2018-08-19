//
//  FeaturedTableViewCell.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {

    @IBOutlet weak var experienceImage: UIImageView!
    @IBOutlet weak var experienceTitle: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
