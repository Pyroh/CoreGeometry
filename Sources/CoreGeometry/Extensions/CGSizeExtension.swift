//
//  CGSizeExtension.swift
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
import SwizzleIMD
import simd

public extension CGSize {

    /// The largest size that result from converting the source size values to integers.
    @inlinable var integral: Self { .init(simd2: simd2.rounded(.up)) }

    /// `true` if `width` == `height`. `false` otherwise.
    @inlinable var isSquare: Bool { width == height }
    
    /// `true` if `width` and `height` both equal 0. `false` otherwise.
    @inlinable var isZero: Bool { width.isZero && height.isZero }
    
    /// The receiver's aspect ratio. Equals to `width / height`.
    @inlinable var aspectRatio: CGFloat {
        if isZero { return 1 }
        else if height.isZero { return 0 }
        else { return abs(width) / abs(height) }
    }
    
    /// The minimum value of the size. Can be either the width or the height.
    @inlinable var min: CGFloat { width < height ? width : height }
    
    /// The maximum value of the size. Can be either the width or the height.
    @inlinable var max: CGFloat { width < height ? height : width }
    
    /// The largest square size the receiver can fit.
    @inlinable var minSize: CGSize { .init(square: min) }
    
    /// The smallest square that can contain the receiver.
    @inlinable var maxSize: CGSize { .init(square: max) }
    
    /// The area of the size.
    @inlinable var area: CGFloat { width * height }
}

public extension CGSize {
    
    /// The width rounded to the upper integer.
    @inlinable var integralWidth: Int { Int(width.rounded(.up)) }
    
    /// The height rounded to the upper integer.
    @inlinable var integralHeight: Int { Int(height.rounded(.up)) }
    
    /// Same as `integral` but with a given rounding rule.
    @inlinable func integral(_ rule: FloatingPointRoundingRule) -> Self {
        .init(simd2: simd2.rounded(rule))
    }
}

public extension CGSize {
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init(square amount: CGFloat) {
        self.init(width: amount, height: amount)
    }
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init<I: BinaryInteger>(square amount: I) {
        self.init(width: amount.cgFloat, height: amount.cgFloat)
    }
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init<F: BinaryFloatingPoint>(square amount: F) {
        self.init(width: amount.cgFloat, height: amount.cgFloat)
    }
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init(_ square: CGFloat) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init<I: BinaryInteger>(_ square: I) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    /// Inits a size of `(amount, amount)`.
    @inlinable init<F: BinaryFloatingPoint>(_ square: F) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    /// Inits a size of `(width, height)`.
    @inlinable init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
    
    /// Inits a size of `(width, height)`.
    @inlinable init<I: BinaryInteger>(_ width: I, _ height: I) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }
    
    /// Inits a size of `(width, height)`.
    @inlinable init<F: BinaryFloatingPoint>(_ width: F, _ height: F) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }
}

public extension CGSize {
    
    /// The size with an height equal to zero.
    @inlinable var horizontal: CGSize { .init(width: width, height: .zero) }
    
    /// The size with a width equal to zero.
    @inlinable var vertical: CGSize { .init(width: .zero, height: height) }
    
    /// Inits a size of `(amount, 0)`.
    @inlinable init(horizontal amount: CGFloat) {
        self.init(width: amount, height: .zero)
    }
    
    /// Inits a size of `(amount, 0)`.
    @inlinable init<I: BinaryInteger>(horizontal amount: I) {
        self.init(width: amount.cgFloat, height: .zero)
    }
    
    /// Inits a size of `(amount, 0)`.
    @inlinable init<F: BinaryFloatingPoint>(horizontal amount: F) {
        self.init(width: amount.cgFloat, height: .zero)
    }
    
    /// Inits a size of `(0, amount)`.
    @inlinable init(vertical amount: CGFloat) {
        self.init(width: .zero, height: amount)
    }
    
    /// Inits a size of `(0, amount)`.
    @inlinable init<I: BinaryInteger>(vertical amount: I) {
        self.init(width: .zero, height: amount.cgFloat)
    }
    
    /// Inits a size of `(0, amount)`.
    @inlinable init<F: BinaryFloatingPoint>(vertical amount: F) {
        self.init(width: .zero, height: amount.cgFloat)
    }
}

public extension CGSize {
    @inlinable init(aspectRatio: CGFloat, maxEdge: CGFloat) {
        guard aspectRatio > 0 else { self = .init(maxEdge); return }
        guard aspectRatio.isFinite else { self = .init(.infinity, .infinity); return }
        
        if aspectRatio > 1 {
            self.init(width: maxEdge, height: maxEdge / aspectRatio)
        } else if aspectRatio < 1 {
            self.init(width: maxEdge * aspectRatio, height: maxEdge)
        } else {
            self.init(width: maxEdge, height: maxEdge)
        }
    }
    
    @inlinable init<E: BinaryInteger>(aspectRatio: CGFloat, maxEdge: E) {
        self.init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat)
    }
    
    @inlinable init<E: BinaryFloatingPoint>(aspectRatio: CGFloat, maxEdge: E) {
        self.init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat)
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(aspectRatio: A, maxEdge: E) {
        self.init(aspectRatio: aspectRatio.cgFloat, maxEdge: maxEdge.cgFloat)
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(aspectRatio: A, maxEdge: E) {
        self.init(aspectRatio: aspectRatio.cgFloat, maxEdge: maxEdge.cgFloat)
    }
}

public extension CGSize {
    @inlinable init(aspectRatio: CGFloat, minEdge: CGFloat) {
        guard aspectRatio > 0 else { self = .init(minEdge); return }
        guard aspectRatio.isFinite else { self = .init(.infinity, .infinity); return }
        
        if aspectRatio > 1 {
            self.init(width: minEdge * aspectRatio, height: minEdge)
        } else if aspectRatio < 1 {
            self.init(width: minEdge, height: minEdge / aspectRatio)
        } else {
            self.init(width: minEdge, height: minEdge)
        }
    }
    
    @inlinable init<E: BinaryInteger>(aspectRatio: CGFloat, minEdge: E) {
        self.init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat)
    }

    @inlinable init<E: BinaryFloatingPoint>(aspectRatio: CGFloat, minEdge: E) {
        self.init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat)
    }

    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(aspectRatio: A, minEdge: E) {
        self.init(aspectRatio: aspectRatio.cgFloat, minEdge: minEdge.cgFloat)
    }

    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(aspectRatio: A, minEdge: E) {
        self.init(aspectRatio: aspectRatio.cgFloat, minEdge: minEdge.cgFloat)
    }
}

public extension CGSize {
    /// The receiver's SIMD representation.
    @inlinable var simd2: SIMD2<CGFloat.NativeType> {
        get { .init(width.native, height.native) }
        set { (width, height) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    /// Inits a size from its SIMD representation.
    @inlinable init(simd2: SIMD2<CGFloat.NativeType>) {
        self.init(width: simd2.x, height: simd2.y)
    }
}

public extension CGSize {
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * (lhs: CGSize, rhs: CGFloat.NativeType) -> CGSize {
        .init(simd2: lhs.simd2 * rhs)
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * (lhs: CGSize, rhs: (x: CGFloat.NativeType, y: CGFloat.NativeType)) -> CGSize {
        .init(simd2: lhs.simd2 * .init(rhs.x, rhs.y))
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <I: BinaryInteger>(lhs: CGSize, rhs: (x: I, y: I)) -> CGSize {
        .init(simd2: lhs.simd2 * .init(rhs.x.native, rhs.y.native))
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable static func * <F: BinaryFloatingPoint>(lhs: CGSize, rhs: (x: F, y: F)) -> CGSize {
        .init(simd2: lhs.simd2 * .init(rhs.x.native, rhs.y.native))
    }
    
    @inlinable static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(simd2: lhs.simd2 * rhs.simd2)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable static func / (lhs: CGSize, rhs: CGFloat.NativeType) -> CGSize {
        .init(simd2: lhs.simd2 / rhs)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable static func / <I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable static func / <F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    @inlinable static func / (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(simd2: lhs.simd2 / rhs.simd2)
    }
}

public extension CGSize {
    @inlinable static func + (lhs: CGSize, rhs: CGFloat.NativeType) -> CGSize {
        .init(simd2: lhs.simd2 + rhs)
    }
    
    @inlinable static func + <I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    @inlinable static func + <F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    @inlinable static func + (lhs: CGSize, rhs: (width: CGFloat.NativeType, height: CGFloat.NativeType)) -> CGSize {
        .init(simd2: lhs.simd2 + .init(rhs.width, rhs.height))
    }
    
    @inlinable static func + <I: BinaryInteger>(lhs: CGSize, rhs: (width: I, height: I)) -> CGSize {
        .init(simd2: lhs.simd2 + .init(rhs.width.native, rhs.height.native))
    }
    
    @inlinable static func + <F: BinaryFloatingPoint>(lhs: CGSize, rhs: (width: F, height: F)) -> CGSize {
        .init(simd2: lhs.simd2 + .init(rhs.width.native, rhs.height.native))
    }
    
    @inlinable static func - (lhs: CGSize, rhs: CGFloat.NativeType) -> CGSize {
        .init(simd2: lhs.simd2 - rhs)
    }
    
    @inlinable static func - <I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    @inlinable static func - <F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    @inlinable static func - (lhs: CGSize, rhs: (width: CGFloat.NativeType, height: CGFloat.NativeType)) -> CGSize {
        .init(simd2: lhs.simd2 - .init(rhs.width, rhs.height))
    }
    
    @inlinable static func - <I: BinaryInteger>(lhs: CGSize, rhs: (width: I, height: I)) -> CGSize {
        .init(simd2: lhs.simd2 - .init(rhs.width.native, rhs.height.native))
    }
    
    @inlinable static func - <F: BinaryFloatingPoint>(lhs: CGSize, rhs: (width: F, height: F)) -> CGSize {
        .init(simd2: lhs.simd2 - .init(rhs.width.native, rhs.height.native))
    }
    
    @inlinable static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(simd2: lhs.simd2 + rhs.simd2)
    }

    @inlinable static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(simd2: lhs.simd2 - rhs.simd2)
    }
    
    @inlinable static prefix func - (rhs: CGSize) -> CGSize {
        .init(simd2: -rhs.simd2)
    }
}

public extension CGSize {
    
    /// Contrains `self` to the given size.
    /// - Parameter size: The size to contrain to.
    @inlinable mutating func constrain(to size: CGSize) {
        simd2 = simd.min(simd2, size.simd2)
    }
    
    /// Return `self` constrained to the given size.
    /// - Parameter size: The size to contrain to.
    @inlinable func constrained(to size: CGSize) -> CGSize {
        .init(simd2: simd.min(simd2, size.simd2))
    }
}

public extension CGSize {
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with(width: CGFloat) -> CGSize {
        .init(width, height)
    }
    
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with<I: BinaryInteger>(width: I) -> CGSize {
        .init(CGFloat(width), height)
    }
    
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with<F: BinaryFloatingPoint>(width: F) -> CGSize {
        .init(CGFloat(width), height)
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with(height: CGFloat) -> CGSize {
        .init(width, height)
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with<I: BinaryInteger>(height: I) -> CGSize {
        .init(width, CGFloat(height))
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with<F: BinaryFloatingPoint>(height: F) -> CGSize {
        .init(width, CGFloat(height))
    }
}

public extension CGSize {
    
    @inlinable func transformWidth(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGSize {
        with(width: try transform(width))
    }
    
    @inlinable func transformHeight(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGSize {
        with(height: try transform(height))
    }
}

public extension CGSize {
    
    /// Creates a new `CGRect` with the receiver for its size and its origin set to the given point.
    /// - Parameter origin: The origin of the `CGRect`.
    /// - Returns: The resulting `CGRect`.
    @inlinable func makeRect(withOrigin origin: CGPoint = .zero) ->  CGRect {
        .init(origin: origin, size: self)
    }
    
    /// Creates a new `CGRect` with the receiver for its size and its center set to the given point.
    /// - Parameter origin: The center of the `CGRect`.
    /// - Returns: The resulting `CGRect`.
    @inlinable func makeRect(withCenter center: CGPoint) -> CGRect {
        .init(center: center, size: self)
    }
}

public extension CGSize {
    /// Fits the receiver to the reference size.
    /// - Parameter reference: The reference size.
    /// - Note: The receiver and the reference size elements must be greater of equal than zero.
    @inlinable mutating func fit(to reference: CGSize) {
        let mask = Array((simd2 .> reference.simd2).elements)
        let maxEdge: CGFloat
        
        switch mask {
        case [true, false]: maxEdge = reference.width
        case [false, true]: maxEdge = reference.height
        default: maxEdge = reference.width < reference.height ? reference.width : reference.height
        }
        
        self = .init(aspectRatio: aspectRatio, maxEdge: maxEdge)
    }
    
    /// Returns the size scaled to fit the reference size.
    /// - Parameter reference: The reference size.
    /// - Note: The receiver and the reference size elements must be greater of equal than zero.
    @inlinable func fitted(to reference: CGSize) -> CGSize {
        let mask = Array((simd2 .> reference.simd2).elements)
        let maxEdge: CGFloat
        
        switch mask {
        case [true, false]: maxEdge = reference.width
        case [false, true]: maxEdge = reference.height
        default: maxEdge = reference.width < reference.height ? reference.width : reference.height
        }
        
        return .init(aspectRatio: aspectRatio, maxEdge: maxEdge)
    }
    
    /// Returns `true` if the given size's elements are both lesser that or equel to the receiver's one, respectivelty. `false` otherwise.
    @inlinable func contains(_ other: CGSize) -> Bool {
        all(other.simd2 .<= simd2)
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
public extension CGSize {
    @inlinable static func * (lhs: Self, rhs: UnitPoint) -> Self {
        .init(simd2: lhs.simd2 * rhs.simd2)
    }
}
