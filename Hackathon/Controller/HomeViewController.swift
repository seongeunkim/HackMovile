//
//  ViewController.swift
//  Hackathon
//
//  Created by Seong Eun Kim on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalExperiencesLabel: UILabel!
    
    var details: [String:Any]?
    var highlights: [[String:Any]] = []
    var cities: [[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.getHomeDetails()
        self.setNavBarColor()
    }
    
    func setHomeUI() {
        self.totalExperiencesLabel.text = "1245 experiências incríveis"
    }
    
    func getHomeDetails() {
        APIManager.getHomeDetails { (dict, error) in
            if error != nil {
                return
            } else {
                self.details = dict
                self.highlights = dict!["highlights"] as! [[String:Any]]
                self.cities = dict!["cities"] as? [[String:Any]]
                self.tableView.reloadData()
                self.collectionView.reloadData()
            }
        }
    }

    func setNavBarColor() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#FFFAF3")
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell {
            let index = collectionView.indexPath(for: cell)!.row
            if segue.identifier == "toCategory" {
                let vc = segue.destination as! CategoryController
                let main = self.details!["main"] as! [[String:Any]]
                vc.imageURL = main[index]["image"] as! String
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return highlights.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCell", for: indexPath) as! FeaturedTableViewCell
        if self.highlights.count != 0 {
            if indexPath.section == 0 {
                cell.experienceTitle.text = highlights[indexPath.row]["title"] as! String
                let cityData = highlights[indexPath.row]["city"] as! [String:Any]
                cell.locationLabel.text = cityData["name"] as! String
                cell.experienceImage.load(url: highlights[indexPath.row]["image"] as! String)
            } else {
                let items = cities![indexPath.row]["items"] as! [[String:Any]]
                cell.experienceTitle.text = items[2]["title"] as! String
                let cityData = items[2]["city"] as! [String:Any]
                cell.locationLabel.text = cityData["name"] as! String
                cell.experienceImage.load(url: items[2]["image"] as! String)
            }
//            cell.experienceTitle.text = "bla"
//            cell.locationLabel.text = "Onde: bla"
//            cell.experienceImage.backgroundColor = .black
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! FeaturedHeaderTableViewCell
        if section == 0 {
            headerCell.title.text = "Em destaque"
        } else {
            headerCell.title.text = "Poços de Caldas"
        }
        return headerCell
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
        if self.details != nil {
            let main = self.details!["main"] as! [[String:Any]]
            categoryCell.categoryImage.load(url: main[indexPath.row]["image"] as! String)
            categoryCell.categoryLabel.text = main[indexPath.row]["name"] as? String
        }
        return categoryCell
    }
    
    
}


