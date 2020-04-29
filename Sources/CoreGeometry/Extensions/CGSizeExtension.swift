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

public extension CGSize {
    
    /// Inits a size of `(amount,amount)`.
    @inlinable
    init(square amount: Int) {
        self.init(width: amount, height: amount)
    }
    
    /// Inits a size of `(amount,amount)`.
    @inlinable
    init(square amount: Double) {
        self.init(width: amount, height: amount)
    }
    
    /// Inits a size of `(amount,amount)`.
    @inlinable
    init(square amount: CGFloat) {
        self.init(width: amount, height: amount)
    }
}

public extension CGSize {
    var horizontal: CGSize { CGSize(horizontal: width) }
    var vertical: CGSize { CGSize(vertical: height) }
    
    init(horizontal amount: CGFloat) {
        self.init(width: amount, height: .zero)
    }
    
    init(horizontal amount: Double) { self.init(horizontal: CGFloat(amount)) }
    init(horizontal amount: Int) { self.init(horizontal: CGFloat(amount)) }
    
    init(vertical amount: CGFloat) {
        self.init(width: .zero, height: amount)
    }
    
    init(vertical amount: Double) { self.init(vertical: CGFloat(amount)) }
    init(vertical amount: Int) { self.init(vertical: CGFloat(amount)) }
}


public extension CGSize {
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func *<I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        lhs * CGFloat(rhs)
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func *<F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        lhs * CGFloat(rhs)
    }
    
    /// Multiplies `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to multiply components.
    ///   - rhs: The value to multiply.
    @inlinable
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    @inlinable
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable
    static func /<I: BinaryInteger>(lhs: CGSize, rhs: I) -> CGSize {
        lhs /  CGFloat(rhs)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable
    static func /<F: BinaryFloatingPoint>(lhs: CGSize, rhs: F) -> CGSize {
        lhs / CGFloat(rhs)
    }
    
    /// Divides `width` and `height` by the given value and returns the resulting `CGSize`.
    /// - Parameters:
    ///   - lhs: The point to devide components.
    ///   - rhs: The value to devide.
    @inlinable
    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    @inlinable
    static func / (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
    }
}

extension CGSize: AdditiveArithmetic {
    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
