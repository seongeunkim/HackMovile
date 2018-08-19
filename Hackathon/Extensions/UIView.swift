//
//  UIView.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func setCorner(radius: Float, borderColorHex: String?) {
        if let borderColorHex = borderColorHex {
            self.layer.borderColor = UIColor(hexString: borderColorHex).cgColor
            self.layer.borderWidth = 1
        }
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
    }
}
