//
//  CAAnimation+Ext.swift
//  AnniCount-
//
//  Created by HHumorous on 14/10/2020.
//

import UIKit

extension CAAnimation {
     func bounceAnimation() -> CAKeyframeAnimation {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }
}
