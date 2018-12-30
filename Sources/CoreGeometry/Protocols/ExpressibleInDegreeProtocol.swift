//
//  ExpressibleInDegreeProtocol.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 03/10/2018.
//
import CoreGraphics

public protocol ExpressibleInDegree {
    postfix static func °(lhs: Self) -> CGFloat
}

