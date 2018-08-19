//
//  CategoryController.swift
//  Hackathon
//
//  Created by WELLINGTON BARBOSA on 18/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit
import Alamofire

class CheckOutController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var checkoutTable: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    private var availabilities: [Availability] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutButton.setCorner(radius: 20, borderColorHex: nil)
        loadIndicator.startAnimating()
        self.loadIndicator.hidesWhenStopped = true
        APIManager.getAvailabilities { (availabilities, errors) in
            if let availabilities = availabilities {
                self.availabilities = availabilities
                self.checkoutTable.reloadData()
                self.loadIndicator.stopAnimating()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.availabilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCheckoutIdentifier") as! DateTableViewCell
        cell.populateCell(data: availabilities[indexPath.row])
        cell.setSelected(selected: false)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? DateTableViewCell {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                cell.setSelected(selected: false)
            }
            else{
                cell.accessoryType = .checkmark
                cell.setSelected(selected: true)
            }
        }
    }
    
    
}
