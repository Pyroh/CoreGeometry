//
//  ExpressibleInDegreeProtocol.swift
//  CoreGeometry
//
import CoreGraphics

public protocol ExpressibleInDegree {
    postfix static func °(lhs: Self) -> CGFloat
}

