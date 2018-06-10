//
//  FNGrayPart.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNGrayPart: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bezierPath = UIBezierPath.init();
        bezierPath.move(to: CGPoint.init(x: frame.width / 2, y: 0))
        bezierPath.addLine(to: CGPoint.init(x: 2, y: 0))
        bezierPath.addQuadCurve(to: CGPoint.init(x: 0, y: 2), controlPoint: CGPoint.init(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint.init(x: 2, y: frame.height * 0.7))
        bezierPath.addQuadCurve(to: CGPoint.init(x: 6, y: frame.height), controlPoint: CGPoint.init(x: 2, y: frame.height))
        bezierPath.addLine(to: CGPoint.init(x: frame.width - 6, y: frame.height))
        bezierPath.addQuadCurve(to: CGPoint.init(x: frame.width, y: frame.height * 0.7), controlPoint: CGPoint.init(x: frame.width - 2, y: frame.height))
        bezierPath.addLine(to: CGPoint.init(x: frame.width, y: 2))
        bezierPath.addQuadCurve(to: CGPoint.init(x: frame.width - 2, y: 0), controlPoint: CGPoint.init(x: frame.width, y: 0))
        bezierPath.close()
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = bezierPath.cgPath
        self.layer.mask = maskLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
