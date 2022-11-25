//
//  CGPointExtension.swift
//
//  CoreGeometry
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import CoreGraphics
import SwiftUI

public extension CGPoint {
    enum Alignment { case whole, half }
    
    func aligned(_ alignment: Alignment = .whole) -> Self {
        alignment == .whole ?
            .init(simd2: simd2.rounded(.toNearestOrAwayFromZero)) :
            .init(simd2: (simd2 * 2).rounded(.toNearestOrAwayFromZero) / 2)
    }
    
    mutating func align(_ alignment: Alignment = .whole) {
        if alignment == .whole { simd2 = simd2.rounded(.toNearestOrAwayFromZero) }
        else { simd2 = (simd2 * 2).rounded(.toNearestOrAwayFromZero) / 2 }
    }
}

public extension CGPoint {
    /// Creates a point with coordinates specified as integer values.
    @inlinable init<T: BinaryInteger>(x: T, y: T) {
        self.init(x: x.cgFloat, y: y.cgFloat)
    }
    
    /// Creates a point with coordinates specified as floating-point values.
    @inlinable init<T: BinaryFloatingPoint>(x: T, y: T) {
        self.init(x: x.cgFloat, y: y.cgFloat)
    }
    
    /// Creates a point with coordinates specified as integer values.
    @inlinable init<T: BinaryInteger>(_ x: T, _ y: T) {
        self.init(x: x.cgFloat, y: y.cgFloat)
    }
    
    /// Creates a point with coordinates specified as floating-point values.
    @inlinable init<T: BinaryFloatingPoint>(_ x: T, _ y: T) {
        self.init(x: x.cgFloat, y: y.cgFloat)
    }
    
    /// Creates a point with coordinates specified as floating-point values.
    @inlinable init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}

extension CGPoint: BiComponent {
    
    /// The receiver's SIMD representation.
    @inlinable public var simd2: SIMD2<Native> {
        get { .init(x.native, y.native) }
        set { (x, y) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @inlinable public init(simd2: SIMD2<Native>) {
        self.init(x: simd2.x, y: simd2.y)
    }
}

public extension CGPoint {
    /// Returns the vector that exists between `self` and `p2`.
    @inlinable func formVector(with p2: CGPoint) -> CGVector {
        .init(simd2: p2.simd2 - simd2)
    }
    
    /// Returns a copy of `self` translated along the given vector.
    @inlinable func translated(along vector: CGVector) -> CGPoint {
        self + vector
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable func translated<I: BinaryInteger>(tx: I, ty: I) -> CGPoint {
        self + (tx.native, ty.native)
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable func translated<F: BinaryFloatingPoint>(tx: F, ty: F) -> CGPoint {
        self + (tx.native, ty.native)
    }
    
    /// Translates `self` along the given vector.
    @inlinable mutating func translate(along vector: CGVector) {
        self += vector
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable mutating func translate<I: BinaryInteger>(tx: I, ty: I) {
        self += (tx.native, ty.native)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable mutating func translate<F: BinaryFloatingPoint>(tx: F, ty: F) {
        self += (tx.native, ty.native)
    }
    
    /// Returns a copy of `self` rotated around the given center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGPoint {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return applying(transform)
    }
    
    /// Rotates `self` around the givent center by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    @inlinable mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
}

extension CGPoint {
    
    /// Creates a new `CGRect` with the receiver for its origin and sized to the given size.
    /// - Parameter size: The size of the `CGRect`.
    /// - Returns: The resulting `CGRect`.
    @inlinable public func makeRect(withSize size: CGSize) -> CGRect {
        .init(origin: self, size: size)
    }
    
    /// Creates a new `CGRect` with the receiver for its center and sized to the given size.
    /// - Parameter size: The size of the `CGRect`.
    /// - Returns: The resulting `CGRect`.
    @inlinable public func makeRect(centeredWithSize size: CGSize) -> CGRect {
        .init(center: self, size: size)
    }
}

public extension CGPoint {
    @inlinable mutating func clamp(to rect: CGRect) {
        self = clamped(to: rect)
    }
    
    @inlinable func clamped(to rect: CGRect) -> CGPoint {
        .init(simd2: simd2.clamped(lowerBound: rect.origin.simd2, upperBound: rect.origin.simd2 + rect.size.simd2))
    }
}
