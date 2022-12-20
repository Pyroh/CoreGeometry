//
//  BiComponent.swift
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

import simd

public protocol BiComponent: AdditiveArithmetic, Equatable {
    var simd2: SIMD2<Native> { get set }
    init(simd2: SIMD2<Native>)
}

public extension BiComponent {
    static func ==<B: BiComponent>(lhs: Self, rhs: B) -> Bool {
        lhs.simd2 == rhs.simd2
    }
}

public extension BiComponent {
    @inlinable static func vertical(_ value: CGFloat) -> Self {
        .init(simd2: .init(0, value.native))
    }
    @inlinable static func vertical<F: BinaryFloatingPoint>(_ value: F) -> Self {
        .init(simd2: .init(0, value.native))
    }
    @inlinable static func vertical<I: BinaryInteger>(_ value: I) -> Self {
        .init(simd2: .init(0, value.native))
    }
    
    @inlinable static func horizontal(_ value: CGFloat) -> Self {
        .init(simd2: .init(value.native, 0))
    }
    @inlinable static func horizontal<F: BinaryFloatingPoint>(_ value: F) -> Self {
        .init(simd2: .init(value.native, 0))
    }
    @inlinable static func horizontal<I: BinaryInteger>(_ value: I) -> Self {
        .init(simd2: .init(value.native, 0))
    }
}

public extension BiComponent {
    @inlinable
    init(_ components: (CGFloat, CGFloat)) {
        self.init(simd2: .init(x: components.0.native, y: components.1.native))
    }
    
    @inlinable
    init<F: BinaryFloatingPoint>(_ components: (F, F)) {
        self.init(simd2: .init(x: components.0.native, y: components.1.native))
    }
    
    @inlinable
    init<I: BinaryInteger>(_ components: (I, I)) {
        self.init(simd2: .init(x: components.0.native, y: components.1.native))
    }
}

public extension BiComponent {
    @inlinable
    func clamped<B1: BiComponent, B2: BiComponent>(lowerBound: B1, upperBound: B2) -> Self {
        .init(simd2: simd2.clamped(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2))
    }
    
    @inlinable
    func clamped<B: BiComponent>(lowerBound: Self, upperBound: B) -> Self {
        .init(simd2: simd2.clamped(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2))
    }
    
    @inlinable
    func clamped<B: BiComponent>(lowerBound: B, upperBound: Self) -> Self {
        .init(simd2: simd2.clamped(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2))
    }
    
    @inlinable
    func clamped(lowerBound: Self, upperBound: Self) -> Self {
        .init(simd2: simd2.clamped(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2))
    }
    
    @inlinable
    mutating func clamp<B1: BiComponent, B2: BiComponent>(lowerBound: B1, upperBound: B2) {
        simd2.clamp(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2)
    }
    
    @inlinable
    mutating func clamp<B: BiComponent>(lowerBound: Self, upperBound: B) {
        simd2.clamp(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2)
    }
    
    @inlinable
    mutating func clamp<B: BiComponent>(lowerBound: B, upperBound: Self) {
        simd2.clamp(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2)
    }
    
    @inlinable
    mutating func clamp(lowerBound: Self, upperBound: Self) {
        simd2.clamp(lowerBound: lowerBound.simd2, upperBound: upperBound.simd2)
    }
}

public extension BiComponent {
    @inlinable static prefix func -(rhs: Self) -> Self {
        .init(simd2: -rhs.simd2)
    }
    
    @inlinable static prefix func +(rhs: Self) -> Self {
        rhs
    }
}

public extension BiComponent {
    @inlinable static func +(lhs: Self, rhs: SIMD2<Native>) -> Self {
        .init(simd2: lhs.simd2 + rhs)
    }
    
    @inlinable static func +(lhs: Self, rhs: Self) -> Self {
        .init(simd2: lhs.simd2 + rhs.simd2)
    }
    
    @inlinable static func +<B: BiComponent>(lhs: Self, rhs: B) -> Self {
        .init(simd2: lhs.simd2 + rhs.simd2)
    }
    
    @inlinable static func +<F: BinaryFloatingPoint>(lhs: Self, rhs: F) -> Self {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    @inlinable static func +<I: BinaryInteger>(lhs: Self, rhs: I) -> Self {
        .init(simd2: lhs.simd2 + rhs.native)
    }
    
    @inlinable static func +<F: BinaryFloatingPoint>(lhs: Self, rhs: (F, F)) -> Self {
        .init(simd2: lhs.simd2 + .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func +<I: BinaryInteger>(lhs: Self, rhs: (I, I)) -> Self {
        .init(simd2: lhs.simd2 + .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func +=(lhs: inout Self, rhs: SIMD2<Native>) {
        lhs.simd2 = lhs.simd2 + rhs
    }
    
    @inlinable static func +=(lhs: inout Self, rhs: Self) {
        lhs.simd2 = lhs.simd2 + rhs.simd2
    }
    
    @inlinable static func +=<B: BiComponent>(lhs: inout Self, rhs: B) {
        lhs.simd2 = lhs.simd2 + rhs.simd2
    }
    
    @inlinable static func +=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: F) {
        lhs.simd2 = lhs.simd2 + rhs.native
    }
    
    @inlinable static func +=<I: BinaryInteger>(lhs: inout Self, rhs: I) {
        lhs.simd2 = lhs.simd2 + rhs.native
    }
    
    @inlinable static func +=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: (F, F)) {
        lhs.simd2 = lhs.simd2 + .init(rhs.0.native, rhs.1.native)
    }
    
    @inlinable static func +=<I: BinaryInteger>(lhs: inout Self, rhs: (I, I)) {
        lhs.simd2 = lhs.simd2 + .init(rhs.0.native, rhs.1.native)
    }
}

public extension BiComponent {
    @inlinable static func -(lhs: Self, rhs: SIMD2<Native>) -> Self {
        .init(simd2: lhs.simd2 - rhs)
    }
    
    @inlinable static func -(lhs: Self, rhs: Self) -> Self {
        .init(simd2: lhs.simd2 - rhs.simd2)
    }
    
    @inlinable static func -<B: BiComponent>(lhs: Self, rhs: B) -> Self {
        .init(simd2: lhs.simd2 - rhs.simd2)
    }
    
    @inlinable static func -<F: BinaryFloatingPoint>(lhs: Self, rhs: F) -> Self {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    @inlinable static func -<I: BinaryInteger>(lhs: Self, rhs: I) -> Self {
        .init(simd2: lhs.simd2 - rhs.native)
    }
    
    @inlinable static func -<F: BinaryFloatingPoint>(lhs: Self, rhs: (F, F)) -> Self {
        .init(simd2: lhs.simd2 - .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func -<I: BinaryInteger>(lhs: Self, rhs: (I, I)) -> Self {
        .init(simd2: lhs.simd2 - .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func -=(lhs: inout Self, rhs: SIMD2<Native>) {
        lhs.simd2 = lhs.simd2 - rhs
    }
    
    @inlinable static func -=(lhs: inout Self, rhs: Self) {
        lhs.simd2 = lhs.simd2 - rhs.simd2
    }
    
    @inlinable static func -=<B: BiComponent>(lhs: inout Self, rhs: B) {
        lhs.simd2 = lhs.simd2 - rhs.simd2
    }
    
    @inlinable static func -=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: F) {
        lhs.simd2 =  lhs.simd2 - rhs.native
    }
    
    @inlinable static func -=<I: BinaryInteger>(lhs: inout Self, rhs: I) {
        lhs.simd2 =  lhs.simd2 - rhs.native
    }
    
    @inlinable static func -=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: (F, F)) {
        lhs.simd2 = lhs.simd2 - .init(rhs.0.native, rhs.1.native)
    }
    
    @inlinable static func -=<I: BinaryInteger>(lhs: inout Self, rhs: (I, I)) {
        lhs.simd2 = lhs.simd2 - .init(rhs.0.native, rhs.1.native)
    }
}

public extension BiComponent {
    @inlinable static func *(lhs: Self, rhs: SIMD2<Native>) -> Self {
        .init(simd2: lhs.simd2 * rhs)
    }
    
    @inlinable static func *(lhs: Self, rhs: Self) -> Self {
        .init(simd2: lhs.simd2 * rhs.simd2)
    }
    
    @inlinable static func *<B: BiComponent>(lhs: Self, rhs: B) -> Self {
        .init(simd2: lhs.simd2 * rhs.simd2)
    }
    
    @inlinable static func *<F: BinaryFloatingPoint>(lhs: Self, rhs: F) -> Self {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    @inlinable static func *<I: BinaryInteger>(lhs: Self, rhs: I) -> Self {
        .init(simd2: lhs.simd2 * rhs.native)
    }
    
    @inlinable static func *<F: BinaryFloatingPoint>(lhs: Self, rhs: (F, F)) -> Self {
        .init(simd2: lhs.simd2 * .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func *<I: BinaryInteger>(lhs: Self, rhs: (I, I)) -> Self {
        .init(simd2: lhs.simd2 * .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func *=(lhs: inout Self, rhs: SIMD2<Native>) {
        lhs.simd2 = lhs.simd2 * rhs
    }
    
    @inlinable static func *=(lhs: inout Self, rhs: Self) {
        lhs.simd2 = lhs.simd2 * rhs.simd2
    }
    
    @inlinable static func *=<B: BiComponent>(lhs: inout Self, rhs: B) {
        lhs.simd2 = lhs.simd2 * rhs.simd2
    }
    
    @inlinable static func *=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: F) {
        lhs.simd2 =  lhs.simd2 * rhs.native
    }
    
    @inlinable static func *=<I: BinaryInteger>(lhs: inout Self, rhs: I) {
        lhs.simd2 =  lhs.simd2 * rhs.native
    }
    
    @inlinable static func *=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: (F, F)) {
        lhs.simd2 = lhs.simd2 * .init(rhs.0.native, rhs.1.native)
    }
    
    @inlinable static func *=<I: BinaryInteger>(lhs: inout Self, rhs: (I, I)) {
        lhs.simd2 = lhs.simd2 * .init(rhs.0.native, rhs.1.native)
    }
}

public extension BiComponent {
    @inlinable static func /(lhs: Self, rhs: SIMD2<Native>) -> Self {
        .init(simd2: lhs.simd2 / rhs)
    }
    
    @inlinable static func /(lhs: Self, rhs: Self) -> Self {
        .init(simd2: lhs.simd2 / rhs.simd2)
    }
    
    @inlinable static func /<B: BiComponent>(lhs: Self, rhs: B) -> Self {
        .init(simd2: lhs.simd2 / rhs.simd2)
    }
    
    @inlinable static func /<F: BinaryFloatingPoint>(lhs: Self, rhs: F) -> Self {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    @inlinable static func /<I: BinaryInteger>(lhs: Self, rhs: I) -> Self {
        .init(simd2: lhs.simd2 / rhs.native)
    }
    
    @inlinable static func /<F: BinaryFloatingPoint>(lhs: Self, rhs: (F, F)) -> Self {
        .init(simd2: lhs.simd2 / .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func /<I: BinaryInteger>(lhs: Self, rhs: (I, I)) -> Self {
        .init(simd2: lhs.simd2 / .init(rhs.0.native, rhs.1.native))
    }
    
    @inlinable static func /=(lhs: inout Self, rhs: SIMD2<Native>) {
        lhs.simd2 = lhs.simd2 / rhs
    }
    
    @inlinable static func /=(lhs: inout Self, rhs: Self) {
        lhs.simd2 = lhs.simd2 / rhs.simd2
    }
    
    @inlinable static func /=<B: BiComponent>(lhs: inout Self, rhs: B) {
        lhs.simd2 = lhs.simd2 / rhs.simd2
    }
    
    @inlinable static func /=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: F) {
        lhs.simd2 =  lhs.simd2 / rhs.native
    }
    
    @inlinable static func /=<I: BinaryInteger>(lhs: inout Self, rhs: I) {
        lhs.simd2 =  lhs.simd2 / rhs.native
    }
    
    @inlinable static func /=<F: BinaryFloatingPoint>(lhs: inout Self, rhs: (F, F)) {
        lhs.simd2 = lhs.simd2 / .init(rhs.0.native, rhs.1.native)
    }
    
    @inlinable static func /=<I: BinaryInteger>(lhs: inout Self, rhs: (I, I)) {
        lhs.simd2 = lhs.simd2 / .init(rhs.0.native, rhs.1.native)
    }
}

public extension BiComponent {
    @inlinable
    func isApproximatelyEqual(to other: Self) -> Bool {
        simd2.isApproximatelyEqual(to: other.simd2)
    }
    
    @inlinable
    func isApproximatelyEqual<B: BiComponent>(to other: B) -> Bool {
        simd2.isApproximatelyEqual(to: other.simd2)
    }
}

extension SIMD2 where Scalar == Native {
    @usableFromInline
    func isApproximatelyEqual(to other: Self) -> Bool {
        let relativeTolerance = Self(repeating: Scalar.Magnitude.ulpOfOne.squareRoot())
        let absoluteTolerance = relativeTolerance * Scalar.Magnitude.leastNormalMagnitude
        
        if self == other { return true }
        let delta = abs(self - other)
        let scale = simd.max(abs(self), abs(other))
        let bound = simd.max(absoluteTolerance, scale * relativeTolerance)
        
        return delta.x.isFinite && delta.y.isFinite && all(delta .<= bound)
    }
}
