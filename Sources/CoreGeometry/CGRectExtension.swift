//
//  CGRectExtension.swift
//  CoreGeometry
//
//  Created by Pierre TACCHI on 30/03/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    enum Orientation {
        case square
        case landscape
        case portrait
    }
    
    /// A point representing the rectangle's center.
    @inlinable
    public var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.center.formVector(with: self.origin))
        }
    }
    
    /// A point representing the corner located at the smallest value of the x-coordinate and the smallest value of the y-coordinate of the rectangle.
    @inlinable
    public var minXminYCorner: CGPoint {
        get {
            return CGPoint(x: self.minX, y: self.minY)
        }
        set {
            self.origin = newValue.translated(along: self.minXminYCorner.formVector(with: self.origin))
        }
    }
    
    /// A point representing the corner located at the smallest value of the x-coordinate and the largest value of the y-coordinate of the rectangle.
    @inlinable
    public var minXmaxYCorner: CGPoint {
        get {
            return CGPoint(x: self.minX, y: self.maxY)
        }
        set {
            self.origin = newValue.translated(along: self.minXmaxYCorner.formVector(with: self.origin))
        }
    }
    
    /// A point representing the corner located at the largest value of the x-coordinate and the smallest value of the y-coordinate of the rectangle.
    @inlinable
    public var maxXminYCorner: CGPoint {
        get {
            return CGPoint(x: self.maxX, y: self.minY)
        }
        set {
            self.origin = newValue.translated(along: self.maxXminYCorner.formVector(with: self.origin))
        }
    }
    
    /// A point representing the corner located at the largest value of the x-coordinate and the largest value of the y-coordinate of the rectangle.
    @inlinable
    public var maxXmaxYCorner: CGPoint {
        get {
            return CGPoint(x: self.maxX, y: self.maxY)
        }
        set {
            self.origin = newValue.translated(along: self.maxXmaxYCorner.formVector(with: self.origin))
        }
    }
    
    /// A point representing the center of the edge located at the smallest value of the x-coordinate and the of the rectangle.
    @inlinable
    public var minXEdgeCenter: CGPoint {
        get {
            return CGPoint(x: self.minX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.minXEdgeCenter.formVector(with: self.origin))
        }
    }
    
    /// A point representing the center of the edge located at the smallest value of the x-coordinate and the of the rectangle.
    @inlinable
    public var maxXEdgeCenter: CGPoint {
        get {
            return CGPoint(x: self.maxX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.maxXEdgeCenter.formVector(with: self.origin))
        }
    }
    
    /// A point representing the center of the edge located at the smallest value of the y-coordinate and the of the rectangle.
    @inlinable
    public var minYEdgeCenter: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.minY)
        }
        set {
            self.origin = newValue.translated(along: self.minYEdgeCenter.formVector(with: self.origin))
        }
    }
    
    /// A point representing the center of the edge located at the largest value of the y-coordinate and the of the rectangle.
    @inlinable
    public var maxYEdgeCenter: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.maxY)
        }
        set {
            self.origin = newValue.translated(along: self.maxYEdgeCenter.formVector(with: self.origin))
        }
    }
    
    /// The smallest square rectangle that can contain `self`.
    @inlinable
    public var maxSquare: CGRect {
        let maxEdge = max(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: maxEdge, height: maxEdge))
    }
    
    /// The biggest square rectangle that `self` can contain.
    @inlinable
    public var minSquare: CGRect {
        let minEdge = min(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: minEdge, height: minEdge))
    }
    
    /// The ratio of `self`.
    @inlinable
    public var ratio: CGFloat {
        return self.width / self.height
    }
    
    /// The orientation of `self`.
    public var orientation: Orientation {
        switch self.ratio {
        case let x where x < 1.0:
            return .portrait
        case let x where x > 1.0:
            return .landscape
        default:
            return .square
        }
    }
    
    /// Creates a rectangle with the specified center and size.
    public init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: .zero, size: size)
        self = r.centered(at: center)
    }

    /// Returns a copy of `self` centered relative to the given rectangle.
    public func centered(in rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    /// Centers `self` relative to the given rect.
    public mutating func center(in rect: CGRect) {
        self = self.centered(in: rect)
    }

    /// Returns a copy of `self` centered to the given point.
    public func centered(at point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    /// Returns a copy of `self` centered at `(x,y)`.
    public func centered<T: BinaryInteger>(atX x: T, y: T) -> CGRect {
        let center = CGPoint(x: Int(x), y: Int(y))
        return self.centered(at: center)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    public func centered<T: BinaryFloatingPoint>(atX x: T, y: T) -> CGRect {
        let center = CGPoint(x: CGFloat(x), y: CGFloat(y))
        return self.centered(at: center)
    }
    
    /// Centers `self` relative to the given point.
    public mutating func center(to point: CGPoint) {
        self = self.centered(at: point)
    }

    /// Centers `self` at `(x,y)`
    public mutating func center<T: BinaryInteger>(x: T, y: T) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    public mutating func center<T: BinaryFloatingPoint>(x: T, y: T) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Returns a copy of `self` with `origin` equals to `CGPointZero`.
    public func reseted() -> CGRect {
        return CGRect(x: 0, y: 0, width: self.width, height: self.height)
    }
    
    /// Makes `self`'s origin equal to `CGPointZero`.
    public mutating func reset() {
        self.origin = CGPoint(x: 0, y: 0)
    }

    /// Returns a copy of `self` translated by the given vector.
    public func translated(by vector: CGVector) -> CGRect {
        return CGRect(origin: self.origin.translated(along: vector), size: self.size)
    }

    /// Returns a copy of `self` translated by `(tx,ty)`.
    public func translated<T: BinaryInteger>(byTx tx: T, ty: T) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    public func translated<T: BinaryFloatingPoint>(byTx tx: T, ty: T) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }

    /// Translate `self` by the given vector.
    public mutating func translate(along vector: CGVector) {
        self = self.translated(by: vector)
    }

    /// Translate `self` by `(tx,ty)`.
    public mutating func translate<T: BinaryInteger>(tx: T, ty: T) {
        self = self.translated(byTx: tx, ty: ty)
    }

    /// Translate `self` by `(tx,ty)`.
    public mutating func translate<T: BinaryFloatingPoint>(tx: T, ty: T) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    public func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return self.applying(transform)
    }
    
    /// Rotates `self` around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    public mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
    
    /// Returns a copy of `self` rotated by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    public func slided(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        return self.centered(at: self.center.rotated(relativeTo: center, by: angle))
    }
    
    /// Rotates `self` by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    public mutating func slide(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.slided(relativeTo: center, by: angle)
    }
}
