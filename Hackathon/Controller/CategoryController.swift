//
//  CategoryController.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit
import Alamofire

class CategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var categoryTable: UITableView!
    @IBOutlet weak var numExpLabel: UILabel!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    private var experiences: [Experience] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndicator.startAnimating()
        self.loadIndicator.hidesWhenStopped = true
        self.numExpLabel.text = ""
        imageHeader.load(url: "https://st.depositphotos.com/1226177/4047/v/950/depositphotos_40477545-stock-illustration-pop-art-comic-speech-bubble.jpg")
        APIManager.getExperiences { (experiences, errors) in
            if let experiences = experiences {
                self.experiences = experiences
                self.numExpLabel.text = "\(self.experiences.count) experiências super cremosas"
                self.categoryTable.reloadData()
                self.loadIndicator.stopAnimating()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.experiences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategoryIdentifier") as! CategoryTableViewCell
        cell.populateCell(experience:self.experiences[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
    }
    
    
}
