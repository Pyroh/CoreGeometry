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
    
    /// The receiver's SIMD representation.
    @inlinable var simd2: SIMD2<CGFloat.NativeType> {
        get { .init(dx.native, dy.native) }
        set { (dx, dy) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @inlinable init(simd2: SIMD2<CGFloat.NativeType>) {
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
        CGVector(dx: -self.dx, dy: -self.dy)
    }
    
    /// Reverse `self`
    @inlinable mutating func reverse() {
        self.dx *= -1
        self.dy *= -1
    }
}

public extension CGVector {
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable static func *<I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable static func *<F: BinaryFloatingPoint>(lhs: CGVector, rhs: F) -> CGVector {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable static func * (lhs: CGVector, rhs: CGFloat.NativeType) -> CGVector {
        .init(simd2: lhs.simd2 * rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func /<I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func /<F:BinaryFloatingPoint>(lhs: CGVector, rhs: F) -> CGVector {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func / (lhs: CGVector, rhs: CGFloat.NativeType) -> CGVector {
        .init(simd2: lhs.simd2 / rhs)
    }
}

extension CGVector: AdditiveArithmetic {
    
    /// Adds two vectors.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The vector to add.
    /// - Returns: The sum of the two vectors.
    @inlinable public static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(simd2: lhs.simd2 + rhs.simd2)
    }
    
    /// Adds a value to a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to add.
    /// - Returns: The resulting vector.
    @inlinable public static func + <I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    /// Adds a value to a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to add.
    /// - Returns: The resulting vector.
    @inlinable public static func + <I: BinaryFloatingPoint>(lhs: CGVector, rhs: I) -> CGVector {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    /// Adds a value to a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to add.
    /// - Returns: The resulting vector.
    @inlinable public static func + (lhs: CGVector, rhs: CGFloat.NativeType) -> CGVector {
        .init(simd2: lhs.simd2 + rhs.native)
    }

    /// Substracts two vectors.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The vector to substract.
    /// - Returns: The difference between the two vectors.
    @inlinable public static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(simd2: lhs.simd2 - rhs.simd2)
    }
    
    /// Substracts a value from a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - <I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    /// Substracts a value from a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - <F: BinaryFloatingPoint>(lhs: CGVector, rhs: F) -> CGVector {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    /// Substracts a value from a vector's components.
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - (lhs: CGVector, rhs: CGFloat.NativeType) -> CGVector {
        .init(simd2: lhs.simd2 - rhs)
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
        .init(dx: -dx, dy: dy)
    }
    
    /// Reverses `self` on the X axis.
    @inlinable mutating func reverseX() {
        dx *= -1
    }
    
    /// Returns `self` reversed on the Y axis.
    @inlinable func reversedY() -> CGVector {
        .init(dx: dx, dy: -dy)
    }
    
    /// Reverses `self` on the Y axis.
    @inlinable mutating func reverseY() {
        dy *= -1
    }
}
