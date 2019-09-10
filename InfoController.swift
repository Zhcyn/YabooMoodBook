//
//  InfoController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 08/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

class InfoController: UIViewController {

    @objc func openNotes(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let notesVC = storyboard.instantiateViewController(withIdentifier: "NotesVC")
        navigationController?.pushViewController(notesVC, animated: true)

    }
    
    // Send Email
    @IBAction func contactEmail(_ sender: Any) {
        let email = "BehruzPrinn1998@bk.ru"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.openURL(url)
        }
    }
    
    // Show Welcome Screens Again
    @IBAction func showWelcomeAgain(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcome = storyboard.instantiateViewController(withIdentifier: "WelcomeVC")
        present(welcome, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "More Info"
        
        // Makes sure the Navigation Bar is shown.
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "notes"), style: .plain, target: self, action: #selector(openNotes(sender:)))
    }
    
}
