//
//  CGSizeExtension.swift
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

extension CGSize {
    /// Inits a size of `(square,square)`.
    @inlinable
    public init(square: Int) {
        self.init(width: square, height: square)
    }
    
    /// Inits a size of `(square,square)`.
    @inlinable
    public init(square: Double) {
        self.init(width:square, height: square)
    }
    
    /// Inits a size of `(square,square)`.
    @inlinable
    public init(square: CGFloat) {
        self.init(width: square, height: square)
    }
}


extension CGSize {
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Int) -> CGSize {
        return lhs * CGFloat(rhs)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Double) -> CGSize {
        return lhs * CGFloat(rhs)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int) -> CGSize {
        return lhs / CGFloat(rhs)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Double) -> CGSize {
        return lhs / CGFloat(rhs)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    /// Adds the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func + (lhs: CGSize, rhs: Int) -> CGSize {
        return lhs + CGFloat(rhs)
    }
    
    /// Adds the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func + (lhs: CGSize, rhs: Double) -> CGSize {
        return lhs + CGFloat(rhs)
    }
    
    /// Adds the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func + (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width + rhs, height: lhs.height + rhs)
    }
    
    /// Substracts the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func - (lhs: CGSize, rhs: Int) -> CGSize {
        return lhs - CGFloat(rhs)
    }
    
    /// Substracts the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func - (lhs: CGSize, rhs: Double) -> CGSize {
        return lhs - CGFloat(rhs)
    }
    
    /// Substracts the given value to both width and height values of a size.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The value
    @inlinable
    public static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
}
