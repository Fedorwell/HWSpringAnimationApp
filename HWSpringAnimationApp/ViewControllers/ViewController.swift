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
        runButton.setTitle("RUN", for: .normal)
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
        
        infoLabel.animation = ""
        infoLabel.animate()
    }
    
    private func setupView(from animation: Animation) {
        infoLabel.text = String(
            format:" Present Animation: \(presentAnimation.name)\n Curve: %@\n Force: %.1f\n Duration: %.1f\n Delay: %.1f",
            presentAnimation.curve,
            presentAnimation.force,
            presentAnimation.duration,
            presentAnimation.delay
        )
        
        
        runButton.setTitle("Run \(presentAnimation.name)", for: .normal)
        
        
    }
    
}


