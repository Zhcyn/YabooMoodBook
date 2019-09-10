//
//  NotesController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 24/06/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

class NotesController: UIViewController, UITextViewDelegate {

    
    @IBOutlet var InputFieldOutlet: UITextView!
    
    @IBOutlet var SaveNotesOutlet: UIButton!
    
    @IBAction func SaveNotesAction(_ sender: Any) {
        let savedNote = InputFieldOutlet.text
        UserDefaults.standard.set(savedNote, forKey: "UDsavedNote")
        SaveNotesOutlet.alpha = 0.5
        SaveNotesOutlet.isUserInteractionEnabled = false
        SaveNotesOutlet.setTitle("Saved!", for: UIControlState.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputFieldOutlet.text = UserDefaults.standard.string(forKey: "UDsavedNote")
        
        // Formatting
        InputFieldOutlet.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.05)
        InputFieldOutlet.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        InputFieldOutlet.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        InputFieldOutlet.layer.borderWidth = 1.0
        InputFieldOutlet.layer.cornerRadius = 6.0;
        InputFieldOutlet.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.2).cgColor
        InputFieldOutlet.keyboardAppearance = .dark
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if InputFieldOutlet.text == UserDefaults.standard.string(forKey: "UDsavedNote") {
            SaveNotesOutlet.alpha = 0.5
            SaveNotesOutlet.isUserInteractionEnabled = false
        } else {
            SaveNotesOutlet.alpha = 1
            SaveNotesOutlet.isUserInteractionEnabled = true
        }

    }
    
    func textViewDidChange(_ textView: UITextView) {
        SaveNotesOutlet.alpha = 1
        SaveNotesOutlet.isUserInteractionEnabled = true
        SaveNotesOutlet.setTitle("Save Notes", for: UIControlState.normal)
    }
    
    // Dismisses the keyboard when Done is pressed.
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
