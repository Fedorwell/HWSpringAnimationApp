//
//  ViewController.swift
//  HWSpringAnimationApp
//
//  Created by mac on 14.06.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var infoLabel: SpringLabel!
    @IBOutlet var runButton: UIButton!
    
    let animation = Animation.getSpringAnimations()
    var presentAnimation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentAnimation = animation.randomElement()
        setupView(from: presentAnimation)
    }
    
    @IBAction func startAnimationButton(_ sender: UIButton) {
        setupView(from: presentAnimation)
        animationView.animation = presentAnimation.name
        animationView.curve = presentAnimation.curve
        animationView.delay = presentAnimation.delay
        animationView.force = presentAnimation.force
        animationView.duration = presentAnimation.duration
        animationView.animate()
        
        presentAnimation = animation.randomElement()
        sender.setTitle("Run \(presentAnimation.name)", for: .normal)
        
        infoLabel.animation = "pop"
        infoLabel.animate()
    }
    
    private func setupView(from animation: Animation) {
        infoLabel.text = String(
            format:"""
            Present Animation: \(presentAnimation.name)
            Curve: %@
            Force: %.1f
            Duration: %.1f
            Delay: %.1f
            """,
            animation.force,
            animation.duration,
            animation.delay
        )
        
        
        runButton.setTitle("Run \(presentAnimation.name)", for: .normal)
        
        
    }
    
}


