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
import simd

public extension CGSize {
    
    /// Inits a size of `(amount,amount)`.
    @inlinable init(square amount: CGFloat) {
        self.init(width: amount, height: amount)
    }
    
    /// Inits a size of `(amount,amount)`.
    @inlinable init<I: BinaryInteger>(square amount: I) {
        self.init(width: amount.cgFloat, height: amount.cgFloat)
    }
    
    /// Inits a size of `(amount,amount)`.
    @inlinable init<F: BinaryFloatingPoint>(square amount: F) {
        self.init(width: amount.cgFloat, height: amount.cgFloat)
    }
    
    @inlinable init(_ square: CGFloat) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    @inlinable init<I: BinaryInteger>(_ square: I) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(_ square: F) {
        self.init(width: square.cgFloat, height: square.cgFloat)
    }
    
    @inlinable init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
    
    @inlinable init<I: BinaryInteger>(_ width: I, _ height: I) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(_ width: F, _ height: F) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }
    
}

public extension CGSize {
    @inlinable var horizontal: CGSize { .init(width: width, height: .zero) }
    @inlinable var vertical: CGSize { .init(width: .zero, height: height) }
    
    @inlinable init(horizontal amount: CGFloat) {
        self.init(width: amount, height: .zero)
    }
    
    @inlinable init<I: BinaryInteger>(horizontal amount: I) {
        self.init(width: amount.cgFloat, height: .zero)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(horizontal amount: F) {
        self.init(width: amount.cgFloat, height: .zero)
    }
    
    @inlinable init(vertical amount: CGFloat) {
        self.init(width: .zero, height: amount)
    }
    
    @inlinable init<I: BinaryInteger>(vertical amount: I) {
        self.init(width: .zero, height: amount.cgFloat)
    }
    
    @inlinable init<F: BinaryFloatingPoint>(vertical amount: F) {
        self.init(width: .zero, height: amount.cgFloat)
    }
}

public extension CGSize {
    /// The receiver's SIMD representation.
    @inlinable var simd2: SIMD2<CGFloat.NativeType> {
        get { .init(width.native, height.native) }
        set { (width, height) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @inlinable init(simd2: SIMD2<CGFloat.NativeType>) {
        self.init()
        
        self.width.native = simd2.x
        self.height.native = simd2.y
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
}

public extension CGSize {
    
    /// Contrains `self` to the given size.
    /// - Parameter size: The size to contrain to.
    @inlinable mutating func constrain(to size: CGSize) {
        simd2 = min(simd2, size.simd2)
    }
    
    /// Return `self` constrained to the given size.
    /// - Parameter size: The size to contrain to.
    @inlinable func constrained(to size: CGSize) -> CGSize {
        .init(simd2: min(simd2, size.simd2))
    }
}
