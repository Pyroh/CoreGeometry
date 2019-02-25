//
//  BinaryIntegerExtension.swift
//  CoreGeometry
//

import Foundation

extension BinaryInteger {
    /// The numerical value considered as expressed in radians converted in degrees.
    @inlinable
    public var degree: CGFloat {
        return CGFloat(self) * degreeFactor
    }
    
    /// The numerical value considered as expressed in degrees converted in radians.
    @inlinable
    public var radian: CGFloat {
        return CGFloat(self) * radianFactor
    }
}
