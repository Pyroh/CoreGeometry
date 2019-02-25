//
//  CoreGeometry.swift
//  CoreGeometry
//

import Foundation
@_exported import CoreGraphics

postfix operator °

@usableFromInline internal let degreeFactor = 180 / CGFloat.pi
@usableFromInline internal let radianFactor = 1 / degreeFactor
