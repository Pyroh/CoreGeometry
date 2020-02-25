//
//  CGRectExtension.swift
//  CoreGeometry
//
//  Copyright © 2019 Pyrolyse
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.center.formVector(with: self.origin))
        }
    }
    
    @inlinable
    subscript(xBound: RectBoundary, yBound: RectBoundary) -> CGPoint {
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
    /// The smallest square rectangle that can contain `self`.
    @inlinable
    var maxSquare: CGRect {
        let maxEdge = max(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: maxEdge, height: maxEdge))
    }
    
    /// The biggest square rectangle that `self` can contain.
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
    func centered(atX x: Int, y: Int) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    func centered(atX x: Double, y: Double) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
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
    mutating func center(atX x: Int, y: Int) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable
    mutating func center(atX x: Double, y: Double) {
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
    func aligned(relativeTo rect: CGRect, xAxis: Alignment, yAxis: Alignment) -> CGRect {
        let origin = self.origin
        let coord: [CGFloat] = [(a: xAxis, o: origin.x, lon: self.width, min: rect.minX, max: rect.maxX, mid: rect.midX),
                     (a: yAxis, o: origin.y, lon: self.height, min: rect.minY, max: rect.maxY, mid: rect.midY)].map {
            switch $0.a {
            case .center:
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
    mutating func align(relativeTo rect: CGRect, xAxis: Alignment, yAxis: Alignment) {
        self = self.aligned(relativeTo: rect, xAxis: xAxis, yAxis: yAxis)
    }
    
    /// Returns a copy of `self` with `origin` equals to `CGPointZero`.
    @inlinable
    func reseted() -> CGRect {
        return CGRect(x: 0, y: 0, width: self.width, height: self.height)
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
        return CGRect(origin: self.origin.translated(along: vector), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated(byTx tx: Int, ty: Int) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated(byTx tx: Double, ty: Double) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    func translated(byTx tx: CGFloat, ty: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }

    /// Translate `self` by the given vector.
    @inlinable
    mutating func translate(along vector: CGVector) {
        self = self.translated(by: vector)
    }

    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate(tx: Int, ty: Int) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate(tx: Double, ty: Double) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    mutating func translate(tx: CGFloat, ty: CGFloat) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
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
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
    
    /// Returns a copy of `self` rotated by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    func slided(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        return self.centered(at: self.center.rotated(relativeTo: center, by: angle))
    }
    
    /// Rotates `self` by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    mutating func slide(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.slided(relativeTo: center, by: angle)
    }
}

// MARK: -
// MARK: Offset & Inset
public extension CGRect {
    
    /// Offsets `self` in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to offset from.
    ///   - amount: The offset amount.
    @available(*, deprecated, renamed: "offset")
    @inlinable
    mutating func offsetEdge(_ edge: CGRectEdge, by amount: CGFloat) {
        self = self.offsettingEdge(edge, by: amount)
    }
    
    /// Offsets `self` in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to offset from.
    ///   - amount: The offset amount.
    @available(*, deprecated, renamed: "offset")
    @inlinable
    mutating func offsetEdges(_ edges: [CGRectEdge], by amount: CGFloat) {
        self = self.offsettingEdges(edges, by: amount)
    }
    
    /// Offsets `self` in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to offset from.
    ///   - amount: The offset amount.
    @inlinable
    mutating func offset(_ edges: RectangleEdge, by amount: CGFloat) {
        self = self.insetting(edges, by: -amount)
    }
    
    /// Return a copy of `self` offset in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to offset from.
    ///   - amount: The offset amount.
    @available(*, deprecated, renamed: "offsetting")
    @inlinable
    func offsettingEdge(_ edge: CGRectEdge, by amount: CGFloat) -> CGRect {
        switch edge {
        case .minXEdge:
            return CGRect(origin: .init(x: self.minX - amount, y: self.minY), size: .init(width: self.width + amount, height: self.height))
        case .maxXEdge:
            return CGRect(origin: self.origin, size: .init(width: self.width + amount, height: self.height))
        case .minYEdge:
            return CGRect(origin: .init(x: self.minX, y: self.minY - amount), size: .init(width: self.width, height: self.height + amount))
        case .maxYEdge:
            return CGRect(origin: self.origin, size: .init(width: self.width, height: self.height + amount))
        }
    }
    
    /// Return a copy of `self` offset in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to offset from.
    ///   - amount: The offset amount.
    @available(*, deprecated, renamed: "offsetting")
    @inlinable
    func offsettingEdges(_ edges: [CGRectEdge], by amount: CGFloat) -> CGRect {
        guard edges.count > 0 else { return self }
        return edges.reduce(self) { return $0.offsettingEdge($1, by: amount) }
    }
    
    /// Return a copy of `self` offset in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to offset from.
    ///   - amount: The offset amount.
    @inlinable
    func offsetting(_ edges: RectangleEdge, by amount: CGFloat) -> CGRect {
        self.insetting(edges, by: -amount)
    }
    
    /// Insets `self` in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to inset from.
    ///   - amount: The inset amount.
    @available(*, deprecated, renamed: "inset")
    @inlinable
    mutating func insetEdge(_ edge: CGRectEdge, by amount: CGFloat) {
        self = self.insettingEdge(edge, by: amount)
    }
    
    /// Insets `self` in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @available(*, deprecated, renamed: "inset")
    @inlinable
    mutating func insetEdges(_ edges: [CGRectEdge], by amount: CGFloat) {
        self = self.insettingEdges(edges, by: amount)
    }
    
    /// Insets `self` in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @inlinable
    mutating func inset(_ edges: RectangleEdge, by amount: CGFloat) {
        self = self.insetting(edges, by: amount)
    }
    
    /// Return a copy of `self` inset in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to inset from.
    ///   - amount: The inset amount.
    @available(*, deprecated, renamed: "insetting")
    @inlinable
    func insettingEdge(_ edge: CGRectEdge, by amount: CGFloat) -> CGRect {
        switch edge {
        case .minXEdge:
            return CGRect(origin: .init(x: self.minX + amount, y: self.minY), size: .init(width: self.width - amount, height: self.height))
        case .maxXEdge:
            return CGRect(origin: self.origin, size: .init(width: self.width - amount, height: self.height))
        case .minYEdge:
            return CGRect(origin: .init(x: self.minX, y: self.minY + amount), size: .init(width: self.width, height: self.height - amount))
        case .maxYEdge:
            return CGRect(origin: self.origin, size: .init(width: self.width, height: self.height - amount))
        }
    }
    
    /// Return a copy of `self` inset in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @available(*, deprecated, renamed: "insetting")
    @inlinable
    func insettingEdges(_ edges: [CGRectEdge], by amount: CGFloat) -> CGRect {
        guard edges.count > 0 else { return self }
        return edges.reduce(self) { return $0.insettingEdge($1, by: amount) }
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
