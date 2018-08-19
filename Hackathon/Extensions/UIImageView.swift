//
//  UIImageView.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: String) {
        do {
            let _url  = try url.asURL()
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: _url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } catch{
            print("error load image")
        }
    }
}
