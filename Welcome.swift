//
//  Welcome-01.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 03/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

var hasSeenWelcome = false

class WelcomeVC: UIViewController {
    
    @IBAction func finishedWelcome(_ sender: Any) {
        
            hasSeenWelcome = true
            UserDefaults.standard.set(hasSeenWelcome, forKey: "UDhasSeenWelcome")
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
}
