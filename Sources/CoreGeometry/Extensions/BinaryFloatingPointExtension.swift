//
//  BinaryFloatingPointExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 03/10/2018.
//

import Foundation

extension BinaryFloatingPoint {
    /// The numerical value considered as expressed in radians converted in degrees.
    @inlinable
    public var degree: CGFloat {
        return CGFloat(self) * degreeFactor
    }
    
    /// The value considered as expressed in degrees converted in radians.
    @inlinable
    public var radian: CGFloat {
        return CGFloat(self) * radianFactor
    }
    
    /// The `sin` of the value considered as expressed in radians.
    @inlinable
    public var sin: CGFloat {
        return CoreGraphics.sin(CGFloat(self))
    }
    
    /// The `asin` of the value considered as expressed in radians.
    @inlinable
    public var asin: CGFloat {
        return CoreGraphics.asin(CGFloat(self))
    }
    
    /// The `cos` of the value considered as expressed in radians.
    @inlinable
    public var cos: CGFloat {
        return CoreGraphics.cos(CGFloat(self))
    }
    
    /// The `acos` of the value considered as expressed in radians.
    @inlinable
    public var acos: CGFloat {
        return CoreGraphics.acos(CGFloat(self))
    }
    
    /// The `tan` of the value considered as expressed in radians.
    @inlinable
    public var tan: CGFloat {
        return CoreGraphics.tan(CGFloat(self))
    }
    
    /// The `atan` of the value considered as expressed in radians.
    @inlinable
    public var atan: CGFloat {
        return CoreGraphics.atan(CGFloat(self))
    }
    
    /// Considers the value as an angle expressed in radians and contrains it to the range `[0..2π]`.
    ///
    /// - Returns: The constrained angle expressed in radians.
    @inlinable
    public func normalized() -> CGFloat {
        let r = CGFloat.pi * 2
        return (r + CGFloat(self).truncatingRemainder(dividingBy: r)).truncatingRemainder(dividingBy: r)
    }
}