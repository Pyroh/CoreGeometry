//
//  CGVectorExtension.swift
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
import simd

public extension CGVector {

    @inlinable init(_ dx: CGFloat, _ dy: CGFloat) {
        self.init(dx: dx, dy: dy)
    }
    
    @inlinable init<T: BinaryInteger>(_ dx: T, _ dy: T) {
        self.init(dx: dx.cgFloat, dy: dy.cgFloat)
    }
    
    @inlinable init<T: BinaryFloatingPoint>(_ dx: T, _ dy: T) {
        self.init(dx: dx.cgFloat, dy: dy.cgFloat)
    }
}

public extension CGVector {
    @inlinable init(angle: CGFloat) {
        let x: CGFloat = cos(angle)
        let y: CGFloat = sin(angle)
        
        self.init(dx: x, dy: y)
    }
}

extension CGVector: BiComponent {
    
    /// The receiver's SIMD representation.
    @inlinable public var simd2: SIMD2<Native> {
        get { .init(dx.native, dy.native) }
        set { (dx, dy) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @inlinable public init(simd2: SIMD2<Native>) {
        self.init(dx: simd2.x, dy: simd2.y)
    }
}

public extension CGVector {
    @inlinable var horizontal: CGVector { .init(dx, .zero) }
    @inlinable var vertical: CGVector { .init(.zero, dy) }
    
    @inlinable init(horizontal amount: CGFloat) {
        self.init(dx: amount, dy: .zero)
    }
    
    @inlinable init<I: BinaryInteger>(horizontal amount: I) {
        self.init(dx: amount.cgFloat, dy: .zero)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(horizontal amount: F) {
        self.init(dx: amount.cgFloat, dy: .zero)
    }
    
    @inlinable init(vertical amount: CGFloat) {
        self.init(dx: .zero, dy: amount)
    }
    
    @inlinable init<I: BinaryInteger>(vertical amount: I) {
        self.init(dx: .zero, dy: amount.cgFloat)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(vertical amount: F) {
        self.init(dx: .zero, dy: amount.cgFloat)
    }
}

public extension CGVector {
    
    /// The vector magnitude.
    @inlinable var magnitude: CGFloat {
        length(simd2).cgFloat
    }
    
    /// The vector direction.
    @inlinable var direction: CGFloat {
        atan2(dy, dx).cgFloat
    }
    
    /// Returns a reversed copy of `self`.
    @inlinable func reversed() -> CGVector {
        self * -1
    }
    
    /// Reverse `self`
    @inlinable mutating func reverse() {
        self *= -1
    }
}

public extension CGVector {
    
    /// Returns `self` normalized.
    @inlinable func normalized() -> CGVector {
        return .init(simd2: simd.normalize(simd2))
    }
    
    /// Normalizes `self`.
    @inlinable mutating func normalize() {
        simd2 = simd.normalize(simd2)
    }
    
    /// Returns `self` reversed on the X axis.
    @inlinable func reversedX() -> CGVector {
        self * (-1, 1)
    }
    
    /// Reverses `self` on the X axis.
    @inlinable mutating func reverseX() {
        self *= (-1, 1)
    }
    
    /// Returns `self` reversed on the Y axis.
    @inlinable func reversedY() -> CGVector {
        self * (1, -1)
    }
    
    /// Reverses `self` on the Y axis.
    @inlinable mutating func reverseY() {
        self *= (1, -1)
    }
}
