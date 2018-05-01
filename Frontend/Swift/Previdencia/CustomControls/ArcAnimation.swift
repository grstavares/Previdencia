//
//  CircleView.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class ArcAnimation: UIView {

    var circleLayer: CAShapeLayer!
    var color: UIColor = UIColor.darkGray
    
    convenience init(with: UIColor, frame: CGRect) {
        self.init(frame: frame)
        self.color = with
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0.0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        self.circleLayer = CAShapeLayer()
        self.circleLayer.path = circlePath.cgPath
        self.circleLayer.fillColor = UIColor.clear.cgColor
        self.circleLayer.strokeColor = self.color.cgColor
        self.circleLayer.lineWidth = 15.0;
        
        // Don't draw the circle initially
        self.circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateCircle(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0.5
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        self.circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        self.circleLayer.add(animation, forKey: "animateCircle")
    }
    
}
