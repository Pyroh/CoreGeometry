//
//  CGVectorExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 15/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

extension CGVector {
    /// The vector magnitude.
    @inlinable
    public var magnitude: CGFloat {
        return sqrt(pow(dx, 2) + pow(dy, 2))
    }
    
    /// The vector direction.
    @inlinable
    public var direction: CGFloat {
        return CGFloat(atan2(dy, dx))
    }
    
    /// Returns a reversed copy of `self`.
    @inlinable
    public func reversed() -> CGVector {
        return CGVector(dx: -self.dx, dy: -self.dy)
    }
    
    /// Reverse `self`
    @inlinable
    public mutating func reverse() {
        self = self.reversed()
    }
}
