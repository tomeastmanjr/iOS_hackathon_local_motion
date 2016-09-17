//
//  ViewController.swift
//  testProjectSwitft3wCoreData
//
//  Created by Tom Eastman on 9/16/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var start = NSDate()
    
    
    @IBOutlet weak var displayShakeInfoLabel: UILabel!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        timerDisplayLabel.text = String(SwiftCounter)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        start = NSDate()
        count += 1
        print("Device was shaken!")
        displayShakeInfoLabel.text = "Device has been shaken \(count) times"
        
        shakeStartLabel.text = "shake started at \(start)"
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Stopped")
        if count >= 5{
            timerDisplayLabel.text = "you shook at least 5 times"
        }else{
            timerDisplayLabel.text = "Keep shaking!!!!"
        }
    }
    
    
    // timer stuff
    @IBOutlet weak var timerDisplayLabel: UILabel!
    @IBOutlet weak var shakeStartLabel: UILabel!
    @IBOutlet weak var shakeEndLabel: UILabel!
    @IBOutlet weak var timeIntervalLabel: UILabel!

    
    var SwiftTimer = Timer()
    var SwiftCounter = 0.00

    
    
    
    
    
}

