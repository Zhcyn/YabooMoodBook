//
//  ListController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 31/05/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

var arrayIndex = 0 // is used in DefinitionController to determine which title/definition/link to show.
var isSearching = false
var isShowingFavs = false

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    func navItemSelected(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "selected-fav"), style: .plain, target: self, action: #selector(showFavourites(sender:)))
    }
    
    func navItemDeselected(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "fav"), style: .plain, target: self, action: #selector(showFavourites(sender:)))
    }
    
    func navItemNone() {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    // Search Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            tableView.reloadData()
            searchBar.setShowsCancelButton(false, animated: true)
            self.title = "\(titles.count) Definitions"
            navItemDeselected()
        } else {
            isSearching = true
            searchResults = (titles.filter { $0.lowercased().contains(searchText.lowercased()) })
            tableView.reloadData()
            searchBar.setShowsCancelButton(true, animated: true)
            self.title = "\(searchResults.count) Definitions"
            navItemNone()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        isSearching = false
        isShowingFavs = false
        tableView.reloadData()
        searchBar.endEditing(true)
        self.title = "\(titles.count) Definitions"
        navItemDeselected()
    }
    
    
    @objc func showFavourites(sender: UIBarButtonItem) {
        if isShowingFavs == true{
            isShowingFavs = false
            navItemDeselected()
            tableView.reloadData()
            self.title = "\(titles.count) Definitions"
        } else {
            isShowingFavs = true
            navItemSelected()
            tableView.reloadData()
            self.title = "\(UDSaved().count) Definitions"
        }
        isSearching = false
        tableView.setContentOffset(.zero, animated: false)
    }
    
    
    
    //Table Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        searchBar.endEditing(true)
        
        if isSearching == true || isShowingFavs == true{
            
            // code to run if searching is true
            let selectedCell = tableView.cellForRow(at: indexPath)?.textLabel!.text ?? "Undefined"
            arrayIndex = titles.index(of: selectedCell)!
            
        isSearching = false
        tableView.reloadData()
        searchBar.text = ""
            
        } else {
            arrayIndex = indexPath.row // assigns the value of the selected tow to arrayIndex
        }
        
        performSegue(withIdentifier: "segue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true {
            return searchResults.count
        } else if isShowingFavs == true {
            return UDSaved().count
        } else {
            return titles.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // Cell Data Source
        let cell = UITableViewCell()
        
        if isSearching == true {
            cell.textLabel?.text = searchResults[indexPath.row]
        } else if isShowingFavs == true {
            cell.textLabel?.text = UDSaved()[indexPath.row]
        } else {
            cell.textLabel?.text = titles[indexPath.row]
        }
        
        // Cell Visual Formatting
        cell.backgroundColor = UIColor(red:0.05, green:0.05, blue:0.07, alpha:0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Raleway", size: 18)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let cellBGView = UIView()
        cellBGView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.2)
        cell.selectedBackgroundView = cellBGView
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isSearching == true {
            self.title = "\(searchResults.count) Definitions"
        } else if isShowingFavs == true {
            self.title = "\(favouritesArray.count) Definitions"
        } else {
            self.title = "\(titles.count) Definitions"
        }
        
        // TextField Color Customization
        let searchBarStyle = searchBar.value(forKey: "searchField") as? UITextField
        searchBarStyle?.textColor = UIColor.white
        searchBarStyle?.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.05)
        searchBarStyle?.clearButtonMode = .never
        
        // Makes sure the Navigation Bar is shown.
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Sets the text of the Navigation Bar Back Button
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        // Adds the Favourites Button
        navItemDeselected()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isSearching = false
        isShowingFavs = false
        tableView.reloadData()
        self.title = "\(titles.count) Definitions"
        navItemDeselected()
    }
    
}
