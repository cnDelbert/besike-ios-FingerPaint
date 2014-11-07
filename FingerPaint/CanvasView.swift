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
    
    var paths: [Path] = []
    var path: Path?
    var isDrawing: Bool = true
    var selectedButtonTag = -1
    
    var currentColor :CGColor = UIColor.blackColor().CGColor {
        didSet{
            setNeedsDisplay()
//            println("Set")
        }
    }

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
        
//        CGContextBeginPath(context)
//        for i in 0..<3 {
//            var cur_x = zigzag[i].0
//            var cur_y = zigzag[i].1
//            var next_x = zigzag[i+1].0
//            var next_y = zigzag[i+1].1
//            CGContextMoveToPoint(context, CGFloat(cur_x), CGFloat(cur_y))
//            CGContextAddLineToPoint(context, CGFloat(next_x), CGFloat(next_y))
//            CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
//            CGContextStrokePath(context)
//        }
        
        CGContextBeginPath(context)
        for i in 0..<3 {
            var cur_x = zigzag[i].0
            var cur_y = zigzag[i].1
            var next_x = zigzag[i+1].0
            var next_y = zigzag[i+1].1
            CGContextMoveToPoint(context, CGFloat(cur_x), CGFloat(cur_y))
            CGContextAddLineToPoint(context, CGFloat(next_x), CGFloat(next_y))
            CGContextSetStrokeColorWithColor(context, currentColor)
            CGContextStrokePath(context)
        }
        
        if paths.count != 0 {
            for onePath in paths {
                var points :[CGPoint]=onePath.points
                var preX = points[0].x, preY = points[0].y
                for point in points {
                    CGContextMoveToPoint(context, CGFloat(preX), CGFloat(preY))
                    CGContextAddLineToPoint(context, point.x, point.y)
                    preX = point.x
                    preY = point.y
                }
                CGContextSetStrokeColorWithColor(context, onePath.color)
                CGContextStrokePath(context)
            }
        }

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("Begin: \(point)")
        paths.append(Path(color: currentColor))
        paths[paths.count - 1].add(point)
        isDrawing = true
        setNeedsDisplay()
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add a new touch point to the path
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("Move: \(point)")
        paths[paths.count - 1].add(point)
        isDrawing = true
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add the end touch point
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("End: \(point)")
        paths[paths.count - 1].add(point)
        isDrawing = false
        setNeedsDisplay()
    }
    
    func setupClearButton() {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        // self.clearButton = button
        button.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
        button.setTitle("Clear", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "clearCanvas", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(button)
        // TODO: create a target-action to clear the canvas
    }
    
    func clearCanvas() {
        paths = []
        path = nil
        setNeedsDisplay()
        println("Cleared")
    }

}
