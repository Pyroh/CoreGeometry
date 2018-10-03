//
//  CoreGeometry.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 03/10/2018.
//

import Foundation

postfix operator °

@usableFromInline internal let degreeFactor = 180 / CGFloat.pi
@usableFromInline internal let radianFactor = 1 / degreeFactor
