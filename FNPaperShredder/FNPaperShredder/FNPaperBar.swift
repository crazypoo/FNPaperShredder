//
//  FNPaperBar.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNPaperBar: UIView {
    @objc var maskLayer:CAShapeLayer!
    @objc var displaylink:CADisplayLink?
    var beginTime:CFTimeInterval?
    var startHeight0:CGFloat!
    var endHeight0:CGFloat!
    var finalHeight0:CGFloat!
    var horizontalDistant00:CGFloat!
    var horizontalDistant01:CGFloat!
    var horizontalDistant02:CGFloat!
    var startHeight1:CGFloat!
    var endHeight1:CGFloat!
    var finalHeight1:CGFloat!
    var horizontalDistant10:CGFloat!
    var horizontalDistant11:CGFloat!
    var horizontalDistant12:CGFloat!
    
    @objc var isResetting = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //宽度暂定16
        startHeight0 = CGFloat(arc4random_uniform(50))/100.0 * frame.height
        endHeight0 = (CGFloat(arc4random_uniform(50))/100.0 + 0.5) * frame.height
        finalHeight0 = CGFloat(arc4random_uniform(50))/100.0 * (frame.height - endHeight0) + endHeight0
        horizontalDistant00 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        horizontalDistant01 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        horizontalDistant02 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        
        let bezierPath = UIBezierPath.init();
        bezierPath.move(to: CGPoint.init(x: 4, y: 0))
        bezierPath.addCurve(to: CGPoint.init(x: 4 + horizontalDistant02, y: finalHeight0), controlPoint1: CGPoint.init(x: 4 + horizontalDistant00, y: startHeight0), controlPoint2: CGPoint.init(x: 4 + horizontalDistant01, y: endHeight0))
        bezierPath.addLine(to: CGPoint.init(x: 12 + horizontalDistant02, y: finalHeight0))
        bezierPath.addCurve(to: CGPoint.init(x: 12, y: 0), controlPoint1: CGPoint.init(x: 12 + horizontalDistant01, y: endHeight0), controlPoint2: CGPoint.init(x: 12 + horizontalDistant00, y: startHeight0))

        bezierPath.close()
        maskLayer = CAShapeLayer.init()
        maskLayer.path = bezierPath.cgPath
        self.layer.mask = maskLayer
        
        startHeight1 = CGFloat(arc4random_uniform(50))/100.0 * frame.height
        endHeight1 = (CGFloat(arc4random_uniform(50))/100.0 + 0.5) * frame.height
        finalHeight1 = CGFloat(arc4random_uniform(50))/100.0 * (frame.height - endHeight1) + endHeight1
        horizontalDistant10 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        horizontalDistant11 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        horizontalDistant12 = (CGFloat(arc4random_uniform(100))/100.0 * 2 - 1) * 5
        
        initDisplayLink()
    }
    
    @objc func initDisplayLink() {
        displaylink = CADisplayLink.init(target: self, selector: #selector(updateView))
        displaylink?.isPaused = false
        displaylink?.add(to: RunLoop.current, forMode: .commonModes)
    }
    
    @objc func start() {
        isResetting = false
        beginTime = CACurrentMediaTime()
        displaylink?.isPaused = false
    }
    
    @objc func reset() {
        isResetting = true
        beginTime = CACurrentMediaTime()
        displaylink?.isPaused = false
    }
    
    @objc func updateView() {
        if beginTime == nil {
            return
        }
        if CACurrentMediaTime() - beginTime! < 2 && CACurrentMediaTime() - beginTime! > 0 {
            var progress = (CACurrentMediaTime() - beginTime!)/2.0
            if isResetting {
                progress = 1 - progress
            }
            
            let startHeight = startHeight0 + (startHeight1 - startHeight0) * CGFloat(progress)
            let endHeight = endHeight0 + (endHeight1 - endHeight0) * CGFloat(progress)
            let horizontalDistant0 = horizontalDistant00 + (horizontalDistant10 - horizontalDistant00) * CGFloat(progress)
            let horizontalDistant1 = horizontalDistant01 + (horizontalDistant11 - horizontalDistant01) * CGFloat(progress)
            let horizontalDistant2 = horizontalDistant02 + (horizontalDistant12 - horizontalDistant02) * CGFloat(progress)
            let finalHeight = finalHeight0 + (finalHeight1 - finalHeight0) * CGFloat(progress)
            
            let bezierPath = UIBezierPath.init();
            bezierPath.move(to: CGPoint.init(x: 4, y: 0))
            bezierPath.addCurve(to: CGPoint.init(x: 4 + horizontalDistant2, y: finalHeight), controlPoint1: CGPoint.init(x: 4 + horizontalDistant0, y: startHeight), controlPoint2: CGPoint.init(x: 4 + horizontalDistant1, y: endHeight))
            bezierPath.addLine(to: CGPoint.init(x: 12 + horizontalDistant2, y: finalHeight))
            bezierPath.addCurve(to: CGPoint.init(x: 12, y: 0), controlPoint1: CGPoint.init(x: 12 + horizontalDistant1, y: endHeight), controlPoint2: CGPoint.init(x: 12 + horizontalDistant0, y: startHeight))
            bezierPath.close()
            maskLayer = CAShapeLayer.init()
            maskLayer.path = bezierPath.cgPath
            self.layer.mask = maskLayer
        }
        else if CACurrentMediaTime() - beginTime! > 2 {
            displaylink?.isPaused = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
