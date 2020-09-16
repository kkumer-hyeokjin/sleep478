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
    var count: Double = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func touchStartButton(_ sender: Any) {
        loopTimer = Timer.scheduledTimer(timeInterval: 19, target: self, selector: #selector(loopTimerAction), userInfo:  nil, repeats: true)
    }
    
    
    @objc func loopTimerAction() {
        firstTimer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(firstTimerAction), userInfo: nil, repeats: true)
    }
    
    @objc func firstTimerAction() {
        if count==140 {
            firstTimer.invalidate()
        }
    }
    
    func moveImage(value: Double) {
        blueImage.transform = CGAffineTransform(translationX: CGFloat(value), y: -CGFloat(value))
        count+=0.1
    }

}

