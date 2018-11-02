//
//  searchTableViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 23/8/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class searchTableViewController: UITableViewController,UISearchBarDelegate{

    @IBOutlet var searchbar: UISearchBar!
    let data = ["Butterfly Kick","Leg Lift","Push-up","Diamond Push-up","Lunges","Squats","Counter-movement Jump","Star Jump","Jumping jack","Tuck Jump","High Knee","Butt Kicks","Mountain climber","Forward Plank","Side Plank","Cobra Stretch","Crunch","Arm and Leg Raise","Ballet Twist","Bicycle Crunch"]
    
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        searchbar.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch UserDefaults.standard.integer(forKey: "napha"){
        case 1:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
        case 2:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
        case 3:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
        case 4:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
        case 5:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
        case 6:
            UserDefaults.standard.set(filteredData[indexPath.row], forKey: "String")
            
        default: print("error")
        }
        self.performSegue(withIdentifier: "Show", sender: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = UITableViewCell(style: .default, reuseIdentifier: "hi")
        cell.textLabel?.text = filteredData[indexPath.row]
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.lightGray
//            cell.textLabel?.textColor = UIColor.white
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
}




