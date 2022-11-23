//
//  EdgeInsetsExtension.swift
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

#if canImport(SwiftUI)
import SwiftUI

public extension EdgeInsets {
    
    /// Horizontal edge insets SIMD representation.
    /// Orderd `leading, trailing`.
    @inlinable var horizontal: SIMD2<CGFloat.NativeType> {
        .init(leading.native, trailing.native)
    }
    
    /// Vertical edge insets SIMD representation.
    /// Orderd `top, bottom`.
    @inlinable var vertical: SIMD2<CGFloat.NativeType> {
        .init(top.native, bottom.native)
    }
    
    /// The receiver's SIMD representation.
    /// Ordered `top, leading, bottom, trailing`.
    @inlinable var simd4: SIMD4<CGFloat.NativeType> {
        .init(top.native, leading.native, bottom.native, trailing.native)
    }
    
    @inlinable init(simd4: SIMD4<CGFloat.NativeType>) {
        self.init(top: simd4.x, leading: simd4.y, bottom: simd4.z, trailing: simd4.w)
    }
    
    @inlinable init(horizontal: SIMD2<CGFloat.NativeType>, vertical: SIMD2<CGFloat.NativeType>) {
        self.init(top: vertical.x, leading: horizontal.x, bottom: vertical.y, trailing: horizontal.y)
    }
    
    @inlinable init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    @inlinable init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
    
    @inlinable init(vertical: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: vertical, leading: leading, bottom: vertical, trailing: trailing)
    }
    
    @inlinable init(all amount: CGFloat) {
        self.init(top: amount, leading: amount, bottom: amount, trailing: amount)
    }
}
#endif

#if canImport(Cocoa)
import Cocoa
#elseif canImport(UIKit)
import UIKit
#endif

public extension NSDirectionalEdgeInsets {
    
    /// Horizontal edge insets SIMD representation.
    /// Orderd `leading, trailing`.
    @inlinable var horizontal: SIMD2<CGFloat.NativeType> {
        .init(leading.native, trailing.native)
    }
    
    /// Vertical edge insets SIMD representation.
    /// Orderd `top, bottom`.
    @inlinable var vertical: SIMD2<CGFloat.NativeType> {
        .init(top.native, bottom.native)
    }
    
    /// The receiver's SIMD representation.
    /// Ordered `top, leading, bottom, trailing`.
    @inlinable var simd4: SIMD4<CGFloat.NativeType> {
        .init(top.native, leading.native, bottom.native, trailing.native)
    }
    
    @inlinable init(simd4: SIMD4<CGFloat.NativeType>) {
        self.init(top: simd4.x, leading: simd4.y, bottom: simd4.z, trailing: simd4.w)
    }
    
    @inlinable init(horizontal: SIMD2<CGFloat.NativeType>, vertical: SIMD2<CGFloat.NativeType>) {
        self.init(top: vertical.x, leading: horizontal.x, bottom: vertical.y, trailing: horizontal.y)
    }
    
    @inlinable init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    @inlinable init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
    
    @inlinable init(vertical: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: vertical, leading: leading, bottom: vertical, trailing: trailing)
    }
    
    @inlinable init(all amount: CGFloat) {
        self.init(top: amount, leading: amount, bottom: amount, trailing: amount)
    }
}

#if canImport(Cocoa)
public extension NSEdgeInsets {
    
    /// Horizontal edge insets SIMD representation.
    /// Orderd `left, right`.
    @inlinable var horizontal: SIMD2<CGFloat.NativeType> {
        .init(left.native, right.native)
    }
    
    /// Vertical edge insets SIMD representation.
    /// Orderd `top, bottom`.
    @inlinable var vertical: SIMD2<CGFloat.NativeType> {
        .init(top.native, bottom.native)
    }
    
    /// The receiver's SIMD representation.
    /// Ordered `top, left, bottom, right`.
    @inlinable var simd4: SIMD4<CGFloat.NativeType> {
        .init(top.native, left.native, bottom.native, right.native)
    }
    
    @inlinable init(simd4: SIMD4<CGFloat.NativeType>) {
        self.init(top: simd4.x, left: simd4.y, bottom: simd4.z, right: simd4.w)
    }
    
    @inlinable init(horizontal: SIMD2<CGFloat.NativeType>, vertical: SIMD2<CGFloat.NativeType>) {
        self.init(top: vertical.x, left: horizontal.x, bottom: vertical.y, right: horizontal.y)
    }
    
    @inlinable init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    @inlinable init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    @inlinable init(vertical: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: vertical, left: leading, bottom: vertical, right: trailing)
    }
    
    @inlinable init(all amount: CGFloat) {
        self.init(top: amount, left: amount, bottom: amount, right: amount)
    }
}
#endif

#if canImport(UIKit)
public extension UIEdgeInsets {
    
    /// Horizontal edge insets SIMD representation.
    /// Orderd `left, right`.
    @inlinable var horizontal: SIMD2<CGFloat.NativeType> {
        .init(left.native, right.native)
    }
    
    /// Vertical edge insets SIMD representation.
    /// Orderd `top, bottom`.
    @inlinable var vertical: SIMD2<CGFloat.NativeType> {
        .init(top.native, bottom.native)
    }
    
    /// The receiver's SIMD representation.
    /// Ordered `top, left, bottom, right`.
    @inlinable var simd4: SIMD4<CGFloat.NativeType> {
        .init(top.native, left.native, bottom.native, right.native)
    }
    
    @inlinable init(simd4: SIMD4<CGFloat.NativeType>) {
        self.init(top: simd4.x, left: simd4.y, bottom: simd4.z, right: simd4.w)
    }
    
    @inlinable init(horizontal: SIMD2<CGFloat.NativeType>, vertical: SIMD2<CGFloat.NativeType>) {
        self.init(top: vertical.x, left: horizontal.x, bottom: vertical.y, right: horizontal.y)
    }
    
    @inlinable init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    @inlinable init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    @inlinable init(vertical: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: vertical, left: leading, bottom: vertical, right: trailing)
    }
    
    @inlinable init(all amount: CGFloat) {
        self.init(top: amount, left: amount, bottom: amount, right: amount)
    }
}
#endif
