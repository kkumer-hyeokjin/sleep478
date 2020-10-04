//
//  ViewController.swift
//  sleep478
//
//  Created by 박혁진 on 2020/07/11.
//  Copyright © 2020 kkumercompany. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var yellowImage: UIImageView!
    @IBOutlet weak var blueImage: UIImageView!
    @IBOutlet weak var remainTime: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    var loopTimer = Timer()
    var firstTimer = Timer()
    var secondTimer = Timer()
    var thirdTimer = Timer()
    var remainTimer = Timer()
    var count1: Int = 1
    var count2: Int = 1
    var count3: Int = 8000
    var remainTimeSecond: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        endButton.isEnabled = false
        endButton.isHidden = true
        
    }
    @IBAction func touchTestButton(_ sender: Any) {
        
    }
    
    @IBAction func touchStartButton(_ sender: Any) {
        endButton.isEnabled = true
        endButton.isHidden = false
        startButton.isEnabled = false
        startButton.isHidden = true
        yellowImage.alpha = 1
        remainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(remainTimerAction), userInfo:  nil, repeats: true)
        loopTimerAction()
        loopTimer = Timer.scheduledTimer(timeInterval: 19, target: self, selector: #selector(loopTimerAction), userInfo:  nil, repeats: true)
        
        print(loopTimer.isValid)
    }
    
    @IBAction func touchEndButton(_ sender: Any) {
        startButton.isEnabled = true
        startButton.isHidden = false
        endButton.isEnabled = false
        endButton.isHidden = true
        loopTimer.invalidate()
        remainTimer.invalidate()
        firstTimer.invalidate()
        secondTimer.invalidate()
        thirdTimer.invalidate()
        yellowImage.alpha = 0
        
        print(loopTimer.isValid)
    }
    
    @objc func remainTimerAction() {
        remainTimeSecond+=1
        print(remainTimeSecond)
    }
    
    @objc func loopTimerAction() {
        remainTimeSecond = 0
        
        firstTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(firstTimerAction), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            if self.loopTimer.isValid {
                self.secondTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.secondTimerAction), userInfo: nil, repeats: true)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.0) {
            if self.loopTimer.isValid {
                self.thirdTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.thirdTimerAction), userInfo: nil, repeats: true)
            }
        }
    }
    
    @objc func firstTimerAction() {
//        print("first\(count1)")
        if count1%1000==999 {
            print("first - ",count1/1000+1)
        }
        
        moveImage(value: 0.03125*Double(count1))
        
        switch count1 {
        case 1...1000:
            if count1%250==0 {
                AudioServicesPlaySystemSound(1519)
            }
        case 1001...2000:
            if count1%200==0 {
                AudioServicesPlaySystemSound(1519)
            }
        case 2001...3000:
            if count1%125==0 {
                AudioServicesPlaySystemSound(1519)
            }
        case 3001...4000:
            if count1%100==0 {
                AudioServicesPlaySystemSound(1519)
            }
        default:
            break
        }
        
        if count1==4000 {
            firstTimer.invalidate()
            print("first - end")
            count1 = 1
        }
        
        count1+=1
    }
    
    @objc func secondTimerAction() {
//        print("second\(count2)")
        if count2%2==0 {
            print("second - ",count2/2)
        } else {
            print("blink")
        }
        
        if count2%2==1 {
            yellowImage.alpha = 0.5
            AudioServicesPlaySystemSound(1519)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                self.yellowImage.alpha = 1
//                AudioServicesPlaySystemSound(1519)
//            }
        }
        
        if count2==14 {
            secondTimer.invalidate()
            print("second - end")
            count2 = 1
        }
        
        count2+=1
    }
    
    @objc func thirdTimerAction() {
//        print("third\(count3)")
        if count3%1000==1 {
            print("third - ",count3/1000+1)
        }
        
        moveImage(value: 0.015625*Double(count3))
        
        if count3==1 {
            thirdTimer.invalidate()
            print("third - end")
            count3 = 8000
        }

        count3-=1
    }
    
    func moveImage(value: Double) {
        blueImage.transform = CGAffineTransform(translationX: CGFloat(value), y: -CGFloat(value))
    }

}

