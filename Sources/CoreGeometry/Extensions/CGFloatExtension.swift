//
//  CGFloatExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 03/10/2018.
//

import Foundation

extension CGFloat: ExpressibleInDegree {
    /// Considers a value as an angle expressed in degrees and returns the corresponding angle in radians.
    ///
    /// - note: _x_`º` is equivalent to _x_`.degree`.
    /// - Parameter lhs: The angle value expressed in degrees.
    /// - Returns: The angle value expressed in radians.
    @inlinable
    public static postfix func ° (lhs: CGFloat) -> CGFloat {
        return lhs.degree
    }
}
