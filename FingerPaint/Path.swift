//
//  Path.swift
//  FingerPaint
//
//  Created by Delbert on 14/11/7.
//  Copyright (c) 2014年 Delbert. All rights reserved.
//

import UIKit

class Path {
    var points: [CGPoint] = []
    let color: UIColor
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
}