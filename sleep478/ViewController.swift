//
//  ViewController.swift
//  sleep478
//
//  Created by 박혁진 on 2020/07/11.
//  Copyright © 2020 kkumercompany. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var yellowImage: UIImageView!
    @IBOutlet weak var blueImage: UIImageView!
    
    var loopTimer = Timer()
    var firstTimer = Timer()
    var secondTimer = Timer()
    var thirdTimer = Timer()
    var count1: Double = 1
    var count2: Double = 1
    var count3: Double = 8000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        blueImage.isHidden = true
        
    
    }
    
    @IBAction func touchStartButton(_ sender: Any) {
        firstTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(firstTimerAction), userInfo: nil, repeats: true)
        count1 = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.secondTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.secondTimerAction), userInfo: nil, repeats: true)
            self.count2 = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.0) {
            self.thirdTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.thirdTimerAction), userInfo: nil, repeats: true)
            self.count3 = 8000
        }
//        loopTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loopTimerAction), userInfo:  nil, repeats: true)
        
    }
    
    
    @objc func loopTimerAction() {
        
//        firstTimer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(firstTimerAction), userInfo: nil, repeats: true)
    }
    
    @objc func firstTimerAction() {
        print("first\(count1)")
        moveImage1(value: 0.03125*count1)
        if count1==4000 {
            firstTimer.invalidate()
        }
        count1+=1
    }
    
    @objc func secondTimerAction() {
        print("second\(count2)")
        yellowImage.isHidden = !yellowImage.isHidden
        if count2==14 {
            secondTimer.invalidate()
        }
        count2+=1
    }
    
    @objc func thirdTimerAction() {
        print("third\(count3)")
        moveImage3(value: 0.015625*count3)
        if count3==1 {
            thirdTimer.invalidate()
        }
        count3-=1
    }
    
    func moveImage1(value: Double) {
        blueImage.transform = CGAffineTransform(translationX: CGFloat(value), y: -CGFloat(value))
    }
    
    func moveImage3(value: Double) {
        blueImage.transform = CGAffineTransform(translationX: CGFloat(value), y: -CGFloat(value))
    }

}

