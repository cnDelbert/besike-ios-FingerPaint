//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Delbert on 14/11/6.
//  Copyright (c) 2014年 Delbert. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    let zigzag = [(100, 100),
    (100, 150), (150, 150),
    (150, 200)]

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        for i in 0..<3 {
            var cur_x = zigzag[i].0
            var cur_y = zigzag[i].1
            var next_x = zigzag[i+1].0
            var next_y = zigzag[i+1].1
            CGContextMoveToPoint(context, CGFloat(cur_x), CGFloat(cur_y))
            CGContextAddLineToPoint(context, CGFloat(next_x), CGFloat(next_y))
            CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
            CGContextStrokePath(context)
        }

    }

}
