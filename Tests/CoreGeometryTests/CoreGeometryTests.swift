//
//  CoreGeometryTests.swift
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


#if !os(watchOS)
import XCTest
import SwiftUI
@testable import CoreGeometry

final class CoreGeometryTests: XCTestCase {
    func testAngle() {
        XCTAssert(90° == 90.radian)
        let r = 90
        XCTAssert(r° == r.radian)
        let s = CGFloat(45)
        XCTAssert(s° == s.radian)
        XCTAssert((3 * CGFloat.pi).normalized() == CGFloat.pi)
    }
    
    func testPointExtension() {
        let p1 = CGPoint(x: 10, y: 10)
        let p2 = CGPoint(x: 20, y: 20)
        
        let v1 = CGVector(dx: 10, dy: 10)
        
        XCTAssert(p1.formVector(with: p2) == v1)
        XCTAssert(p1.translated(along: v1) == p2)
        XCTAssert(p1.translated(tx: 10, ty: 10) == p2)
        
        var p3 = p1
        p3.translate(along: v1)
        XCTAssert(p3 == p2)
        p3 = p1
        p3.translate(tx: 10, ty: 10)
        XCTAssert(p3 == p2)
    }
    
    func testPointAlgebra() {
        let p1 = CGPoint(x: 10, y: 10)
        let p2 = CGPoint(x: 20, y: 20)
        
        XCTAssert(p1 * 2 == p2)
        XCTAssert(p1 * Int8(2) == p2)
        
        XCTAssert(p1 * 2.0 == p2)
        XCTAssert(p1 * Float(2.0) == p2)
        XCTAssert(p1 * CGFloat(2.0) == p2)
        
        XCTAssert(p2 / 2 == p1)
        XCTAssert(p2 / Int8(2) == p1)
        
        XCTAssert(p2 / 2.0 == p1)
        XCTAssert(p2 / Float(2.0) == p1)
        XCTAssert(p2 / CGFloat(2.0) == p1)
        
        let p3 = CGPoint(0.7, 1.3)
        let p4 = CGPoint(1.0, 1.0)
        let p5 = CGPoint(0.5, 1.5)
        
        print(p3.aligned(.half))
        
        XCTAssert(p3.aligned() == p4)
        XCTAssert(p3.aligned(.half) == p5)
        
        let p6 = CGPoint(-10, -10)
        XCTAssert(-p1 == p6)
    }
    
    func testPointInit() {
        let p1 = CGPoint(1, 2)
        let p2 = CGPoint(3, 4)
        
        XCTAssert(p1 == .init(x: 1, y: 2))
        XCTAssert(p2 == .init(x: 3, y: 4))
    }
    
    func testRectCornersExtention() {
        let r1 = CGRect(center: .zero, size: .init(square: 100))
        
        XCTAssert(r1.center == .zero)
        XCTAssert(r1[.min, .min] == .init(x: -50, y: -50))
        XCTAssert(r1[.mid, .min] == .init(x: 0, y: -50))
        XCTAssert(r1[.max, .min] == .init(x: 50, y: -50))
        XCTAssert(r1[.min, .mid] == .init(x: -50, y: 0))
        XCTAssert(r1[.mid, .mid] == .init(x: 0, y: 0))
        XCTAssert(r1[.max, .mid] == .init(x: 50, y: 0))
        XCTAssert(r1[.min, .max] == .init(x: -50, y: 50))
        XCTAssert(r1[.mid, .max] == .init(x: 0, y: 50))
        XCTAssert(r1[.max, .max] == .init(x: 50, y: 50))
        
        var r2 = CGRect(center: .init(5, 5), size: .init(10))
        
        r2[.min, .min] = .zero
        XCTAssert(r2[.min, .min] == .zero)
        r2[.mid, .min] = .zero
        XCTAssert(r2[.mid, .min] == .zero)
        r2[.max, .min] = .zero
        XCTAssert(r2[.max, .min] == .zero)
        r2[.min, .mid] = .zero
        XCTAssert(r2[.min, .mid] == .zero)
        r2[.mid, .mid] = .zero
        XCTAssert(r2[.mid, .mid] == .zero)
        r2[.max, .mid] = .zero
        XCTAssert(r2[.max, .mid] == .zero)
        r2[.min, .max] = .zero
        XCTAssert(r2[.min, .max] == .zero)
        r2[.mid, .max] = .zero
        XCTAssert(r2[.mid, .max] == .zero)
        r2[.max, .max] = .zero
        XCTAssert(r2[.max, .max] == .zero)
    }
    
    func testRectGeometryExtension() {
        let r1 = CGRect(origin: .zero, size: .init(width: 640, height: 480))
        let r2 = CGRect(origin: .zero, size: .init(width: 480, height: 640))
        let r3 = CGRect(origin: .zero, size: .init(square: 1))
        let min = CGRect(origin: .zero, size: .init(square: 480))
        let max = CGRect(origin: .zero, size: .init(square: 640))
        
        XCTAssert(r1.maxSquare == max)
        XCTAssert(r1.minSquare == min)
        XCTAssert(r1.ratio == 4/3)
        XCTAssert(r3.diagonal == sqrt(2))
        XCTAssert(r1.orientation == .landscape)
        XCTAssert(r2.orientation == .portrait)
        XCTAssert(r3.orientation == .square)
    }
    
    func testRectCenterExtension() {
        let r1 = CGRect(origin: .zero, size: .init(square: 100))
        let r2 = CGRect(origin: .zero, size: .init(width: 50, height: 25))
        let r3 = CGRect(center: .init(x: 50, y: 50), size: .init(width: 50, height: 25))
        
        XCTAssert(r2.centered(in: r1) == r3)
        XCTAssert(r2.centered(at: .init(x: 50, y: 50)) == r3)
        XCTAssert(r2.centered(atX: 50, y: 50) == r3)
        
        var r4 = r2
        r4.center(in: r1)
        XCTAssert(r4 == r3)
        r4.center(at: .init(x: 50, y: 50))
        XCTAssert(r4 == r3)
        r4.center(atX: 50, y: 50)
        XCTAssert(r4 == r3)
    }
    
    func testRectAlignExtension() {
        let r1 = CGRect(center: .zero, size: .init(square: 200))
        let r2 = CGRect(center: .zero, size: .init(square: 100))
        
        print(r1.minX, r2)
        
        let minMin = CGRect(origin: .init(x: -100, y: -100), size: .init(square: 100))
        let centerMin = CGRect(origin: .init(x: -50, y: -100), size: .init(square: 100))
        let maxMin = CGRect(origin: .init(x: 0, y: -100), size: .init(square: 100))
        let minCenter = CGRect(origin: .init(x: -100, y: -50), size: .init(square: 100))
        let centerCenter = CGRect(origin: .init(x: -50, y: -50), size: .init(square: 100))
        let maxCenter = CGRect(origin: .init(x: 0, y: -50), size: .init(square: 100))
        let minMax = CGRect(origin: .init(x: -100, y: 0), size: .init(square: 100))
        let centerMax = CGRect(origin: .init(x: -50, y: 0), size: .init(square: 100))
        let maxMax = CGRect(origin: .init(x: 0, y: 0), size: .init(square: 100))
        
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .mid, yAxis: .mid) == r2)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .min, yAxis: .min) == minMin)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .mid, yAxis: .min) == centerMin)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .max, yAxis: .min) == maxMin)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .min, yAxis: .mid) == minCenter)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .mid, yAxis: .mid) == centerCenter)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .max, yAxis: .mid) == maxCenter)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .min, yAxis: .max) == minMax)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .mid, yAxis: .max) == centerMax)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .max, yAxis: .max) == maxMax)
        XCTAssert(r2.aligned(relativeTo: r1, xAxis: .none, yAxis: .none) == r2)
        
        var r3 = r2
        r3.align(relativeTo: r1, xAxis: .mid, yAxis: .mid)
        XCTAssert(r3 == r2)
        r3.align(relativeTo: r1, xAxis: .min, yAxis: .min)
        XCTAssert(r3 == minMin)
        r3.align(relativeTo: r1, xAxis: .mid, yAxis: .min)
        XCTAssert(r3 == centerMin)
        r3.align(relativeTo: r1, xAxis: .max, yAxis: .min)
        XCTAssert(r3 == maxMin)
        r3.align(relativeTo: r1, xAxis: .min, yAxis: .mid)
        XCTAssert(r3 == minCenter)
        r3.align(relativeTo: r1, xAxis: .mid, yAxis: .mid)
        XCTAssert(r3 == centerCenter)
        r3.align(relativeTo: r1, xAxis: .max, yAxis: .mid)
        XCTAssert(r3 == maxCenter)
        r3.align(relativeTo: r1, xAxis: .min, yAxis: .max)
        XCTAssert(r3 == minMax)
        r3.align(relativeTo: r1, xAxis: .mid, yAxis: .max)
        XCTAssert(r3 == centerMax)
        r3.align(relativeTo: r1, xAxis: .max, yAxis: .max)
        XCTAssert(r3 == maxMax)
        r3.align(relativeTo: r1, xAxis: .none, yAxis: .none)
        XCTAssert(r3 == maxMax)
        
        let r4 = CGRect(origin: .zero, size: .init(square: 100))
        XCTAssert(r2.reseted() == r4)
        
        r3.reset()
        XCTAssert(r3 == r4)
    }
    
    func testRectAnchor() {
        let r1 = CGRect(20, 20)
        print(r1[UnitPoint.topLeading])
        XCTAssert(r1[UnitPoint.topLeading] == .init(0, 20))
        XCTAssert(r1[UnitPoint.top] == .init(10, 20))
        XCTAssert(r1[UnitPoint.topTrailing] == .init(20, 20))
        XCTAssert(r1[UnitPoint.trailing] == .init(20, 10))
        XCTAssert(r1[UnitPoint.bottomLeading] == .init(0, 0))
        XCTAssert(r1[UnitPoint.bottom] == .init(10, 0) )
        XCTAssert(r1[UnitPoint.bottomTrailing] == .init(20, 0))
        XCTAssert(r1[UnitPoint.leading] == .init(0, 10))
        XCTAssert(r1[UnitPoint.center] == .init(10, 10))
        
        var r2 = CGRect(20, 20)
        
        r2[UnitPoint.topLeading] = .zero
        XCTAssert(r2[UnitPoint.topLeading] == .zero)
        r2[UnitPoint.top] = .zero
        XCTAssert(r2[UnitPoint.top] == .zero)
        r2[UnitPoint.topTrailing] = .zero
        XCTAssert(r2[UnitPoint.topTrailing] == .zero)
        r2[UnitPoint.trailing] = .zero
        XCTAssert(r2[UnitPoint.trailing] == .zero)
        r2[UnitPoint.bottomLeading] = .zero
        XCTAssert(r2[UnitPoint.bottomLeading] == .zero)
        r2[UnitPoint.bottom] = .zero
        XCTAssert(r2[UnitPoint.bottom] == .zero)
        r2[UnitPoint.bottomTrailing] = .zero
        XCTAssert(r2[UnitPoint.bottomTrailing] == .zero)
        r2[UnitPoint.leading] = .zero
        XCTAssert(r2[UnitPoint.leading] == .zero)
        r2[UnitPoint.center] = .zero
        XCTAssert(r2[UnitPoint.center] == .zero)
    }
    
    func testRectInsetExtension() {
        let r1 = CGRect(origin: .zero, size: .init(square: 20))
        let rminX = CGRect(origin: .init(x: 10, y: 0), size: .init(width: 10, height: 20))
        let rmaxX = CGRect(origin: .init(x: 0, y: 0), size: .init(width: 10, height: 20))
        let rminY = CGRect(origin: .init(x: 0, y: 10), size: .init(width: 20, height: 10))
        let rmaxY = CGRect(origin: .init(x: 0, y: 0), size: .init(width: 20, height: 10))
        
        XCTAssert(r1.insetting(.minXEdge, by: 10) == rminX)
        XCTAssert(r1.insetting(.minYEdge, by: 10) == rminY)
        XCTAssert(r1.insetting(.maxXEdge, by: 10) == rmaxX)
        XCTAssert(r1.insetting(.maxYEdge, by: 10) == rmaxY)
        
        var r2 = r1
        r2.inset(.minXEdge, by: 10)
        XCTAssert(r2 == CGRect(origin: .init(x: 10, y: 0), size: .init(width: 10, height: 20)))
        r2.inset(.maxXEdge, by: 10)
        XCTAssert(r2 == CGRect(origin: .init(x: 10, y: 0), size: .init(width: 0, height: 20)))
        r2.inset(.minYEdge, by: 10)
        XCTAssert(r2 == CGRect(origin: .init(x: 10, y: 10), size: .init(width: 0, height: 10)))
        r2.inset(.maxYEdge, by: 10)
        XCTAssert(r2 == CGRect(origin: .init(x: 10, y: 10), size: .init(width: 0, height: 0)))
        
        XCTAssert(r1.insetting([.minXEdge, .minYEdge, .maxXEdge, .maxYEdge], by: 10) == r2)
        var r3 = r1
        r3.inset([.minXEdge, .minYEdge, .maxXEdge, .maxYEdge], by: 10)
        XCTAssert(r3 == r2)
        
        let r4 = CGRect(origin: .zero, size: .init(square: 100))
        let r5 = CGRect(10, 5, 80, 90)
        
        XCTAssert(r4.insetting(by: .init(10, 5)) == r5)
        
        var r6 = r4
        r6.inset(by: .init(10, 5))
        
        XCTAssert(r5 == r6)
    }
    
    func testRectInit() {
        let r1 = CGRect(1, 2, 3, 4)
        let r2 = CGRect(1, 2)
        
        XCTAssert(r1 == CGRect(x: 1, y: 2, width: 3, height: 4))
        XCTAssert(r2 == CGRect(x: 0, y: 0, width: 1, height: 2))
        
        let r3 = CGRect(square: 40)
        let r4 = CGRect(center: .zero, square: 40)
        let r5 = CGRect(origin: .init(20, 20), square: 40)
        
        XCTAssert(r3 == CGRect(x: 0, y: 0, width: 40, height: 40))
        XCTAssert(r4 == CGRect(x: -20, y: -20, width: 40, height: 40))
        XCTAssert(r5 == CGRect(x: 20, y: 20, width: 40, height: 40))
    }
    
    func testPointRectComparison() {
        let r = CGRect(10, 10, 100, 100)
        let p1 = CGPoint.zero
        let p2 = CGPoint(0, 55)
        let p3 = CGPoint(55, 0)
        
        let e1 = p1 < r
        let e2 = p2 < r
        let e3 = p3 < r
        
        XCTAssert(e1.x == true && e1.y == true)
        XCTAssert(e2.x == true && e2.y == false)
        XCTAssert(e3.x == false && e3.y == true)
        
        let p4 = CGPoint(120, 120)
        let p5 = CGPoint(120, 55)
        let p6 = CGPoint(55, 120)
        
        let e4 = p4 > r
        let e5 = p5 > r
        let e6 = p6 > r
        
        XCTAssert(e4.x == true && e4.y == true)
        XCTAssert(e5.x == true && e5.y == false)
        XCTAssert(e6.x == false && e6.y == true)
    }
    
    func testSizeAlgebra() {
        let s1 = CGSize(square: 100)
        
        XCTAssert(s1 / 10 == .init(square: 10))
        XCTAssert(s1 * 10 == .init(square: 1000))
        XCTAssert(s1 + .init(square: 10) == .init(square: 110))
        XCTAssert(s1 - .init(square: 10) == .init(square: 90))
        print(s1 * .init(square: 0.5))
        XCTAssert(s1 * .init(square: 0.5) == .init(square: 50))
        
        let s2 = CGSize(width: 1, height: 2)
        let s3 = CGSize(width: 3, height: 4)
        let s4 = CGSize(width: 4, height: 6)
        
        XCTAssert(s2 + s3 == s4)
        XCTAssert(s3 + s2 == s4)
        XCTAssert(s4 - s2 == s3)
        XCTAssert(s4 - s3 == s2)
        
        let s5 = CGSize(104)
        let s6 = CGSize(101, 102)
        
        XCTAssert(s1 + 4 == s5)
        XCTAssert(s1 + (1, 2) == s6)
        
        let s7 = CGSize(96)
        let s8 = CGSize(99, 98)
        
        XCTAssert(s1 - 4 == s7)
        XCTAssert(s1 - (1, 2) == s8)
        
        let s9 = CGSize(1.2, 0.8)
        let s10 = CGSize(2, 1)
        XCTAssert(s9.integral == s10)
        
        let s11 = CGSize(square: -100)
        XCTAssert(-s1 == s11)
    }
    
    func testSizeInit() {
        let s1 = CGSize(1, 2)
        let s2 = CGSize(3, 4)
        let s3 = CGSize(5)
        
        let s4 = CGSize(800, 600)
        let s5 = CGSize(600, 800)
        let s6 = CGSize(800, 800)
        
        XCTAssert(s1 == .init(width: 1, height: 2))
        XCTAssert(s2 == .init(width: 3, height: 4))
        XCTAssert(s3 == .init(width: 5, height: 5))
        
        XCTAssert(s4 == .init(aspectRatio: 4/3, maxEdge: 800))
        XCTAssert(s5 == .init(aspectRatio: 3/4, maxEdge: 800))
        XCTAssert(s6 == .init(aspectRatio: 1, maxEdge: 800))
    }
    
    func testVectorAlgebra() {
        let v1 = CGVector(dx: 100, dy: 100)
        let v2 = CGVector(dx: 10, dy: 10)
        
        XCTAssert(v1 / 10 == .init(dx: 10, dy: 10))
        XCTAssert(v1 * 10 == .init(dx: 1000, dy: 1000))
        XCTAssert(v1 + v2 == .init(dx: 110, dy: 110))
        XCTAssert(v1 - v2 == .init(dx: 90, dy: 90))
        
        let v3 = CGVector(-100, -100)
        XCTAssert(-v1 == v3)
    }
    
    func testCGRectTransform() {
        let r1 = CGRect(10, 10, 100, 100)
        let r2 = r1.transformed { $0.origin = .zero }
        
        XCTAssert(r2 == CGRect(0, 0, 100, 100))
    }
    
    func testIntegralSize() {
        let size = CGSize(1.23, 2.34)
        
        XCTAssert(size.integralWidth == 2)
        XCTAssert(size.integralHeight == 3)
        
        XCTAssert(size.integral(.down) == .init(1, 2))
        XCTAssert(size.integral(.up) == .init(2, 3))
        
        let rect = CGRect(size: size)
        
        XCTAssert(rect.integralWidth == 2)
        XCTAssert(rect.integralHeight == 3)
        
        XCTAssert(rect.integral(.down) == .init(1, 2))
        XCTAssert(rect.integral(.up) == .init(2, 3))
    }
    
    func testMinMaxSize() {
        let size = CGSize(10, 20)
        
        XCTAssert(size.min == 10)
        XCTAssert(size.max == 20)
        
        XCTAssert(size.minSize == .init(square: 10))
        XCTAssert(size.maxSize == .init(square: 20))
    }
    
    func testCGPointClamp() {
        let rect = CGRect(square: 32)
        let out0 = CGPoint(-10, -10)
        let out1 = CGPoint(-10, 16)
        let out2 = CGPoint(-10, 42)
        let out3 = CGPoint(16, 42)
        let out4 = CGPoint(42, 42)
        let out5 = CGPoint(42, 16)
        let out6 = CGPoint(42, -10)
        let out7 = CGPoint(16, -10)
        let in0 = CGPoint(16, 16)
        
        XCTAssert(out0.clamped(to: rect) == rect[.min, .min])
        XCTAssert(out1.clamped(to: rect) == rect[.min, .mid])
        XCTAssert(out2.clamped(to: rect) == rect[.min, .max])
        XCTAssert(out3.clamped(to: rect) == rect[.mid, .max])
        XCTAssert(out4.clamped(to: rect) == rect[.max, .max])
        XCTAssert(out5.clamped(to: rect) == rect[.max, .mid])
        XCTAssert(out6.clamped(to: rect) == rect[.max, .min])
        XCTAssert(out7.clamped(to: rect) == rect[.mid, .min])
        XCTAssert(in0.clamped(to: rect) == in0)
    }
    
    func testRectProduct() {
        let rect1 = CGRect(1, 2, 3, 4)
        var rect2 = rect1
        let result = CGRect(1, 2, 6, 8)
        var rect3 = result
        
        XCTAssert(rect1 * .init(2, 2) == result)
        rect2 *= .init(2, 2)
        XCTAssert(rect2 == result)
        
        XCTAssert(result / .init(2, 2) == rect1)
        rect3 /= .init(2, 2)
        XCTAssert(rect3 == rect1)
    }
}

#endif
