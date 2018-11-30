//
//  CGVectorExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 15/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

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
    public static func *<T: BinaryInteger>(lhs: CGVector, rhs: T) -> CGVector {
        let factor = CGFloat(rhs)
        let dx = lhs.dx * factor
        let dy = lhs.dy * factor
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Multiplies a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    public static func *<T: BinaryFloatingPoint>(lhs: CGVector, rhs: T) -> CGVector {
        let factor = CGFloat(rhs)
        let dx = lhs.dx * factor
        let dy = lhs.dy * factor
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    public static func /<T: BinaryInteger>(lhs: CGVector, rhs: T) -> CGVector {
        let factor = CGFloat(rhs)
        let dx = lhs.dx * factor
        let dy = lhs.dy * factor
        
        return CGVector(dx: dx, dy: dy)
    }
    
    /// Divides a vector by the given value.
    ///
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - rhs: The given value.
    /// - Returns: The resulting vector.
    public static func /<T: BinaryFloatingPoint>(lhs: CGVector, rhs: T) -> CGVector {
        let factor = CGFloat(rhs)
        let dx = lhs.dx * factor
        let dy = lhs.dy * factor
        
        return CGVector(dx: dx, dy: dy)
    }
    
    
    /// Adds two vectors and returns the result.
    ///
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: Another vector.
    /// - Returns: The resulting vector.
    public static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
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
    public static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        let dx = lhs.dx + rhs.dx
        let dy = lhs.dy + rhs.dy
        
        return CGVector(dx: dx, dy: dy)
    }
}

