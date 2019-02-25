//
//  IntegerLiteralType.swift
//  CoreGeometry
//

import Foundation

extension IntegerLiteralType: ExpressibleInDegree {
    /// Considers a value as an angle expressed in degrees and returns the corresponding angle in radians.
    ///
    /// - note: _x_`°` is equivalent to _x_`.degree`.
    /// - Parameter lhs: The angle value expressed in degrees.
    /// - Returns: The angle value expressed in radians.
    @inlinable
    public static postfix func ° (lhs: Int) -> CGFloat {
        return lhs.radian
    }
}
