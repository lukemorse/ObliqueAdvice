//
//  ViewController.swift
//  Oblique Advice
//
//  Created by Luke Morse on 3/13/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    var hasNotificationScheduled: Bool?
    var ref: FIRDatabaseReference!

    @IBOutlet var freqLabel: UILabel!
    @IBOutlet var currentAdviceLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ref = FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerLocal()
        scheduleLocal()
        print("HERE IS THE VIEW CONTROLLER !!!!!!!!!!!!!!!!!")
    }

    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("auth succeeded")
            } else {
                print("auth failed")
                print(error.debugDescription)
            }
        }
    }
    
    func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.body = "What would your closest friend do?"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
        
    }
    
    func getNextAlertString() {
        
        
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let idx = Int(sender.value * Float(freqIntervals.count - 1))
        freqLabel.text = freqIntervals[idx]
    }
    
}

