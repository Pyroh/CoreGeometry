//
//  Edges.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 24/02/2019.
//

import Foundation


/// Represents an axis alignment constraint.
///
/// - none: No constraint.
/// - center: Center constraint.
/// - max: Max axis' value constraint.
/// - min: Min axis' value constraint.
public enum Alignment {
    case none
    case center
    case max
    case min
}
