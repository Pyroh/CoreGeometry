//
//  CGSizeExtension.swift
//  CoreGeometry
//

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
