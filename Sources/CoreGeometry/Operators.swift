//
//  Operators.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 07/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//
import Foundation

postfix operator °


/// Considers a value as an angle expressed in degrees and returns the corresponding angle in radians.
///
/// - note: _x_`º` is equivalent to _x_`.degree`.
/// - Parameter lhs: The angle value expressed in degrees.
/// - Returns: The angle value expressed in radians.
public postfix func °<T: BinaryInteger>(lhs: T) -> CGFloat {
    return lhs.radian
}

/// Considers a value as an angle expressed in degrees and returns the corresponding angle in radians.
///
/// - note: _x_`º` is equivalent to _x_`.degree`.
/// - Parameter lhs: The angle value expressed in degrees.
/// - Returns: The angle value expressed in radians.
public postfix func °<T: BinaryFloatingPoint>(lhs: T) -> CGFloat {
    return lhs.radian
}
