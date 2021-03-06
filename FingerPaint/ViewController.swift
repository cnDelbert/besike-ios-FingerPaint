//
//  ViewController.swift
//  FingerPaint
//
//  Created by Delbert on 14/10/31.
//  Copyright (c) 2014年 Delbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var canvasView:CanvasView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // `self.view` would be loaded from the storyboard.
        
        // Instantiate the canvas view. It should be the same size and pos as the root view.
        
        let canvasView = CanvasView(frame:CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        
        // Add the canvasView to the root view
        self.view.addSubview(self.canvasView)
        
        // Load color pickers
        self.setupColorPickers()
        
        self.canvasView.setupClearButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupColorPickers() {
        // Colors for the pickers.
        // Or you can choose a color scheme you like: https://kuler.adobe.com/explore/most-popular/
        let colors : [UIColor] = [
            // 0x000000
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            // 0x17A3A5
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            // 0x8DBF67
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            // 0xFCCB5F
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            // 0xFC6E59
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]
        
        
        // (x,y)
        let positions = [
            (33,43),(86,43),(138,43),(190,43),(242,43)
        ]
        
        // size
        let size = (44,44)
        
        // TODO: Create UIButton and add them to the view hierarchy
        var button: UIButton
        for i in 0...4 {
            button = UIButton(frame: CGRect(x: positions[i].0, y: positions[i].1, width: size.0, height: size.1))
            button.backgroundColor = colors[i]
            button.enabled = true
            button.tag = i+1
            
            button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowRadius = 0
            button.layer.shadowOpacity = 1
            
            button.addTarget(self, action:"colorPickerTapped:",forControlEvents:UIControlEvents.TouchUpInside)
            
            self.canvasView.addSubview(button)
        }
    }
    
    func colorPickerTapped(button:UIButton) {
        println("Tapped: \(button.backgroundColor)")
        for i in 1...5 {
            self.canvasView.viewWithTag(i)!.layer.shadowRadius = 0
        }

        self.canvasView.currentColor = button.backgroundColor!.CGColor
        button.layer.shadowRadius = 3
    }

}

