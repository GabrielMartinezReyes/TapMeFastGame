//
//  ViewController.swift
//  Tap Me Fast
//
//  Created by Gabriel Martinez on 2017-11-15.
//  Copyright © 2017 Gabriel Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    var timer = Timer()
    var timeInt = 10
    var scoreInt = 0
    var gameInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGameButton(_ sender: Any) {
        
        if timeInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
           
            startBtn.isEnabled = false
            startBtn.alpha = 0.5
        
        
        }
        if gameInt == 1 {
            scoreInt += 1
            scoreLabel.text = String(scoreInt)
        }else{
            
            timeInt = 10
            scoreInt = 0
            timeLabel.text = String(timeInt)
            scoreLabel.text = String(scoreInt)
            startBtn.setTitle("START", for: UIControlState.normal)
        }
        
        
    } 
    
    @objc func startCounter(){
        
        timeInt -= 1
        timeLabel.text = String(timeInt)
        
        gameInt = 1
        startBtn.isEnabled = true
        startBtn.alpha = 1
        
        startBtn.setTitle("TAP", for: UIControlState.normal)
        
        if timeInt == 0{
            timer.invalidate()
            startBtn.isEnabled = false
            startBtn.alpha = 0.5
            
            Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            
            startBtn.setTitle("RESTART", for: UIControlState.normal)
        }
    }
    
    @objc func restart(){
        gameInt = 0
        startBtn.isEnabled = true
        startBtn.alpha = 1
        
    }
}










