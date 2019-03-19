//
//  CGVectorExtension.swift
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

extension CGVector {
    /// The vector magnitude.
    @inlinable
    public var magnitude: CGFloat {
        return sqrt(pow(dx, 2) + pow(dy, 2))
    }
    
    /// The vector direction.
    @inlinable
    public var direction: CGFloat {
        return CGFloat(atan2(dy, dx))
    }
    
    /// Returns a reversed copy of `self`.
    @inlinable
    public func reversed() -> CGVector {
        return CGVector(dx: -self.dx, dy: -self.dy)
    }
    
    /// Reverse `self`
    @inlinable
    public mutating func reverse() {
        self = self.reversed()
    }
}

extension CGVector {
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func * (lhs: CGVector, rhs: Int) -> CGVector {
        return lhs * CGFloat(rhs)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func * (lhs: CGVector, rhs: Double) -> CGVector {
        return lhs * CGFloat(rhs)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
        let dx = lhs.dx * rhs
        let dy = lhs.dy * rhs
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func / (lhs: CGVector, rhs: Int) -> CGVector {
       return lhs / CGFloat(rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func / (lhs: CGVector, rhs: Double) -> CGVector {
        return lhs / CGFloat(rhs)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    @inlinable
    public static func / (lhs: CGVector, rhs: CGFloat) -> CGVector {
        let dx = lhs.dx / rhs
        let dy = lhs.dy / rhs
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Adds two vectors and returns the result.
    ///
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: Another vector.
    /// - Returns: The resulting vector.
    @inlinable
    public static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        let dx = lhs.dx + rhs.dx
        let dy = lhs.dy + rhs.dy
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Substracts two vectors and returns the result.
    ///
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: Another vector.
    /// - Returns: The resulting vector.
    @inlinable
    public static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        return lhs + rhs.reversed()
    }
}

