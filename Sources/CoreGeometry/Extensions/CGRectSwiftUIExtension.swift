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

#if canImport(SwiftUI)

import SwiftUI

#if os(macOS)
import AppKit

@available(OSX 10.15, *)
private func layoutDirection() -> LayoutDirection {
    switch NSApp.userInterfaceLayoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    }
}

#elseif os(watchOS)
import WatchKit

@available(watchOS 6.0, *)
private func layoutDirection() -> LayoutDirection {
    switch WKInterfaceDevice.current().layoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    @unknown default: return .leftToRight
    }
}

#else
import UIKit

@available(iOS 13.0, watchOS 6.0, tvOS 13.0, *)
private func layoutDirection() -> LayoutDirection {
    switch UIApplication.shared.userInterfaceLayoutDirection {
    case .leftToRight: return .leftToRight
    case .rightToLeft: return .rightToLeft
    @unknown default: return .leftToRight
    }
}
#endif

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline
func convert(_ alignment: SwiftUI.Alignment) -> (x: Alignment, y: Alignment) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
@usableFromInline
func convert(_ alignment: SwiftUI.Alignment) -> (x: RectBoundary, y: RectBoundary) {
    (convert(alignment.horizontal), convert(alignment.vertical))
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: SwiftUI.HorizontalAlignment) -> Alignment {
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
private func convert(_ alignement: SwiftUI.HorizontalAlignment) -> RectBoundary {
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
private func convert(_ alignement: SwiftUI.VerticalAlignment) -> Alignment {
    switch alignement {
    case .top:
        #if os(macOS)
        return .max
        #else
        return .min
        #endif
    case .bottom:
        #if os(macOS)
        return .min
        #else
        return .max
        #endif
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
private func convert(_ alignement: SwiftUI.VerticalAlignment) -> RectBoundary {
    switch alignement {
    case .top:
        #if os(macOS)
        return .max
        #else
        return .min
        #endif
    case .bottom:
        #if os(macOS)
        return .min
        #else
        return .max
        #endif
    default:
        return .mid
    }
}

@available(OSX 10.15, iOS 13, watchOS 6.0, tvOS 13.0, *)
public extension CGRect {
    @inlinable
    subscript(alignment: SwiftUI.Alignment) -> CGPoint {
        get {
            let pair: (x: RectBoundary, y: RectBoundary) = convert(alignment)
            return self[pair.x, pair.y]
        }
        set {
            let pair: (x: RectBoundary, y: RectBoundary) = convert(alignment)
            self[pair.x, pair.y] = newValue
        }
    }

    /// Return a copy of `self` aligned relative to the given rect following a given alignement constraint.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - alignment: The alignment constraint.
    /// - Returns: A properly aligned rect.
    @inlinable
    func aligned(relativeTo rect: CGRect, alignment: SwiftUI.Alignment) -> CGRect {
        let pair: (x: Alignment, y: Alignment) = convert(alignment)
        return aligned(relativeTo: rect, xAxis: pair.x, yAxis: pair.y)
    }

    /// Aligns `self` relative to the given rect following a given alignement constraint.
    ///
    /// - Parameters:
    ///   - rect: The rect to align against.
    ///   - alignment: The alignment constraint.
    @inlinable
    mutating func align(relativeTo rect: CGRect, alignment: SwiftUI.Alignment) {
        let pair: (x: Alignment, y: Alignment) = convert(alignment)
        self = self.aligned(relativeTo: rect, xAxis: pair.x, yAxis: pair.y)
    }
}

#endif
