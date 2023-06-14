//
//  Animation.swift
//  HWSpringAnimationApp
//
//  Created by mac on 14.06.2023.
//

import Foundation

struct Animation {
    
    let name: String
    let curve: String
    let duration: Double
    let force: Double
    let delay: Double
    
    private func getSpringAnimations() -> [Animation] {
        var nameAnimations: [Animation] = []
        
        let springAnimations = DataStore.shared.springAnimations.shuffled()
        let nameOfCurve = DataStore.shared.springCurves.shuffled()
        
        for springAnimation in springAnimations {
            let animation = springAnimation
            let curve = nameOfCurve.randomElement() ?? ""
            let duration = Double.random(in: 0.1...2)
            let force = Double.random(in: 0.1...2)
            let delay = Double.random(in: 0...1)
            
            let springInfo = Animation(
                name: animation,
                curve: curve,
                duration: duration,
                force: force,
                delay: delay
            )
             
            nameAnimations.append(springInfo)
        }
        
        return nameAnimations
    }
}



