//
//  VisualiseController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 23/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

class VisualiseController: UIViewController {

    @IBOutlet var ImageOutlet: UIImageView!
    @IBOutlet var TitleOutlet: UILabel!
    @IBOutlet var DescriptionOutlet: UILabel!
    @IBOutlet var SegmentedControllerOutlet: UISegmentedControl!
    
    @IBAction func ReturnButtonOutlet(_ sender: Any) {
    }
    
    @IBAction func SegmentedControllerAction(_ sender: Any) {
        if SegmentedControllerOutlet.selectedSegmentIndex == 0{
            TitleOutlet.text = "The Cortex"
            DescriptionOutlet.text = "Responsible for higher functions such as reasoning and planning. It is the most accurate and slowest way to process  information. It is the outer layer of the brain and the last to develop on the evolutionary timeline."
            ImageOutlet.image = UIImage(named: "brain-cortex")
        } else if SegmentedControllerOutlet.selectedSegmentIndex == 1{
            TitleOutlet.text = "The Limbic System"
            DescriptionOutlet.text = "Responsible for creating memories, and emotional processing. It is much faster than the cortex, but also much less complex and reliable. It enables us to process vast amounts of information without rationally analysing all of it."
            ImageOutlet.image = UIImage(named: "brain-limbic")
        } else {
            TitleOutlet.text = "The Brainstem"
            DescriptionOutlet.text = "Deals with the minute, low level aspects of our body’s functioning, such as regulating heart rate and breathing, adjusting sleep cycles, regulating the nervous system, etc. It is one of the oldest parts of the brain."
            ImageOutlet.image = UIImage(named: "brain-stem")
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Brain Visualisation"
        
//        TitleOutlet.adjustsFontSizeToFitWidth = true
//        DescriptionOutlet.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }
    
}
