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
import simd

// MARK: Initializers
public extension CGRect {
    /// Creates a rectangle with the specified size.
    @inlinable init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the specified center and size.
    @inlinable init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(simd2: center.simd2 - (size.simd2 / 2))
        self.init(origin: origin, size: size)
    }

    @available(*, deprecated)
    @inlinable init(ratio: Ratio, maxSize: CGFloat) {
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
    
    @available(*, deprecated)
    @inlinable init(center: CGPoint, ratio: Ratio, maxSize: CGFloat) {
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
    
    @inlinable init(square edge: CGFloat) {
        self.init(origin: .zero, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryInteger>(square edge: T) {
        self.init(origin: .zero, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(square edge: T) {
        self.init(origin: .zero, size: .init(square: edge))
    }
    
    @inlinable init(origin: CGPoint, square edge: CGFloat) {
        self.init(origin: origin, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryInteger>(origin: CGPoint, square edge: T) {
        self.init(origin: origin, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(origin: CGPoint, square edge: T) {
        self.init(origin: origin, size: .init(square: edge))
    }
    
    @inlinable init(center: CGPoint, square edge: CGFloat) {
        self.init(center: center, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryInteger>(center: CGPoint, square edge: T) {
        self.init(center: center, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(center: CGPoint, square edge: T) {
        self.init(center: center, size: .init(square: edge))
    }
    
    @inlinable init<T: BinaryInteger>(_ x: T, _ y: T, _ width: T, _ height: T) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(_ x: T, _ y: T, _ width: T, _ height: T) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
    }
    
    @inlinable init<T: BinaryInteger>(_ width: T, _ height: T) {
        self.init(size: .init(width, height))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(_ width: T, _ height: T) {
        self.init(size: .init(width, height))
    }
    
    /// Creates the greatest absolute rectangle possible with `p1` and `p2` as opposite corners.
    /// - Parameters:
    ///   - p1: A corner of the rectangle.
    ///   - p2: The opposite corner.
    @inlinable init(p1: CGPoint, p2: CGPoint) {
        let x = min(p1.x, p2.x)
        let y = min(p1.y, p2.y)
        let width = max(p1.x, p2.x) - x
        let height = max(p1.y, p2.y) - y
        
        self = .init(x, y, width, height)
    }
    
    @inlinable init(origin p1: CGPoint, opposite p2: CGPoint) {
        let size = CGSize(simd2: p2.simd2 - p1.simd2)
        self.init(origin: p1, size: size)
    }
}

public extension CGRect {
    @inlinable init(aspectRatio: CGFloat, maxEdge: CGFloat) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge))
    }
    
    @inlinable init<T: BinaryInteger>(aspectRatio: CGFloat, maxEdge: T) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(aspectRatio: CGFloat, maxEdge: T) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(aspectRatio: A, maxEdge: E) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(aspectRatio: A, maxEdge: E) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init(origin: CGPoint, aspectRatio: CGFloat, maxEdge: CGFloat) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge))
    }
    
    @inlinable init<T: BinaryInteger>(origin: CGPoint, aspectRatio: CGFloat, maxEdge: T) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(origin: CGPoint, aspectRatio: CGFloat, maxEdge: T) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(origin: CGPoint, aspectRatio: A, maxEdge: E) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(origin: CGPoint, aspectRatio: A, maxEdge: E) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init(center: CGPoint, aspectRatio: CGFloat, maxEdge: CGFloat) {
        let size = CGSize(aspectRatio: aspectRatio, maxEdge: maxEdge)
        let origin = CGPoint(simd2: center.simd2 - (size.simd2 / 2))
        
        self.init(origin: origin, size: size)
    }
    
    @inlinable init<T: BinaryInteger>(center: CGPoint, aspectRatio: CGFloat, maxEdge: T) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(center: CGPoint, aspectRatio: CGFloat, maxEdge: T) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(center: CGPoint, aspectRatio: A, maxEdge: E) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(center: CGPoint, aspectRatio: A, maxEdge: E) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, maxEdge: maxEdge.cgFloat))
    }
}

public extension CGRect {
    @inlinable init(aspectRatio: CGFloat, minEdge: CGFloat) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, minEdge: minEdge))
    }
    
    @inlinable init<T: BinaryInteger>(aspectRatio: CGFloat, minEdge: T) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(aspectRatio: CGFloat, minEdge: T) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(aspectRatio: A, minEdge: E) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(aspectRatio: A, minEdge: E) {
        self.init(origin: .zero, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init(origin: CGPoint, aspectRatio: CGFloat, minEdge: CGFloat) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, minEdge: minEdge))
    }
    
    @inlinable init<T: BinaryInteger>(origin: CGPoint, aspectRatio: CGFloat, minEdge: T) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(origin: CGPoint, aspectRatio: CGFloat, minEdge: T) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(origin: CGPoint, aspectRatio: A, minEdge: E) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(origin: CGPoint, aspectRatio: A, minEdge: E) {
        self.init(origin: origin, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init(center: CGPoint, aspectRatio: CGFloat, minEdge: CGFloat) {
        let size = CGSize(aspectRatio: aspectRatio, minEdge: minEdge)
        let origin = CGPoint(simd2: center.simd2 - (size.simd2 / 2))
        
        self.init(origin: origin, size: size)
    }
    
    @inlinable init<T: BinaryInteger>(center: CGPoint, aspectRatio: CGFloat, minEdge: T) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<T: BinaryFloatingPoint>(center: CGPoint, aspectRatio: CGFloat, minEdge: T) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryInteger>(center: CGPoint, aspectRatio: A, minEdge: E) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
    
    @inlinable init<A: BinaryFloatingPoint, E: BinaryFloatingPoint>(center: CGPoint, aspectRatio: A, minEdge: E) {
        self.init(center: center, size: .init(aspectRatio: aspectRatio, minEdge: minEdge.cgFloat))
    }
}

public extension CGRect {
    /// The receiver's SIMD representation.
    @inlinable var simd4: SIMD4<CGFloat.NativeType> {
        get { .init(origin.x.native, origin.y.native, size.width.native, size.height.native) }
        set { (origin.simd2, size.simd2) = (newValue.lowHalf, newValue.highHalf) }
    }
    
    @inlinable init(simd4: SIMD4<CGFloat.NativeType>) {
        self.init(x: simd4.x, y: simd4.y, width: simd4.z, height: simd4.w)
    }
}

// MARK: -
// MARK: Corners
public extension CGRect {
    
    /// A point representing the rectangle's center.
    @inlinable var center: CGPoint {
        get { .init(x: midX, y: midY) }
        set { origin.simd2 = newValue.simd2 - (size.simd2 / 2) }
    }
    
    @inlinable subscript(xBound: RectBoundary = .mid, yBound: RectBoundary = .mid) -> CGPoint {
        get {
            let x, y: CGFloat
            
            switch xBound {
            case .min: x = minX
            case .mid: x = midX
            case .max: x = maxX
            }
            
            switch yBound {
            case .min: y = minY
            case .mid: y = midY
            case .max: y = maxY
            }
            
            return .init(x: x, y: y)
        }
        set {
            origin.simd2 += newValue.simd2 - self[xBound, yBound].simd2
        }
    }
}

// MARK: -
// MARK: Geometry
public extension CGRect {
    
    /// The biggest square rectangle that `self` can contain.
    @inlinable var maxSquare: CGRect {
        let maxEdge = max(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: maxEdge, height: maxEdge))
    }
    
    /// The smallest square rectangle that can contain `self`.
    @inlinable var minSquare: CGRect {
        let minEdge = min(self.width, self.height)
        return CGRect(origin: .zero, size: .init(width: minEdge, height: minEdge))
    }
    
    /// The ratio of `self`.
    @inlinable var ratio: CGFloat {
        return width / height
    }
    
    
    /// The diagonal of `self`.
    @inlinable var diagonal: CGFloat {
        length(size.simd2).cgFloat
    }
    
    /// The orientation of `self`.
    @inlinable var orientation: Orientation {
        switch ratio {
        case let x where x < 1.0: return .portrait
        case let x where x > 1.0: return .landscape
        default: return .square
        }
    }
    
    /// The area of `self`.
    @inlinable var area: CGFloat { size.area }
    
    /// The width, halved.
    @inlinable var halfWidth: CGFloat { size.halfWidth }
    
    /// The height, halved.
    @inlinable var halfHeight: CGFloat { size.halfHeight }
}

// MARK: -
// MARK: Center
public extension CGRect {

    /// Returns a copy of `self` centered relative to the given rectangle.
    @inlinable func centered(in rect: CGRect) -> CGRect {
        guard !isEmpty && !isInfinite else { return self }
        return CGRect(center: rect.center, size: size)
    }

    /// Centers `self` relative to the given rect.
    @inlinable mutating func center(in rect: CGRect) {
        center = rect.center
    }

    /// Returns a copy of `self` centered to the given point.
    @inlinable func centered(at point: CGPoint) -> CGRect {
        .init(center: point, size: size)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable func centered<I: BinaryInteger>(atX x: I, y: I) -> CGRect {
        .init(center: .init(x, y), size: size)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable func centered<F: BinaryFloatingPoint>(atX x: F, y: F) -> CGRect {
        .init(center: .init(x, y), size: size)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    func centered(atX x: CGFloat, y: CGFloat) -> CGRect {
        .init(center: .init(x, y), size: size)
    }
    
    /// Centers `self` relative to the given point.
    @inlinable mutating func center(at point: CGPoint) {
        center = point
    }

    /// Centers `self` at `(x,y)`
    @inlinable mutating func center<I: BinaryInteger>(atX x: I, y: I) {
        center = .init(x, y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable mutating func center<F: BinaryFloatingPoint>(atX x: F, y: F) {
        center = .init(x, y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable mutating func center(atX x: CGFloat, y: CGFloat) {
        center = .init(x, y)
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
    @inlinable func aligned(relativeTo rect: CGRect, xAxis: AxisAlignment, yAxis: AxisAlignment) -> CGRect {
        var origin = origin
        
        switch xAxis {
        case .none: break
        case .min: origin.x += rect.minX - minX
        case .mid: origin.x += rect.midX - midX
        case .max: origin.x += rect.maxX - maxX
        }
        
        switch yAxis {
        case .none: break
        case .min: origin.y += rect.minY - minY
        case .mid: origin.y += rect.midY - midY
        case .max: origin.y += rect.maxY - maxY
        }
        
        return .init(origin: origin, size: size)
    }
    
    /// Aligns `self` relative to the given rect following x and y axis contraints.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - xAxis: The x axis' constraint.
    ///   - yAxis: The y axis' constraint.
    @inlinable mutating func align(relativeTo rect: CGRect, xAxis: AxisAlignment, yAxis: AxisAlignment) {
        switch xAxis {
        case .none: break
        case .min: origin.x += rect.minX - minX
        case .mid: origin.x += rect.midX - midX
        case .max: origin.x += rect.maxX - maxX
        }
        
        switch yAxis {
        case .none: break
        case .min: origin.y += rect.minY - minY
        case .mid: origin.y += rect.midY - midY
        case .max: origin.y += rect.maxY - maxY
        }
    }
    
    /// Returns a copy of `self` with `origin` equals to `CGPointZero`.
    @inlinable func reseted() -> CGRect {
        CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    /// Makes `self`'s origin equal to `CGPointZero`.
    @inlinable mutating func reset() {
        origin = .zero
    }
}

// MARK: -
// MARK: Transform
public extension CGRect {
    
    /// Returns a copy of `self` translated by the given vector.
    @inlinable func translated(by vector: CGVector) -> CGRect {
        .init(origin: .init(simd2: origin.simd2 + vector.simd2), size: size)
    }
    
    /// Returns a copy of `self` translated by the given vector.
    @inlinable func translated(along vector: CGVector) -> CGRect {
        .init(origin: .init(simd2: origin.simd2 + vector.simd2), size: size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable func translated<I: BinaryInteger>(byTx tx: I, ty: I) -> CGRect {
        .init(origin: .init(simd2: origin.simd2 + .init(tx.native, ty.native)), size: size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable func translated<F: BinaryFloatingPoint>(byTx tx: F, ty: F) -> CGRect {
        .init(origin: .init(simd2: origin.simd2 + .init(tx.native, ty.native)), size: size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable func translated(byTx tx: CGFloat.NativeType, ty: CGFloat.NativeType) -> CGRect {
        .init(origin: .init(simd2: origin.simd2 + .init(tx, ty)), size: size)
    }

    /// Translate `self` along the given vector.
    @inlinable mutating func translate(along vector: CGVector) {
        origin.simd2 += vector.simd2
    }

    /// Translate `self` by `(tx,ty)`.
    @inlinable mutating func translate<I: BinaryInteger>(tx: I, ty: I) {
        origin.simd2 += .init(tx.native, ty.native)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable mutating func translate<F: BinaryFloatingPoint>(tx: F, ty: F) {
        origin.simd2 += .init(tx.native, ty.native)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable mutating func translate(tx: CGFloat.NativeType, ty: CGFloat.NativeType) {
        origin.simd2 += .init(tx, ty)
    }
    
    /// Returns a copy of `self` rotated around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on macOS.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable func rotated(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        var transform = CGAffineTransform(translationX: center.x, y: center.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        return applying(transform)
    }
    
    /// Rotates `self` around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on macOS.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
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
    @inlinable mutating func inset(_ edges: RectangleEdge, by amount: CGFloat) {
        guard !edges.isEmpty else { return }
        
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
    }
    
    /// Insets `self` in the given edge directions by the given amount.
    /// - Parameter size: The inset amount.
    @inlinable mutating func inset(by size: CGSize) {
        guard size != .zero else { return }
        
        self.origin.simd2 += size.simd2
        self.size.simd2 -= size.simd2 * 2
    }
    
    /// Return a copy of `self` inset in the given edge directions by the given amount.
    ///
    /// - Parameters:
    ///   - edges: The edges to inset from.
    ///   - amount: The inset amount.
    @inlinable func insetting(_ edges: RectangleEdge, by amount: CGFloat) -> CGRect {
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
    
    @inlinable func insetting(by size: CGSize) -> CGRect {
        guard size != .zero else { return self }
        
        return withMutable(self) {
            $0.origin.simd2 += size.simd2
            $0.size.simd2 -= size.simd2 * 2
        }
    }
}

// MARK: -
// MARK: Functional modifiers

public extension CGRect {
    
    /// The rectangle's origin's x position.
    @inlinable var x: CGFloat { origin.x }
    
    /// The rectangle's origin's y position.
    @inlinable var y: CGFloat { origin.y }
    
    /// Returns a copy of `self` with the given origin.
    /// - Parameter origin: The new origin.
    @inlinable func with(origin: CGPoint) -> CGRect {
        .init(origin: origin, size: size)
    }
    
    /// Returns a copy of `self` with the given size.
    /// - Parameter origin: The new size.
    @inlinable func with(size: CGSize) -> CGRect {
        .init(origin: origin, size: size)
    }
    
    /// Returns a copy of `self` with the given x position.
    /// - Parameter origin: The new x position.
    @inlinable func with(x: CGFloat) -> CGRect {
        .init(origin: .init(x, y), size: size)
    }
    
    /// Returns a copy of `self` with the given x position.
    /// - Parameter origin: The new x position.
    @inlinable func with<I: BinaryInteger>(x: I) -> CGRect {
        .init(origin: .init(x.cgFloat, y), size: size)
    }
    
    /// Returns a copy of `self` with the given x position.
    /// - Parameter origin: The new x position.
    @inlinable func with<F: BinaryFloatingPoint>(x: F) -> CGRect {
        .init(origin: .init(x.cgFloat, y), size: size)
    }
    
    /// Returns a copy of `self` with the given y position.
    /// - Parameter origin: The new y position.
    @inlinable func with(y: CGFloat) -> CGRect {
        .init(origin: .init(x, y), size: size)
    }
    
    /// Returns a copy of `self` with the given y position.
    /// - Parameter origin: The new y position.
    @inlinable func with<I: BinaryInteger>(y: I) -> CGRect {
        .init(origin: .init(x, y.cgFloat), size: size)
    }
    
    /// Returns a copy of `self` with the given y position.
    /// - Parameter origin: The new y position.
    @inlinable func with<F: BinaryFloatingPoint>(y: F) -> CGRect {
        .init(origin: .init(x, y.cgFloat), size: size)
    }
    
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with(width: CGFloat) -> CGRect {
        .init(origin: origin, size: .init(width, height))
    }
    
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with<I: BinaryInteger>(width: I) -> CGRect {
        .init(origin: origin, size: .init(width.cgFloat, height))
    }
    
    /// Returns a copy of `self` with the given width.
    /// - Parameter origin: The new width.
    @inlinable func with<F: BinaryFloatingPoint>(width: F) -> CGRect {
        .init(origin: origin, size: .init(width.cgFloat, height))
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with(height: CGFloat) -> CGRect {
        .init(origin: origin, size: .init(width, height))
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with<I: BinaryInteger>(height: I) -> CGRect {
        .init(origin: origin, size: .init(width, height.cgFloat))
    }
    
    /// Returns a copy of `self` with the given height.
    /// - Parameter origin: The new height.
    @inlinable func with<F: BinaryFloatingPoint>(height: F) -> CGRect {
        .init(origin: origin, size: .init(width, height.cgFloat))
    }
}

public extension CGRect {
    @available(*, deprecated, renamed: "transformingOrigin")
    @inlinable func transformOrigin(_ transform: (CGPoint) throws -> CGPoint) rethrows -> CGRect {
        with(origin: try transform(origin))
    }
    
    @available(*, deprecated, renamed: "transformingX")
    @inlinable func transformX(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(x: try transform(x))
    }
    
    @available(*, deprecated, renamed: "transformingY")
    @inlinable func transformY(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(y: try transform(y))
    }
    
    @available(*, deprecated, renamed: "transformingSize")
    @inlinable func transformSize(_ transform: (CGSize) throws -> CGSize) rethrows -> CGRect {
        with(size: try transform(size))
    }
    
    @available(*, deprecated, renamed: "transformingWidth")
    @inlinable func transformWidth(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(width: try transform(width))
    }
    
    @available(*, deprecated, renamed: "transformingHeight")
    @inlinable func transformHeight(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(height: try transform(height))
    }
    
    @inlinable func transformingOrigin(_ transform: (CGPoint) throws -> CGPoint) rethrows -> CGRect {
        with(origin: try transform(origin))
    }
    
    @inlinable func transformingX(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(x: try transform(x))
    }
    
    @inlinable func transformingY(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(y: try transform(y))
    }
    
    @inlinable func transformingSize(_ transform: (CGSize) throws -> CGSize) rethrows -> CGRect {
        with(size: try transform(size))
    }
    
    @inlinable func transformingWidth(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(width: try transform(width))
    }
    
    @inlinable func transformingHeight(_ transform: (CGFloat) throws -> CGFloat) rethrows -> CGRect {
        with(height: try transform(height))
    }
}

public extension CGRect {
    @inlinable func map<T>(_ transform: (CGRect) throws -> T) rethrows -> T {
        try transform(self)
    }
    
    @inlinable func transformed(using transform: (inout CGRect) throws -> ()) rethrows -> CGRect {
        var resultRect = self
        try transform(&resultRect)
        
        return resultRect
    }
}

public extension CGRect {
    @inlinable static func <(_ lhs: CGPoint, _ rhs: CGRect) -> (x: Bool, y: Bool) {
        let lhs2 = lhs.simd2
        let rhs2 = rhs.origin.simd2
        
        return (lhs2.x < rhs2.x, lhs2.y < rhs2.y)
    }
    
    @inlinable static func <=(_ lhs: CGPoint, _ rhs: CGRect) -> (x: Bool, y: Bool) {
        let lhs2 = lhs.simd2
        let rhs2 = rhs.origin.simd2
        
        return (lhs2.x <= rhs2.x, lhs2.y <= rhs2.y)
    }
    
    @inlinable static func >(_ lhs: CGPoint, _ rhs: CGRect) -> (x: Bool, y: Bool) {
        let lhs2 = lhs.simd2
        let rhs2 = rhs.origin.simd2 + rhs.size.simd2
        
        return (lhs2.x > rhs2.x, lhs2.y > rhs2.y)
    }
    
    @inlinable static func >=(_ lhs: CGPoint, _ rhs: CGRect) -> (x: Bool, y: Bool) {
        let lhs2 = lhs.simd2
        let rhs2 = rhs.origin.simd2 + rhs.size.simd2
        
        return (lhs2.x >= rhs2.x, lhs2.y >= rhs2.y)
    }
}

public extension CGRect {
    @inlinable var integralWidth: Int { size.integralWidth }
    @inlinable var integralHeight: Int { size.integralHeight }
    
    @inlinable func integral(_ rule: FloatingPointRoundingRule) -> Self {
        .init(simd4: simd4.rounded(rule))
    }
}

public extension CGRect {
    @inlinable static func *(lhs: Self, rhs: SIMD2<CGFloat.NativeType>) -> Self {
        .init(simd4: .init(lowHalf: lhs.origin.simd2, highHalf: lhs.size.simd2 * rhs))
    }
    
    @inlinable static func *=(lhs: inout Self, rhs: SIMD2<CGFloat.NativeType>) {
        lhs = lhs * rhs
    }
    
    @inlinable static func /(lhs: Self, rhs: SIMD2<CGFloat.NativeType>) -> Self {
        .init(simd4: .init(lowHalf: lhs.origin.simd2, highHalf: lhs.size.simd2 / rhs))
    }
    
    @inlinable static func /=(lhs: inout Self, rhs: SIMD2<CGFloat.NativeType>) {
        lhs = lhs / rhs
    }
}
