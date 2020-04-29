//
//  Ratio.swift
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

public struct Ratio {
    /// The ratio numerator.
    public var a: CGFloat
    
    /// The ratio denominator.
    public var b: CGFloat
    
    /// The ratio factor.
    public var factor: CGFloat {
        return self.a / self.b
    }
    
    /// The orientation of the ratio.
    public var orientation: Orientation {
        switch self.a / self.b {
        case let x where x < 1.0:
            return .portrait
        case let x where x > 1.0:
            return .landscape
        default:
            return .square
        }
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: Int, to b: Int) {
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: Double, to b: Double) {
        self.a = CGFloat(a)
        self.b = CGFloat(b)
    }
    
    /// Create a `Ratio` instance.
    ///
    /// - Parameters:
    ///   - a: The numerator.
    ///   - b: The denominator.
    public init(_ a: CGFloat, to b: CGFloat) {
        self.a = a
        self.b = b
    }
    
    /// Invert `self`.
    @inlinable
    public mutating func invert() {
        self = self.inverted()
    }
    
    /// Return `self` inverted.
    ///
    /// - Returns: The inverted version of `self`.
    @inlinable
    public func inverted() -> Ratio {
        return Ratio(self.b, to: self.a)
    }
    
}
