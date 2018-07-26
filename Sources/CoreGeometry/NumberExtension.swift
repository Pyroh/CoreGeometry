//
//  CGFloatExtension.swift
//  CoreGeometry_macOSX
//
//  Created by Pierre TACCHI on 05/07/2018.
//  Copyright © 2018 Pyrolyse. All rights reserved.
//

import CoreGraphics

private let degreeFactor = 180 / CGFloat.pi
private let radianFactor = 1 / degreeFactor

extension BinaryInteger {
    /// The numerical value considered as expressed in radians converted in degrees.
    public var degree: CGFloat {
        return CGFloat(self) * degreeFactor
    }
    
    /// The numerical value considered as expressed in degrees converted in radians.
    public var radian: CGFloat {
        return CGFloat(self) * radianFactor
    }
}

extension BinaryFloatingPoint {
    /// The numerical value considered as expressed in radians converted in degrees.
    public var degree: CGFloat {
        return CGFloat(self) * degreeFactor
    }
    
    /// The value considered as expressed in degrees converted in radians.
    public var radian: CGFloat {
        return CGFloat(self) * radianFactor
    }
    
    /// The `sin` of the value considered as expressed in radians.
    public var sin: CGFloat {
        return CoreGraphics.sin(CGFloat(self))
    }
    
    /// The `asin` of the value considered as expressed in radians.
    public var asin: CGFloat {
        return CoreGraphics.asin(CGFloat(self))
    }
    
    /// The `cos` of the value considered as expressed in radians.
    public var cos: CGFloat {
        return CoreGraphics.cos(CGFloat(self))
    }
    
    /// The `acos` of the value considered as expressed in radians.
    public var acos: CGFloat {
        return CoreGraphics.acos(CGFloat(self))
    }
    
    /// The `tan` of the value considered as expressed in radians.
    public var tan: CGFloat {
        return CoreGraphics.cos(CGFloat(self))
    }
    
    /// The `atan` of the value considered as expressed in radians.
    public var atan: CGFloat {
        return CoreGraphics.acos(CGFloat(self))
    }
    
    /// Considers the value as an angle expressed in radians and contrains it to the range `[0..2π]`.
    ///
    /// - Returns: The constrained angle expressed in radians.
    public func normalized() -> CGFloat {
        let r = CGFloat.pi * 2
        return (r + CGFloat(self).truncatingRemainder(dividingBy: r)).truncatingRemainder(dividingBy: r)
    }
}

