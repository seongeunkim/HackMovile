//
//  ProductDetailsViewController.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var experienceImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedExperience: Experience?
    var name:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUIElements()
    }
    
    func setUIElements() {
        self.nameLabel.text = self.selectedExperience?.title
        self.priceLabel.text = self.selectedExperience?.price
        self.descriptionLabel.text = self.selectedExperience?.description
        self.experienceImage.load(url: (self.selectedExperience?.image)!)
    }

}
