//
//  ViewController.swift
//  Oblique Advice
//
//  Created by Luke Morse on 3/13/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("auth succeeded")
            } else {
                print("auth failed")
            }
        }
    }
    
    func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.body = "What would your closest friend do?"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
        
    }

    @IBAction func regLocalButtonPressed(_ sender: Any) {
        registerLocal()
    }
    
    @IBAction func schedLocalButtonPressed(_ sender: Any) {
        scheduleLocal()
    }

}

