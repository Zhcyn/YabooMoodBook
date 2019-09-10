//
//  ViewController.swift
//  EQ Playbook
//
//  Created by Yaboo Liang on 30/05/2018.
//  Copyright © 2018 Yaboo Liang. All rights reserved.
//

import UIKit

var emotionOfTheDay = 23 // change back to 23

class ViewController: UIViewController {
    
    @IBOutlet var homeTitleLabel: UILabel!
    @IBOutlet var homeDefinitionLabel: UILabel!
    @IBOutlet var EmotionOfTheDayOutlet: UILabel!
    
    @IBAction func openEmotionOfTheDayTouchDown(_ sender: Any) {
        homeTitleLabel.alpha = 0.3
        homeDefinitionLabel.alpha = 0.3
        EmotionOfTheDayOutlet.alpha = 0.3
    }
    @IBAction func openEmotionOfTheDay(_ sender: Any) {
        arrayIndex = emotionOfTheDay
        homeTitleLabel.alpha = 1
        homeDefinitionLabel.alpha = 1
        EmotionOfTheDayOutlet.alpha = 1
    }
    
    @IBAction func openEmotionOfTheDayDragOutside(_ sender: Any) {
        homeTitleLabel.alpha = 1
        homeDefinitionLabel.alpha = 1
        EmotionOfTheDayOutlet.alpha = 1
    }
    
    
    // How Emotions Work Button
    @IBOutlet var emotionsButtonOutlet: UIButton!
    
    @IBAction func emotionsButtonTouchDown(_ sender: Any) {
        emotionsButtonOutlet.alpha = 0.7
    }
    @IBAction func emotionsButtonTouchUpInside(_ sender: Any) {
        emotionsButtonOutlet.alpha = 1
    }
    
    // Definitions Button
    @IBOutlet var definitionsButtonOutlet: UIButton!

    @IBAction func definitionsButtonTouchDown(_ sender: Any) {
        definitionsButtonOutlet.alpha = 0.7
    }
    
    @IBAction func definitionsButtonTouchUpInside(_ sender: Any) {
        definitionsButtonOutlet.alpha = 1
    }
    
    // Emotion of the Day Function
    func refreshEmotionOfTheDay() {
        
        let today = Calendar.current.component(.day, from: Date())
        
        if UserDefaults.standard.string(forKey: "UDdayLastLaunched") == "\(today)" {
            print("It's the same day")
        } else {
            UserDefaults.standard.set(today, forKey: "UDdayLastLaunched")
            var randomNumber = arc4random_uniform(UInt32(titles.count))
            
            if randomNumber == UserDefaults.standard.integer(forKey: "UDpreviousNumber"){
                randomNumber = arc4random_uniform(UInt32(titles.count))
                UserDefaults.standard.set(randomNumber, forKey: "UDpreviousNumber")
                print("randomNumber number was the same so it was changed to \(randomNumber)")
            }
            
            emotionOfTheDay = Int(randomNumber)
            homeTitleLabel.text = titles[emotionOfTheDay]
            homeDefinitionLabel.text = definitions[emotionOfTheDay]
            
            print("Emotion of the day changed to no. \(emotionOfTheDay)")
        }
        
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleWillEnterForeground), name: .UIApplicationWillEnterForeground, object: nil)
        super.viewDidLoad()
        
        homeTitleLabel.text = titles[emotionOfTheDay]
        homeDefinitionLabel.text = definitions[emotionOfTheDay]
        
        homeTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .UIApplicationWillEnterForeground, object: nil)
    }
    
    @objc fileprivate func handleWillEnterForeground() {
        refreshEmotionOfTheDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        refreshEmotionOfTheDay()
    }
    
    
}
