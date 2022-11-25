//
//  UnitPointExtension.swift
//
//  CoreGeometry
//
//  MIT License
//
//  Copyright (c) 2022 Pierre Tacchi
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

extension UnitPoint: BiComponent {
    @inlinable public var simd2: SIMD2<Native> {
        get { .init(x.native, y.native) }
        set { (x, y) = (newValue.x.cgFloat, newValue.y.cgFloat) }
    }
    
    @usableFromInline func flipped(x flagX: Bool, y flagY: Bool) -> Self {
        let x = flagX ? 1 - x : x
        let y = flagY ? 1 - y : y
        
        return .init(x: x, y: y)
    }
    
    @usableFromInline func autoFlipped() -> Self {
        guard layoutDirection() == .rightToLeft || !CoreGeometry.flippedVertically else { return self }
        return flipped(x: layoutDirection() == .rightToLeft, y: !CoreGeometry.flippedVertically)
    }
    
    @inlinable public init(simd2: SIMD2<Native>) {
        self.init(x: simd2.x.cgFloat, y: simd2.y.cgFloat)
    }
}
