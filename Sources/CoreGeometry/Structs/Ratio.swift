//
//  Ratio.swift
//  CoreGeometry
//

import Foundation

public struct Ratio {
    /// The ratio numerator.
    public var a: CGFloat
    
    /// The ratio denominator.
    public var b: CGFloat
    
    /// The ratio factor.
    public var factor: CGFloat {
        return self.a / self.b
    }
    
    /// The orientation of the ratio.
    public var orientation: Orientation {
        switch self.a / self.b {
        case let x where x < 1.0:
            return .portrait
        case let x where x > 1.0:
            return .landscape
        default:
            return .square
        }
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: Int, to b: Int) {
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: Double, to b: Double) {
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: CGFloat, to b: CGFloat) {
        self.a = a
        self.b = b
    }
    
    /// Invert `self`.
    @inlinable
    public mutating func invert() {
        self = self.inverted()
    }
    
    /// Return `self` inverted.
    ///
    /// - Returns: The inverted version of `self`.
    @inlinable
    public func inverted() -> Ratio {
        return Ratio(self.b, to: self.a)
    }
    
}
