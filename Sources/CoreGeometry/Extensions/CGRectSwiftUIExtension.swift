//
//  CGRectSwiftUIExtension.swift
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

import SwiftUI

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignment: Alignment) -> (x: AxisAlignment, y: AxisAlignment) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignment: Alignment) -> (x: RectBoundary, y: RectBoundary) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignement: HorizontalAlignment) -> AxisAlignment {
    switch alignement {
    case .leading: return CoreGeometry.flippedHorizontally ? .max : .min
    case .trailing: return CoreGeometry.flippedHorizontally ? .min : .max
    default: return .mid
    }
}

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignement: HorizontalAlignment) -> RectBoundary {
    switch alignement {
    case .leading: return CoreGeometry.flippedHorizontally ? .max : .min
    case .trailing: return CoreGeometry.flippedHorizontally ? .min : .max
    default: return .mid
    }
}

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: VerticalAlignment) -> AxisAlignment {
    switch alignement {
    case .top: return CoreGeometry.flippedVertically ? .min : .max
    case .bottom: return CoreGeometry.flippedVertically ? .max : .min
    default: return .mid
    }
}

@MainActor @available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: VerticalAlignment) -> RectBoundary {
    switch alignement {
    case .top: return CoreGeometry.flippedVertically ? .min : .max
    case .bottom: return CoreGeometry.flippedVertically ? .max : .min
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
extension CGRect {
    @MainActor @inlinable subscript(alignment: Alignment) -> CGPoint {
        get {
            let pair: (x: RectBoundary, y: RectBoundary) = convert(alignment)
            return self[pair.x, pair.y]
        }
        set {
            let pair: (x: RectBoundary, y: RectBoundary) = convert(alignment)
            self[pair.x, pair.y] = newValue
        }
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
public extension CGRect {
    @MainActor @inlinable subscript(anchor: UnitPoint) -> CGPoint {
        get { origin + size * anchor.auto() }
        set { origin += newValue - self[anchor] }
    }
    
    @MainActor @inlinable func aligning(_ sourceAnchor: UnitPoint, to rect: CGRect, anchor: UnitPoint) ->  CGRect {
        let origin = origin + rect[anchor] - self[sourceAnchor]
        return with(origin: origin)
    }
    
    @MainActor @inlinable mutating func align(_ sourceAnchor: UnitPoint, to rect: CGRect, anchor: UnitPoint) {
        self[sourceAnchor] = rect[anchor]
    }
    
    /// Return a copy of `self` aligned relative to the given rect following a given anchor.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - anchor: The alignment constraint.
    /// - Returns: A properly aligned rect.
    @MainActor @inlinable func aligned(relativeTo rect: CGRect, anchor: UnitPoint) -> CGRect {
        let origin = origin + rect[anchor] - self[anchor]
        return with(origin: origin)
    }
    
    /// Aligns `self` relative to the given rect following a given anchor.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - anchor: The alignment constraint.
    @MainActor @inlinable mutating func align(relativeTo rect: CGRect, anchor: UnitPoint) {
        self[anchor] = rect[anchor]
    }
}
