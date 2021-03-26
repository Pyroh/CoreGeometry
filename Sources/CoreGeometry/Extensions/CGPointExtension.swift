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

public extension CGPoint {
    
    /// The receiver's SIMD representation.
    @inlinable var simd2: SIMD2<CGFloat.NativeType> {
        get { .init(x.native, y.native) }
        set { (x, y) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @inlinable init(simd2: SIMD2<CGFloat.NativeType>) {
        self.init()
        
        self.x.native = simd2.x
        self.y.native = simd2.y
    }
}

public extension CGPoint {
    /// Returns the vector that exists between `self` and `p2`.
    @inlinable func formVector(with p2: CGPoint) -> CGVector {
        .init(simd2: p2.simd2 - simd2)
    }
    
    /// Returns a copy of `self` translated along the given vector.
    @inlinable func translated(along vector: CGVector) -> CGPoint {
        .init(simd2: simd2 + vector.simd2)
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable func translated<I: BinaryInteger>(tx: I, ty: I) -> CGPoint {
        .init(simd2: simd2 + .init(tx.native, ty.native))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable func translated<F: BinaryFloatingPoint>(tx: F, ty: F) -> CGPoint {
        .init(simd2: simd2 + .init(tx.native, ty.native))
    }
    
    /// Returns a copy of `self` translated by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable func translated(tx: CGFloat.NativeType, ty: CGFloat.NativeType) -> CGPoint {
        .init(simd2: simd2 + .init(tx, ty))
    }
    
    /// FIXME: deprecated.
    /// Translates `self` along the given vector.
    @inlinable mutating func translate(by vector: CGVector) {
        simd2 += vector.simd2
    }
    
    /// Translates `self` along the given vector.
    @inlinable mutating func translate(along vector: CGVector) {
        simd2 += vector.simd2
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable mutating func translate<I: BinaryInteger>(tx: I, ty: I) {
        simd2 += .init(tx.native, ty.native)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable mutating func translate<F: BinaryFloatingPoint>(tx: F, ty: F) {
        simd2 += .init(tx.native, ty.native)
    }
    
    /// Translates `self` by `tx` on the X-axis and by `ty` on the Y-axis.
    @inlinable mutating func translate(tx: CGFloat.NativeType, ty: CGFloat.NativeType) {
        simd2 += .init(tx, ty)
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

public extension CGPoint {
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <I: BinaryInteger>(lhs: CGPoint, rhs: I) -> CGPoint {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <F: BinaryFloatingPoint>(lhs: CGPoint, rhs: F) -> CGPoint {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func * (lhs: CGPoint, rhs: CGFloat.NativeType) -> CGPoint {
        .init(simd2: lhs.simd2 * rhs)
    }
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func * <I: BinaryInteger>(lhs: CGPoint, rhs: (x: I, y: I)) -> CGPoint {
        .init(simd2: lhs.simd2 * .init(rhs.x.native, rhs.y.native))
    }
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func * <F: BinaryFloatingPoint>(lhs: CGPoint, rhs: (x: F, y: F)) -> CGPoint {
        .init(simd2: lhs.simd2 * .init(rhs.x.native, rhs.y.native))
    }
    
    /// Multiplies `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func * (lhs: CGPoint, rhs: (x: CGFloat.NativeType, y: CGFloat.NativeType)) -> CGPoint {
        .init(simd2: lhs.simd2 * .init(rhs.x, rhs.y))
    }
    
    /// Multiplies a point's components by another one's and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: A point to multiply.
    ///   - rhs: Another point the multiply.
    @inlinable static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(simd2: lhs.simd2 * rhs.simd2)
    }
    
    /// Divides `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to divide components.
    ///   - rhs: The value to devide by.
    @inlinable
    static func / <I: BinaryInteger>(lhs: CGPoint, rhs: I) -> CGPoint {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    /// Divides `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to divide components.
    ///   - rhs: The value to devide by.
    @inlinable
    static func / <F: BinaryFloatingPoint>(lhs: CGPoint, rhs: F) -> CGPoint {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    /// Divides `x` and `y` by the given value and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: The point to divide components.
    ///   - rhs: The value to devide by.
    @inlinable
    static func / (lhs: CGPoint, rhs: CGFloat.NativeType) -> CGPoint {
        .init(simd2: lhs.simd2 / rhs)
    }
    
    /// Divides a point's components by another one's and returns the resulting `CGPoint`.
    /// - Parameters:
    ///   - lhs: A point to devide.
    ///   - rhs: Another point the devide.
    @inlinable
    static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(simd2: lhs.simd2 / rhs.simd2)
    }
}

extension CGPoint: AdditiveArithmetic {
    
    @inlinable public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(simd2: lhs.simd2 + rhs.simd2)
    }
    
    /// Adds a value to a point's component.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to add.
    /// - Returns: The resulting point.
    @inlinable public static func + <I: BinaryInteger>(lhs: CGPoint, rhs: I) -> CGPoint {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    /// Adds a value to a point's component.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to add.
    /// - Returns: The resulting point.
    @inlinable public static func + <I: BinaryFloatingPoint>(lhs: CGPoint, rhs: I) -> CGPoint {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    /// Adds a value to a point's component.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to add.
    /// - Returns: The resulting point.
    @inlinable public static func + (lhs: CGPoint, rhs: CGFloat.NativeType) -> CGPoint {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    @inlinable public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(simd2: lhs.simd2 - rhs.simd2)
    }
    
    /// Substracts a value from a point's components.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - <I: BinaryInteger>(lhs: CGPoint, rhs: I) -> CGPoint {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    /// Substracts a value from a point's components.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - <F: BinaryFloatingPoint>(lhs: CGPoint, rhs: F) -> CGPoint {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    /// Substracts a value from a point's components.
    /// - Parameters:
    ///   - lhs: A point.
    ///   - rhs: The value to substract.
    /// - Returns: The resulting vector.
    @inlinable public static func - (lhs: CGPoint, rhs: CGFloat.NativeType) -> CGPoint {
        .init(simd2: lhs.simd2 - rhs)
    }
}
