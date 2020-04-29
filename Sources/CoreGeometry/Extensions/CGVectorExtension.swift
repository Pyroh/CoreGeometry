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

public extension CGVector {
    var horizontal: CGSize { CGSize(horizontal: dx) }
    var vertical: CGSize { CGSize(vertical: dy) }
    
    init(horizontal amount: CGFloat) {
        self.init(dx: amount, dy: .zero)
    }
    
    init(horizontal amount: Double) { self.init(horizontal: CGFloat(amount)) }
    init(horizontal amount: Int) { self.init(horizontal: CGFloat(amount)) }
    
    init(vertical amount: CGFloat) {
        self.init(dx: .zero, dy: amount)
    }
    
    init(vertical amount: Double) { self.init(vertical: CGFloat(amount)) }
    init(vertical amount: Int) { self.init(vertical: CGFloat(amount)) }
}

public extension CGVector {
    
    /// The vector magnitude.
    @inlinable
    var magnitude: CGFloat {
        sqrt(pow(dx, 2) + pow(dy, 2))
    }
    
    /// The vector direction.
    @inlinable
    var direction: CGFloat {
        CGFloat(atan2(dy, dx))
    }
    
    /// Returns a reversed copy of `self`.
    @inlinable
    func reversed() -> CGVector {
        CGVector(dx: -self.dx, dy: -self.dy)
    }
    
    /// Reverse `self`
    @inlinable
    mutating func reverse() {
        self = self.reversed()
    }
}

public extension CGVector {
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func *<I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
        lhs * CGFloat(rhs)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func *<F: BinaryFloatingPoint>(lhs: CGVector, rhs: F) -> CGVector {
        lhs * CGFloat(rhs)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
        CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func /<I: BinaryInteger>(lhs: CGVector, rhs: I) -> CGVector {
       lhs / CGFloat(rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func /<F:BinaryFloatingPoint>(lhs: CGVector, rhs: F) -> CGVector {
        lhs / CGFloat(rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    static func / (lhs: CGVector, rhs: CGFloat) -> CGVector {
        CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
    }
}

extension CGVector: AdditiveArithmetic {
    @inlinable
    public static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    @inlinable
    public static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
}
