//
//  UIView+Extension.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 01/07/2021.
//

import Foundation
import UIKit
import Lottie

public extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(radius) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
    }
}

extension UIView {
    func showAnimation(aimationName: String, animationShouldLoop: Bool = true, animationSpeed:CGFloat = 2 ) {
        let starAnimationView = AnimationView(name: aimationName)
        starAnimationView.frame = bounds
        addSubview(starAnimationView)
        starAnimationView.contentMode = .scaleAspectFill
        starAnimationView.loopMode = animationShouldLoop ? .loop : .playOnce
        starAnimationView.animationSpeed = animationSpeed
        starAnimationView.play()
    }
}
