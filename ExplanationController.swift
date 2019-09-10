//
//  ExplanationController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 08/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

class ExplanationController: UIViewController {

    @objc func visualise(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let visualiseVC = storyboard.instantiateViewController(withIdentifier: "VisualiseVC")
        navigationController?.pushViewController(visualiseVC, animated: true)
    }
    
    @IBAction func link01(_ sender: Any) {
        if let url = URL(string: "http://serendipstudio.org/bb/kinser/Structure1.html") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func link02(_ sender: Any) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Brain") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func link03(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=gAMbkJk6gnE") {
            UIApplication.shared.openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes sure the Navigation Bar is shown.
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Adds a Visualise Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "visualise"), style: .plain, target: self, action: #selector(visualise(sender:)))
    }

}
