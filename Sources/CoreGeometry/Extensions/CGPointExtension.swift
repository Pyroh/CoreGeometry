//
//  CGPointExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGPoint {
    /// Returns the vector that exists between `self` and `p2`.
    @inlinable
    public func formVector(with p2: CGPoint) -> CGVector {
        return CGVector(dx: p2.x - self.x, dy: p2.y - self.y)
    }
    
    /// Returns a copy of `self` translated along the given vector.
    @inlinable
    public func translated(along vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public func translated(tx: Int, ty: Int) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public func translated(tx: Double, ty: Double) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public func translated(tx: CGFloat, ty: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + tx, y: self.y + ty)
    }
    
    /// Translates `self` along the given vector.
    @inlinable
    public mutating func translate(by vector: CGVector) {
        self = self.translated(along: vector)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public mutating func translate(tx: Int, ty: Int) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public mutating func translate(tx: Double, ty: Double) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    public mutating func translate(tx: CGFloat, ty: CGFloat) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable
    public func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGPoint {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return self.applying(transform)
    }
    
    /// Rotates `self` around the givent center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable
    public mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
}
