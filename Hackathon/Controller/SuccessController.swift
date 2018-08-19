//
//  SuccessController.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation
import UIKit

class SuccessController: UIViewController {
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.setCorner(radius: 20, borderColorHex: nil)
    }

}

