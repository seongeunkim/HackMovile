//
//  DateTableViewCell.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 19/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateRoundedView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateRoundedView.setCorner(radius: 10, borderColorHex:"#ECECEC")
    }
    
    func populateCell(data: Availability){
        monthLabel.text = data.month
        dateLabel.text = "\(data.day)"
        hourLabel.text = data.period
    }
     
    func setSelected(selected: Bool){
        if selected {
            dateRoundedView.backgroundColor = UIColor(hexString: "#FF9600")
            monthLabel.textColor = .white
            dateLabel.textColor = .white
        } else {
            dateRoundedView.backgroundColor = UIColor.clear
            monthLabel.textColor = UIColor(hexString: "#4A4A4A")
            dateLabel.textColor = UIColor(hexString: "#FF9600")
        }
    }
    
}


