//
//  CGSizeExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

extension CGSize {
    /// Inits a size of `(square,square)`.
    @inlinable
    public init<T:BinaryInteger>(square: T) {
        self.init(width: CGFloat(square), height: CGFloat(square))
    }
    
    /// Inits a size of `(square,square)`.
    @inlinable
    public init<T:BinaryFloatingPoint>(square: T) {
        self.init(width: CGFloat(square), height: CGFloat(square))
    }
}


extension CGSize {
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func *<T:BinaryInteger>(lhs: CGSize, rhs: T) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Multiplies both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func *<T:BinaryFloatingPoint>(lhs: CGSize, rhs: T) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width * factor, height: lhs.height * factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func /<T:BinaryInteger>(lhs: CGSize, rhs: T) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
    
    /// Devides both width and height values of a size by a given factor.
    ///
    /// - Parameters:
    ///   - lhs: The size (a `CGSize` instance)
    ///   - rhs: The factor
    @inlinable
    public static func /<T:BinaryFloatingPoint>(lhs: CGSize, rhs: T) -> CGSize {
        let factor = CGFloat(rhs)
        return CGSize(width: lhs.width / factor, height: lhs.height / factor)
    }
}
