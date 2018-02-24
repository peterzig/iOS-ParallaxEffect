//
//  ViewController.swift
//  ParallaxEffect
//
//  Created by Peter Zaporowski on 24.02.2018.
//  Copyright © 2018 Peter Zaporowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyEffect(onView: bgImg, magnitude: 15)
        applyEffect(onView: logoImg, magnitude: -10)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func applyEffect(onView: UIView, magnitude: Double){
        // X Axis
        let xAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xAxisEffect.minimumRelativeValue = -magnitude
        xAxisEffect.maximumRelativeValue = magnitude
        
        // Y Axis
        let yAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yAxisEffect.minimumRelativeValue = -magnitude
        yAxisEffect.maximumRelativeValue = magnitude
        
        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [xAxisEffect, yAxisEffect]
        
        onView.addMotionEffect(effectGroup)
    }

}

