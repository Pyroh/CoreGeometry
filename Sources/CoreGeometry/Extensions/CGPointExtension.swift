//
//  CGPointExtension.swift
//  CoreGeometry
//
//  Copyright © 2019 Pyrolyse
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import CoreGraphics

public extension CGPoint {
    /// Returns the vector that exists between `self` and `p2`.
    @inlinable
    func formVector(with p2: CGPoint) -> CGVector {
        return CGVector(dx: p2.x - self.x, dy: p2.y - self.y)
    }
    
    /// Returns a copy of `self` translated along the given vector.
    @inlinable
    func translated(along vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    func translated(tx: Int, ty: Int) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    func translated(tx: Double, ty: Double) -> CGPoint {
        return CGPoint(x: self.x + CGFloat(tx), y: self.y + CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    func translated(tx: CGFloat, ty: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + tx, y: self.y + ty)
    }
    
    /// Translates `self` along the given vector.
    @inlinable
    mutating func translate(by vector: CGVector) {
        self = self.translated(along: vector)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    mutating func translate(tx: Int, ty: Int) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    mutating func translate(tx: Double, ty: Double) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable
    mutating func translate(tx: CGFloat, ty: CGFloat) {
        self = self.translated(tx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable
    func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGPoint {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return self.applying(transform)
    }
    
    /// Rotates `self` around the givent center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable
    mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
}

public extension CGPoint {
    @inlinable
    static func *(lhs: CGPoint, rhs: Int) -> CGPoint {
        return lhs * CGFloat(rhs)
    }
    
    @inlinable
    static func *(lhs: Int, rhs: CGPoint) -> CGPoint {
        return rhs * lhs
    }
    
    @inlinable
    static func *(lhs: CGPoint, rhs: Double) -> CGPoint {
        return lhs * CGFloat(rhs)
    }
    
    @inlinable
    static func *(lhs: Double, rhs: CGPoint) -> CGPoint {
        return rhs * lhs
    }
    
    @inlinable
    static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    @inlinable
    static func *(lhs: CGFloat, rhs: CGPoint) -> CGPoint {
        return rhs * lhs
    }
    
    @inlinable
    static func /(lhs: CGPoint, rhs: Int) -> CGPoint {
        return lhs / CGFloat(rhs)
    }
    
    @inlinable
    static func /(lhs: Int, rhs: CGPoint) -> CGPoint {
        return rhs / lhs
    }
    
    @inlinable
    static func /(lhs: CGPoint, rhs: Double) -> CGPoint {
        return lhs / CGFloat(rhs)
    }
    
    @inlinable
    static func /(lhs: Double, rhs: CGPoint) -> CGPoint {
        return rhs / lhs
    }
    
    @inlinable
    static func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    @inlinable
    static func /(lhs: CGFloat, rhs: CGPoint) -> CGPoint {
        return rhs / lhs
    }
    
    @inlinable
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    @inlinable
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
