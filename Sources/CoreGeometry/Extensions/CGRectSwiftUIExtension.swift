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

extension UnitPoint {
    @usableFromInline var simd2: SIMD2<Native> { .init(x.native, y.native) }
    @usableFromInline func flipped(x flagX: Bool, y flagY: Bool) -> Self {
        let x = flagX ? 1 - x : x
        let y = flagY ? 1 - y : y
        
        return .init(x: x, y: y)
    }
}

#if os(macOS)
import AppKit

@available(OSX 10.15, *)
@usableFromInline func layoutDirection() -> LayoutDirection {
    if NSApp == nil { return .leftToRight }
    switch NSApp.userInterfaceLayoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    @unknown default: fatalError()
    }
}

@usableFromInline func contextIsFlipped() -> Bool {
    NSGraphicsContext.current?.isFlipped ?? false
}

#elseif os(watchOS)
import WatchKit

@available(watchOS 6.0, *)
@usableFromInline func layoutDirection() -> LayoutDirection {
    switch WKInterfaceDevice.current().layoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    @unknown default: return .leftToRight
    }
}

private func contextIsFlipped() -> Bool { true }
#else
import UIKit

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func layoutDirection() -> LayoutDirection {
    switch UIApplication.shared.userInterfaceLayoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    @unknown default: return .leftToRight
    }
}

@usableFromInline func contextIsFlipped() -> Bool { true }
#endif

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignment: Alignment) -> (x: AxisAlignment, y: AxisAlignment) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignment: Alignment) -> (x: RectBoundary, y: RectBoundary) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignement: HorizontalAlignment) -> AxisAlignment {
    switch alignement {
    case .leading: return layoutDirection() == .leftToRight ? .min : .max
    case .trailing: return layoutDirection() == .leftToRight ? .max : .min
    default: return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline func convert(_ alignement: HorizontalAlignment) -> RectBoundary {
    switch alignement {
    case .leading:
        return layoutDirection() == .leftToRight ? .min : .max
    case .trailing:
        return layoutDirection() == .leftToRight ? .max : .min
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: VerticalAlignment) -> AxisAlignment {
    switch alignement {
    case .top:
        return .min
    case .bottom:
        return .max
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: VerticalAlignment) -> RectBoundary {
    switch alignement {
    case .top:
        return .min
    case .bottom:
        return .max
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
extension CGRect {
    @inlinable subscript(alignment: Alignment) -> CGPoint {
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
    @inlinable subscript(anchor: UnitPoint) -> CGPoint {
        get {
            let flipX = layoutDirection() == .rightToLeft
            let flipY = !contextIsFlipped()
            
            let anchor = anchor.flipped(x: flipX, y: flipY)
            
            return .init(simd2: origin.simd2 + size.simd2 * anchor.simd2)
        }
        set {
            origin.simd2 += newValue.simd2 - self[anchor].simd2
        }
    }
    
    /// Return a copy of `self` aligned relative to the given rect following a given anchor.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - anchor: The alignment constraint.
    /// - Returns: A properly aligned rect.
    @inlinable func aligned(relativeTo rect: CGRect, anchor: UnitPoint) -> CGRect {
        let origin = CGPoint(simd2: origin.simd2 + rect[anchor].simd2 - self[anchor].simd2)
        return .init(origin: origin, size: size)
    }
    
    /// Aligns `self` relative to the given rect following a given anchor.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - anchor: The alignment constraint.
    @inlinable mutating func align(relativeTo rect: CGRect, anchor: UnitPoint) {
        self[anchor] = rect[anchor]
    }

    /// Return a copy of `self` aligned relative to the given rect following a given alignement constraint.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - alignment: The alignment constraint.
    /// - Returns: A properly aligned rect.
    @available(*, deprecated)
    @inlinable func aligned(relativeTo rect: CGRect, alignment: Alignment) -> CGRect {
        let pair: (x: AxisAlignment, y: AxisAlignment) = convert(alignment)
        return aligned(relativeTo: rect, xAxis: pair.x, yAxis: pair.y)
    }

    /// Aligns `self` relative to the given rect following a given alignement constraint.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - alignment: The alignment constraint.
    @available(*, deprecated)
    @inlinable mutating func align(relativeTo rect: CGRect, alignment: Alignment) {
        let pair: (x: AxisAlignment, y: AxisAlignment) = convert(alignment)
        self = self.aligned(relativeTo: rect, xAxis: pair.x, yAxis: pair.y)
    }
}
