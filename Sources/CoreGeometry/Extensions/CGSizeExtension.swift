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
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Int64) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Float) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Int8) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: UInt8) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Double) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Int16) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: UInt32) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: UInt) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: UInt16) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Int32) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: UInt64) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func * (lhs: CGSize, rhs: Float80) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int64) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Float) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int8) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: UInt8) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Double) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int16) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: UInt32) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: UInt) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: UInt16) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Int32) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: UInt64) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func / (lhs: CGSize, rhs: Float80) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
}
