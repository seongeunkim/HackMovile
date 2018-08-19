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
    
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIndicator.startAnimating()
        self.loadIndicator.hidesWhenStopped = true
        self.numExpLabel.text = ""
        imageHeader.load(url: imageURL!)
        APIManager.getExperiences { (experiences, errors) in
            if let experiences = experiences {
                self.experiences = experiences
                self.numExpLabel.text = "\(self.experiences.count) experiências super cremosas"
                self.categoryTable.reloadData()
                self.loadIndicator.stopAnimating()
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let index = categoryTable.indexPath(for: cell)!.row
            if segue.identifier == "toDetails" {
                let vc = segue.destination as! ProductDetailsViewController
                vc.selectedExperience = self.experiences[index]
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
        
    }
    
    
}
