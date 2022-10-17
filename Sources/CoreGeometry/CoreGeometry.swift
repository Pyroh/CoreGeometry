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

@usableFromInline typealias Native = CGFloat.NativeType

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
#else
import UIKit
#endif

public enum CoreGeometry {
    public enum CoordinatesFlippedState {
        /// Default for platform, independent on the context. Not flipped on macOS, flipped otherwise.
        case auto
        
        case flipped
        case notFlipped
        
        @usableFromInline
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
    
    @usableFromInline
    static var flippedState: CoordinatesFlippedState = .auto
    
    @usableFromInline
    static var flippedStateStack: [CoordinatesFlippedState] = []
    
    @usableFromInline
    static var flippedVertically: Bool {
        flippedState.flipped
    }
    
    @inlinable
    public static func saveFlippedState() {
        flippedStateStack.append(flippedState)
    }
    
    @inlinable
    public static func restoreFlippedState() {
        guard !flippedStateStack.isEmpty else {
            fatalError("Tried to perform an unbalanced call to \(#function). Don't try to perform unbalanced call to \(#function).")
        }
        
        flippedState = flippedStateStack.removeLast()
    }
    
    @inlinable
    public static func resetFlippedState() {
        flippedState = .auto
        flippedStateStack = []
    }
    
    @inlinable
    static func setFlippedState(_ state: CoordinatesFlippedState) {
        flippedState = state
    }
    
    @inlinable
    public static func setFlippedState(from layer: CALayer) {
        flippedState = layer.isGeometryFlipped ? .flipped : .notFlipped
    }
    
    #if os(macOS)
    @inlinable
    public static func setFlippedState(from context: NSGraphicsContext) {
        flippedState = context.isFlipped ? .flipped : .notFlipped
    }
    
    @inlinable
    public static func setFlippedState(from view: NSView) {
        flippedState = view.isFlipped ? .flipped : .notFlipped
    }
    #endif
}
#endif
