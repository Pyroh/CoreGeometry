//
//  BinaryFloatingPointExtension.swift
//  CoreGeometry
//
//  Copyright © 2019 Pyrolyse
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

extension BinaryFloatingPoint {
    /// The numerical value considered as expressed in radians converted in degrees.
    @inlinable
    public var degree: CGFloat {
        return CGFloat(self) * degreeFactor
    }
    
    /// The value considered as expressed in degrees converted in radians.
    @inlinable
    public var radian: CGFloat {
        return CGFloat(self) * radianFactor
    }
    
    /// The `sin` of the value considered as expressed in radians.
    @inlinable
    public var sin: CGFloat {
        return CoreGraphics.sin(CGFloat(self))
    }
    
    /// The `asin` of the value considered as expressed in radians.
    @inlinable
    public var asin: CGFloat {
        return CoreGraphics.asin(CGFloat(self))
    }
    
    /// The `cos` of the value considered as expressed in radians.
    @inlinable
    public var cos: CGFloat {
        return CoreGraphics.cos(CGFloat(self))
    }
    
    /// The `acos` of the value considered as expressed in radians.
    @inlinable
    public var acos: CGFloat {
        return CoreGraphics.acos(CGFloat(self))
    }
    
    /// The `tan` of the value considered as expressed in radians.
    @inlinable
    public var tan: CGFloat {
        return CoreGraphics.tan(CGFloat(self))
    }
    
    /// The `atan` of the value considered as expressed in radians.
    @inlinable
    public var atan: CGFloat {
        return CoreGraphics.atan(CGFloat(self))
    }
    
    /// Considers the value as an angle expressed in radians and constrains it to the range `[0..2π]`.
    ///
    /// - Returns: The constrained angle expressed in radians.
    @inlinable
    public func normalized() -> CGFloat {
        let r = CGFloat.pi * 2
        return (r + CGFloat(self).truncatingRemainder(dividingBy: r)).truncatingRemainder(dividingBy: r)
    }
}
