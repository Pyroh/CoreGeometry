//
//  CGSlope.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 30/11/2018.
//

import CoreGraphics

public struct CGSlope {
    public var m: CGFloat
    public var b: CGFloat
    
    public func intersectionPointWith(slope: CGSlope) -> CGPoint? {
        guard self.m != slope.m else { return nil }
        let x = (slope.b - self.b) / (self.m - slope.m)
        let y = self.m * x + self.b
        
        return CGPoint(x: x, y: y)
    }
}
