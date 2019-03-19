//
//  CGRectExtension.swift
//  CoreGeometry
//

import CoreGraphics

// MARK: Initializers
public extension CGRect {
    /// Creates a rectangle with the specified size.
    public init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the specified center and size.
    public init(center: CGPoint, size: CGSize) {
        let r = CGRect(origin: .zero, size: size)
        self = r.centered(at: center)
    }

    public init(ratio: Ratio, maxSize: CGFloat) {
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
    
    public init(center: CGPoint, ratio: Ratio, maxSize: CGFloat) {
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
    public var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self.origin = newValue.translated(along: self.center.formVector(with: self.origin))
        }
    }
    
    /// A point representing the corner located at the smallest value of the x-coordinate and the smallest value of the y-coordinate of the rectangle.
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
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
    @available(*, deprecated, message: "This will be removed from CoreGeometry 3.0 use subscript instead.")
    @inlinable
    public var maxYEdgeCenter: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.maxY)
        }
        set {
            self.origin = newValue.translated(along: self.maxYEdgeCenter.formVector(with: self.origin))
        }
    }
    
    @inlinable
    public subscript(xBound: RectBoundary, yBound: RectBoundary) -> CGPoint {
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
    
    
    /// The diagonal of `self`.
    @inlinable
    public var diagonal: CGFloat {
        return sqrt(pow(self.width, 2.0) + pow(self.height, 2.0))
    }
    
    /// The orientation of `self`.
    @inlinable
    public var orientation: Orientation {
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
    public func centered(in rect: CGRect) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let rectCenter = rect.center
        let origin = CGPoint(x: rectCenter.x - self.width / 2.0, y: rectCenter.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }

    /// Centers `self` relative to the given rect.
    @inlinable
    public mutating func center(in rect: CGRect) {
        self = self.centered(in: rect)
    }

    /// Returns a copy of `self` centered to the given point.
    @inlinable
    public func centered(at point: CGPoint) -> CGRect {
        guard !self.isEmpty && !self.isInfinite else { return self }
        let origin = CGPoint(x: point.x - self.width / 2.0, y: point.y - self.height / 2.0)
        return CGRect(origin: origin, size: self.size)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    public func centered(atX x: Int, y: Int) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    public func centered(atX x: Double, y: Double) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
    }
    
    /// Returns a copy of `self` centered at `(x,y)`.
    @inlinable
    public func centered(atX x: CGFloat, y: CGFloat) -> CGRect {
        let center = CGPoint(x: x, y: y)
        return self.centered(at: center)
    }
    
    /// Centers `self` relative to the given point.
    @inlinable
    public mutating func center(to point: CGPoint) {
        self = self.centered(at: point)
    }

    /// Centers `self` at `(x,y)`
    @inlinable
    public mutating func center(x: Int, y: Int) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable
    public mutating func center(x: Double, y: Double) {
        self = self.centered(atX: x, y: y)
    }
    
    /// Centers `self` at `(x,y)`
    @inlinable
    public mutating func center(x: CGFloat, y: CGFloat) {
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
    public func aligned(relativeTo rect: CGRect, xAxis: Alignment, yAxis: Alignment) -> CGRect {
        let origin = self.origin
        let coord: [CGFloat] = [(a: xAxis, o: origin.x, lon: self.width, min: rect.minX, max: rect.maxX, mid: rect.midX),
                     (a: xAxis, o: origin.y, lon: self.height, min: rect.minY, max: rect.maxY, mid: rect.midY)].map {
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
    public mutating func align(relativeTo rect: CGRect, xAxis: Alignment, yAxis: Alignment) {
        self = self.aligned(relativeTo: rect, xAxis: xAxis, yAxis: yAxis)
    }
    
    /// Returns a copy of `self` with `origin` equals to `CGPointZero`.
    @inlinable
    public func reseted() -> CGRect {
        return CGRect(x: 0, y: 0, width: self.width, height: self.height)
    }
    
    /// Makes `self`'s origin equal to `CGPointZero`.
    @inlinable
    public mutating func reset() {
        self.origin = CGPoint(x: 0, y: 0)
    }
}

// MARK: -
// MARK: Transform
public extension CGRect {
    /// Returns a copy of `self` translated by the given vector.
    @inlinable
    public func translated(by vector: CGVector) -> CGRect {
        return CGRect(origin: self.origin.translated(along: vector), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    public func translated(byTx tx: Int, ty: Int) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    public func translated(byTx tx: Double, ty: Double) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }
    
    /// Returns a copy of `self` translated by `(tx,ty)`.
    @inlinable
    public func translated(byTx tx: CGFloat, ty: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.translated(tx: tx, ty: ty), size: self.size)
    }

    /// Translate `self` by the given vector.
    @inlinable
    public mutating func translate(along vector: CGVector) {
        self = self.translated(by: vector)
    }

    /// Translate `self` by `(tx,ty)`.
    @inlinable
    public mutating func translate(tx: Int, ty: Int) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    public mutating func translate(tx: Double, ty: Double) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Translate `self` by `(tx,ty)`.
    @inlinable
    public mutating func translate(tx: CGFloat, ty: CGFloat) {
        self = self.translated(byTx: tx, ty: ty)
    }
    
    /// Returns a copy of `self` rotated around the given point by the given angle.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
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
    @inlinable
    public mutating func rotate(relativeTo center: CGPoint, by angle: CGFloat) {
        self = self.rotated(relativeTo: center, by: angle)
    }
    
    /// Returns a copy of `self` rotated by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    public func slided(relativeTo center: CGPoint, by angle: CGFloat) -> CGRect {
        return self.centered(at: self.center.rotated(relativeTo: center, by: angle))
    }
    
    /// Rotates `self` by the given angle around the given center but the orientation will remain the same.
    ///
    /// - note: Rotates clockwise on iOS and counter-clockwise on OS X.
    /// - Parameters:
    ///   - center: The point the rotation will be applied around.
    ///   - angle: The rotation's angle in radians.
    @inlinable
    public mutating func slide(relativeTo center: CGPoint, by angle: CGFloat) {
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
    @inlinable
    public mutating func offsetEdge(_ edge: CGRectEdge, by amount: CGFloat) {
        self = self.offsettingEdge(edge, by: amount)
    }
    
    @inlinable
    public mutating func offsetEdges(_ edges: [CGRectEdge], by amount: CGFloat) {
        self = self.offsettingEdges(edges, by: amount)
    }
    
    @inlinable
    public func offsettingEdge(_ edge: CGRectEdge, by amount: CGFloat) -> CGRect {
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
    
    @inlinable
    public func offsettingEdges(_ edges: [CGRectEdge], by amount: CGFloat) -> CGRect {
        guard edges.count > 0 else { return self }
        return edges.reduce(self) { return $0.offsettingEdge($1, by: amount) }
    }
    
    @inlinable
    public mutating func insetEdges(_ edges: [CGRectEdge], by amount: CGFloat) {
        self = self.insettingEdges(edges, by: amount)
    }
    
    /// Insets `self` in the given edge direction by the given amount.
    ///
    /// - Parameters:
    ///   - edge: The edge to inset from.
    ///   - amount: The inset amount.
    @inlinable
    public mutating func insetEdge(_ edge: CGRectEdge, by amount: CGFloat) {
        self = self.insettingEdge(edge, by: amount)
    }
    
    @inlinable
    public func insettingEdge(_ edge: CGRectEdge, by amount: CGFloat) -> CGRect {
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
    
    @inlinable
    public func insettingEdges(_ edges: [CGRectEdge], by amount: CGFloat) -> CGRect {
        guard edges.count > 0 else { return self }
        return edges.reduce(self) { return $0.insettingEdge($1, by: amount) }
    }
    
    /// Offsets `self` by the given amount in the `maxX` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsetEdge")
    @inlinable
    public mutating func offsetMaxX(by amount: CGFloat) {
        self = self.offsettingMaxX(by: amount)
    }
    
    /// Insets `self` by the given amount in the `maxX` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insetEdge")
    @inlinable
    public mutating func insetMaxX(by amount: CGFloat) {
        self = self.offsettingMaxX(by: -amount)
    }
    
    
    /// Returns a copy of `self` offset by the given amount in the `maxX` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsettingEdge")
    @inlinable
    public func offsettingMaxX(by amount: CGFloat) -> CGRect {
        return CGRect(origin: self.origin, size: .init(width: self.width + amount, height: self.height))
    }
    
    /// Returns a copy of `self` inset by the given amount in the `maxX` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insettingEdge")
    @inlinable
    public func insettingMaxX(by amount: CGFloat) -> CGRect {
        return self.offsettingMaxX(by: -amount)
    }
    
    /// Offsets `self` by the given amount in the `minX` direction.
    ///
    /// - Parameter amount: The amount of offseting
    @available(*, deprecated, renamed: "offsetEdge")
    @inlinable
    public mutating func offsetMinX(by amount: CGFloat) {
        self = self.offsettingMinX(by: amount)
    }
    
    /// Insets `self` by the given amount in the `minX` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insetEdge")
    @inlinable
    public mutating func insetMinX(by amount: CGFloat) {
        self = self.offsettingMinX(by: -amount)
    }
    
    /// Returns a copy of `self` inset by the given amount in the `minX` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsettingEdge")
    @inlinable
    public func offsettingMinX(by amount: CGFloat) -> CGRect {
        return CGRect(origin: .init(x: self.minX - amount, y: self.minY), size: .init(width: self.width + amount, height: self.height))
    }
    
    /// Returns a copy of `self` inset by the given amount in the `minX` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insettingEdge")
    @inlinable
    public func insettingMinX(by amount: CGFloat) -> CGRect {
        return self.offsettingMinX(by: -amount)
    }
    
    /// Offsets `self` by the given amount in the `maxY` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsetEdge")
    @inlinable
    public mutating func offsetMaxY(by amount: CGFloat) {
        self = self.offsettingMaxY(by: amount)
    }
    
    /// Insets `self` by the given amount in the `maxY` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insetEdge")
    @inlinable
    public mutating func insetMaxY(by amount: CGFloat) {
        self = self.offsettingMaxY(by: -amount)
    }
    
    /// Returns a copy of `self` inset by the given amount in the `maxY` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsettingEdge")
    @inlinable
    public func offsettingMaxY(by amount: CGFloat) -> CGRect {
        return CGRect(origin: self.origin, size: .init(width: self.width, height: self.height + amount))
    }
    
    /// Returns a copy of `self` inset by the given amount in the `maxY` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insettingEdge")
    @inlinable
    public func insettingMaxY(by amount: CGFloat) -> CGRect {
        return self.offsettingMaxY(by: -amount)
    }
    
    /// Offsets `self` by the given amount in the `minY` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsetEdge")
    @inlinable
    public mutating func offsetMinY(by amount: CGFloat) {
        self = self.offsettingMinY(by: amount)
    }
    
    /// Insets `self` by the given amount in the `minY` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "insetEdge")
    @inlinable
    public mutating func insetMinY(by amount: CGFloat) {
        self = self.offsettingMinY(by: -amount)
    }
    
    /// Returns a copy of `self` offset by the given amount in the `minY` direction.
    ///
    /// - Parameter amount: The amount of offsetting
    @available(*, deprecated, renamed: "offsettingEdge")
    @inlinable
    public func offsettingMinY(by amount: CGFloat) -> CGRect {
        return CGRect(origin: .init(x: self.minX, y: self.minY - amount), size: .init(width: self.width, height: self.height + amount))
    }
    
    /// Returns a copy of `self` inset by the given amount in the `minY` direction.
    ///
    /// - Parameter amount: The amount of insetting
    @available(*, deprecated, renamed: "insettingEdge")
    @inlinable
    public func insettingMinY(by amount: CGFloat) -> CGRect {
        return self.offsettingMinY(by: -amount)
    }
}
