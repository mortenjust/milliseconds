//
//  ViewController.swift
//  Milliseconds
//
//  Created by Morten Just Petersen on 11/10/14.
//  Copyright (c) 2014 Morten Just Petersen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var startTime = NSDate().timeIntervalSince1970
    var timer = NSTimer()
    var whichCurve : String = ""

    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!

    var moveBy : CGFloat = 50
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("view did load")
        timerButton.layer.cornerRadius = 15
        timerButton.layer.masksToBounds = true
        
        // prepare for greeting animations

        timerButton.alpha = 0
        timerLabel.alpha = 0
        // timerlabel greeting animation
        UIView.animateWithDuration(0.9, delay:0, options: (.CurveEaseInOut | .AllowUserInteraction), animations: {

            self.timerButton.alpha = 1
            self.timerLabel.alpha = 1

    
            }, completion: { finished in
            }
        )
        // button greeting animation
        UIView.animateWithDuration(0.9, delay:0.15, options: (.CurveEaseInOut | .AllowUserInteraction), animations: {
            }, completion: { finished in
            }
        )
        
                    NSLog("y end of viewdidload: \(timerLabel.frame.origin.y)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    @IBAction func startTimer(sender: AnyObject) {


        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            // do stuff
        }), completion: nil)
        
        UIView.animateWithDuration(0.3,
            delay: 0.0,
            usingSpringWithDamping: 1.7,
            initialSpringVelocity: 1.7,
            options: nil,
            animations: {
                
            self.timerLabel.alpha = 0.5
            self.timerLabel.textColor = UIColor(red:0.239, green:0.724, blue:0.89, alpha:1)
                
            self.timerLabel.frame.origin.y -= self.moveBy
                    }, completion: { finished in
        }) // anim
        
        startTime = NSDate().timeIntervalSince1970
        timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update() {
        var thisSec = NSDate().timeIntervalSince1970 - startTime;
         timerLabel.text = "\(Int(thisSec*1000))"
    }
    
    @IBAction func stopCounter() {
        // destroy the timer
        timer.invalidate()
 
        UIView.animateWithDuration(
            0.3,
            delay: 0.0,
            options: .CurveEaseIn,
            animations: {

                self.timerLabel.alpha = 1
                self.timerLabel.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
                self.timerLabel.frame.origin.y += self.moveBy


            }, completion: { finished in

        })
    }

}

