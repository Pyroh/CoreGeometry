//
//  CGRectExtension.swift
//
//  CoreGeometry
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import CoreGraphics

// MARK: Initializers
public extension CGRect {
    /// Creates a rectangle with the specified size.
    init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the specified center and size.
    init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: .zero, size: size)
        self = r.centered(at: center)
    }

    init(ratio: Ratio, maxSize: CGFloat) {
        let width: CGFloat, height: CGFloat
        switch ratio.orientation {
        case .landscape:
            width = maxSize
            height = maxSize / ratio.factor
        case .portrait:
            width = maxSize * ratio.factor
            height = maxSize
        case .square:
            width = maxSize
            height = maxSize
        }
        
        self.init(size: .init(width: width, height: height))
    }
    
    init(center: CGPoint, ratio: Ratio, maxSize: CGFloat) {
        let width: CGFloat, height: CGFloat
        switch ratio.orientation {
        case .landscape:
            width = maxSize
            height = maxSize / ratio.factor
        case .portrait:
            width = maxSize * ratio.factor
            height = maxSize
        case .square:
            width = maxSize
            height = maxSize
        }
        
        self.init(center: center, size: .init(width: width, height: height))
    }
}

// MARK: -
// MARK: Corners
public extension CGRect {
    
    /// A point representing the rectangle's center.
    @inlinable
    var center: CGPoint {
        get {
            CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.center.formVector(with: self.origin))
        }
    }
    
    @inlinable
    subscript(xBound: RectBoundary = .mid, yBound: RectBoundary = .mid) -> CGPoint {
        get {
            let x, y: CGFloat
            switch xBound {
            case .min:
                x = self.minX
            case .mid:
                x = self.midX
            case .max:
                x = self.maxX
            }
            switch yBound {
            case .min:
                y = self.minY
            case .mid:
                y = self.midY
            case .max:
                y = self.maxY
            }
            
            return .init(x: x, y: y)
        }
        set {
            self.origin = newValue.translated(along: self[xBound, yBound].formVector(with: self.origin))
        }
    }
}

// MARK: -
// MARK: Geometry
public extension CGRect {
    
    /// The biggest square rectangle that `self` can contain.
    @inlinable
    var maxSquare: CGRect {
        let maxEdge = max(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: maxEdge, height: maxEdge))
    }
    
    /// The smallest square rectangle that can contain `self`.
    @inlinable
    var minSquare: CGRect {
        let minEdge = min(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: minEdge, height: minEdge))
    }
    
    /// The ratio of `self`.
    @inlinable
    var ratio: CGFloat {
        return self.width / self.height
    }
    
    
    /// The diagonal of `self`.
    @inlinable
    var diagonal: CGFloat {
        return sqrt(pow(self.width, 2.0) + pow(self.height, 2.0))
    }
    
    /// The orientation of `self`.
    @inlinable
    var orientation: Orientation {
        switch self.width / self.height {
        case let x where x < 1.0:
            return .portrait
        case let x where x > 1.0:
            return .landscape
        default:
            return .square
        }
    }
}

// MARK: -
// MARK: Center
public extension CGRect {

    /// Returns a copy of `self` centered relative to the given rectangle.
    @inlinable
    func centered(in rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    /// Centers `self` relative to the given rect.
    @inlinable
    mutating func center(in rect: CGRect) {
        self = self.centered(in: rect)
    }

    /// Returns a copy of `self` centered to the given point.
    @inlinable
    func centered(at point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    func centered<I: BinaryInteger>(atX x: I, y: I) -> CGRect {
        self.centered(atX: CGFloat(x), y: CGFloat(y))
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    func centered<F: BinaryFloatingPoint>(atX x: F, y: F) -> CGRect {
        self.centered(atX: CGFloat(x), y: CGFloat(y))
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    func centered(atX x: CGFloat, y: CGFloat) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
    }
    
    /// Centers `self` relative to the given point.
    @inlinable
    mutating func center(at point: CGPoint) {
        self = self.centered(at: point)
    }

    /// Centers `self` at `(x,y)`
    @inlinable
    mutating func center<I: BinaryInteger>(atX x: I, y: I) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable
    mutating func center<F: BinaryFloatingPoint>(atX x: F, y: F) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable
    mutating func center(atX x: CGFloat, y: CGFloat) {
        self = self.centered(atX: x, y: y)
    }
}

// MARK: -
// MARK: Align
public extension CGRect {
    
    /// Return a copy of `self` aligned relative to the given rect following x and y axis contraints.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - xAxis: The x axis' constraint.
    ///   - yAxis: The y axis' constraint.
    /// - Returns: A properly aligned rect.
    @inlinable
    func aligned(relativeTo rect: CGRect, xAxis: AxisAlignment, yAxis: AxisAlignment) -> CGRect {
        let origin = self.origin
        let coord: [CGFloat] = [(a: xAxis, o: origin.x, lon: self.width, min: rect.minX, max: rect.maxX, mid: rect.midX),
                     (a: yAxis, o: origin.y, lon: self.height, min: rect.minY, max: rect.maxY, mid: rect.midY)].map {
            switch $0.a {
            case .mid:
                return $0.mid - $0.lon / 2
            case .min:
                return $0.min
            case .max:
                return $0.max - $0.lon
            case .none:
                return $0.o
            }
        }
        let newOrigin = CGPoint(x: coord[0], y: coord[1])
        
        return CGRect(origin: newOrigin, size: self.size)
    }
    
    /// Aligns `self` relative to the given rect following x and y axis contraints.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - xAxis: The x axis' constraint.
    ///   - yAxis: The y axis' constraint.
    @inlinable
    mutating func align(relativeTo rect: CGRect, xAxis: AxisAlignment, yAxis: AxisAlignment) {
        self = self.aligned(relativeTo: rect, xAxis: xAxis, yAxis: yAxis)
    }
    
    /// Returns a copy of `self` with `origin` equals to `CGPointZero`.
    @inlinable
    func reseted() -> CGRect {
        CGRect(x: 0, y: 0, width: self.width, height: self.height)
    }
    
    /// Makes `self`'s origin equal to `CGPointZero`.
    @inlinable
    mutating func reset() {
        self.origin = CGPoint(x: 0, y: 0)
    }
}

// MARK: -
// MARK: Transform
public extension CGRect {
    
    /// Returns a copy of `self` translated by the given vector.
    @inlinable
    func translated(by vector: CGVector) -> CGRect {
        CGRect(origin: self.origin.translated(along: vector), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated<I: BinaryInteger>(byTx tx: I, ty: I) -> CGRect {
        self.translated(byTx: CGFloat(tx), ty: CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated<F: BinaryFloatingPoint>(byTx tx: F, ty: F) -> CGRect {
        self.translated(byTx: CGFloat(tx), ty: CGFloat(ty))
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated(byTx tx: CGFloat, ty: CGFloat) -> CGRect {
        CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }

    /// Translate `self` by the given vector.
    @inlinable
    mutating func translate(along vector: CGVector) {
        self = self.translated(by: vector)
    }

    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate<I: BinaryInteger>(tx: I, ty: I) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate<F: BinaryFloatingPoint>(tx: F, ty: F) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate(tx: CGFloat, ty: CGFloat) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on macOS.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return self.applying(transform)
    }
    
    /// Rotates `self` around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on macOS.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
}

// MARK: -
// MARK: Inset
public extension CGRect {
    
    /// Insets `self` in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @inlinable
    mutating func inset(_ edges: RectangleEdge, by amount: CGFloat) {
        self = self.insetting(edges, by: amount)
    }
    
    /// Return a copy of `self` inset in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @inlinable
    func insetting(_ edges: RectangleEdge, by amount: CGFloat) -> CGRect {
        guard !edges.isEmpty else { return self }
        
        var origin = self.origin
        var size = self.size
        
        if edges.contains(.minXEdge) {
            origin.x += amount
            size.width -= amount
        }
        if edges.contains(.maxXEdge) {
            size.width -= amount
        }
        if edges.contains(.minYEdge) {
            origin.y += amount
            size.height -= amount
        }
        if edges.contains(.maxYEdge) {
            size.height -= amount
        }
        
        return .init(origin: origin, size: size)
    }
}
