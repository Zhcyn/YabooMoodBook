//
//  DefinitionController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 05/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

func UDWrite() {
    UserDefaults.standard.set(favouritesArray, forKey: "UDfavouritesArray")
}
func UDSaved() -> [String] {
    return UserDefaults.standard.stringArray(forKey: "UDfavouritesArray") ?? [String]()
}


class DefinitionController: UIViewController {

    @IBOutlet var definitionTitle: UILabel!
    @IBOutlet var definitionBody: UILabel!
    @IBOutlet var definitionSources: UILabel!
    
    // Open link in Safari
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        if let url = URL(string: "\(links[arrayIndex])") {
            UIApplication.shared.openURL(url)
        }
    }
    
    func navItemSelected(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "selected-fav"), style: .plain, target: self, action: #selector(toggleFavourite(sender:)))
    }
    
    func navItemDeselected(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "fav"), style: .plain, target: self, action: #selector(toggleFavourite(sender:)))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        definitionTitle.text = titles[arrayIndex]
        definitionTitle.adjustsFontSizeToFitWidth = true
        definitionBody.text = definitions[arrayIndex]

        
        self.title = ""
        
        // Sources Link
        let tap = UITapGestureRecognizer(target: self, action: #selector(DefinitionController.tapFunction))
        definitionSources.addGestureRecognizer(tap)
        
        // Makes sure the Navigation Bar is shown.
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        favouritesArray = UDSaved()
        
        // Shows the favourites button
        if UDSaved().contains("\(titles[arrayIndex])") {
            navItemSelected()
        } else {
            navItemDeselected()
        }
        
    }
    
    
    @objc func toggleFavourite(sender: UIBarButtonItem) {
        
        if UDSaved().contains("\(titles[arrayIndex])") {
            
            if let indexOfItem = favouritesArray.index(of: "\(titles[arrayIndex])") {
                favouritesArray.remove(at: indexOfItem)
                navItemDeselected()
            }
            
        } else {
            favouritesArray.append("\(titles[arrayIndex])")
            navItemSelected()
        }
        
        UDWrite()
    }

}
