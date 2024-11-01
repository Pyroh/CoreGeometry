//
//  CoreGeometry.swift
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


import Foundation
@_exported import CoreGraphics

public typealias Native = CGFloat.NativeType

postfix operator °

@usableFromInline internal let degreeFactor = 180 / CGFloat.pi
@usableFromInline internal let radianFactor = 1 / degreeFactor


@usableFromInline func withMutable<T>(_ subject: T, transform: @escaping (inout T) throws -> ()) rethrows -> T {
    var proxy = subject
    try transform(&proxy)
    
    return proxy
}

#if !os(Linux)
#if os(macOS)
import Cocoa
#elseif os(iOS)
import UIKit
#elseif os(watchOS)
import WatchOS
#endif

public enum CoreGeometry: Sendable {
    public enum CoordinatesFlippedState: Sendable {
        /// Default for platform, independent on the context. Not flipped on macOS, flipped otherwise.
        case auto
        
        case flipped
        case notFlipped
        
        @usableFromInline @MainActor
        var flipped: Bool {
            switch self {
            case .auto:
                #if os(macOS)
                return NSView.focusView?.isFlipped ?? false
                #else
                return true
                #endif
            case .flipped:
                return true
            case .notFlipped:
                return false
            }
        }
    }
    
    public enum CoordinateRTLState {
        case leftToRight
        case rightToLeft
        
        @usableFromInline
        var rightToLeft: Bool {
            switch self {
            case .leftToRight: return false
            case .rightToLeft: return true
            }
        }
    }
    
    @usableFromInline @MainActor
    static var flippedState: CoordinatesFlippedState = .auto
    
    @usableFromInline @MainActor
    static var flippedStateStack: [CoordinatesFlippedState] = []
    
    @usableFromInline @MainActor
    static var flippedVertically: Bool {
        flippedState.flipped
    }
    
    @inlinable @MainActor
    public static func saveFlippedState() {
        flippedStateStack.append(flippedState)
    }
    
    @inlinable @MainActor
    public static func restoreFlippedState() {
        guard !flippedStateStack.isEmpty else {
            fatalError("Tried to perform an unbalanced call to \(#function). Don't try to perform unbalanced call to \(#function).")
        }
        
        flippedState = flippedStateStack.removeLast()
    }
    
    @inlinable @MainActor
    public static func resetFlippedState() {
        flippedState = .auto
        flippedStateStack = []
    }
    
    @inlinable @MainActor
    public static func setFlippedState(_ state: CoordinatesFlippedState) {
        flippedState = state
    }
    
    @inlinable @MainActor
    public static func setFlippedState(from layer: CALayer) {
        flippedState = layer.isGeometryFlipped ? .flipped : .notFlipped
    }
    
    #if os(macOS)
    @inlinable @MainActor
    public static func setFlippedState(from context: NSGraphicsContext) {
        flippedState = context.isFlipped ? .flipped : .notFlipped
    }
    
    @inlinable @MainActor
    public static func setFlippedState(from view: NSView) {
        flippedState = view.isFlipped ? .flipped : .notFlipped
    }
    #endif
    
    @usableFromInline @MainActor
    static var flippedHorizontally: Bool = false
    
    @usableFromInline @MainActor
    static var layoutDirectionStack: [Bool] = []
    
    @inlinable @MainActor
    public static func saveLayoutDirection() {
        layoutDirectionStack.append(flippedHorizontally)
    }
    
    @inlinable @MainActor
    public static func restoreLayoutDirection() {
        guard !layoutDirectionStack.isEmpty else {
            fatalError("Tried to perform an unbalanced call to \(#function). Don't try to perform unbalanced call to \(#function).")
        }
        
        layoutDirectionStack.removeLast()
    }
    
    @inlinable @MainActor
    public static func setLayoutDirection(rightToLeft flag: Bool) {
        flippedHorizontally = flag
    }
    
    #if os(macOS)
    @inlinable @MainActor
    public static func setLayoutDirection(from application: NSApplication) {
        switch NSApp.userInterfaceLayoutDirection {
        case .leftToRight: flippedHorizontally = false
        case .rightToLeft: flippedHorizontally = true
        @unknown default: return
        }
    }
    #elseif os(watchOS)
    @inlinable
    public static func setLayoutDirection(from interfaceDevice: WKInterfaceDevice) {
        switch interfaceDevice.layoutDirection {
        case .leftToRight: flippedHorizontally = false
        case .rightToLeft: flippedHorizontally = true
        @unknown default: return
        }
    }
    #elseif os(iOS)
    @MainActor @inlinable
    public static func setLayoutDirection(from app: UIApplication) {
        switch app.userInterfaceLayoutDirection {
        case .leftToRight: flippedHorizontally = false
        case .rightToLeft: flippedHorizontally = true
        @unknown default: return
        }
    }
    #endif
}
#endif
