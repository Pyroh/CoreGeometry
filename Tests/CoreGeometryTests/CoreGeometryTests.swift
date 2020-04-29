import XCTest
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
        p3.translate(by: v1)
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
    }
    
    func testSizeAlgebra() {
        let s1 = CGSize(square: 100)
        
        XCTAssert(s1 / 10 == .init(square: 10))
        XCTAssert(s1 * 10 == .init(square: 1000))
        XCTAssert(s1 + .init(square:10) == .init(square: 110))
        XCTAssert(s1 - .init(square:10) == .init(square: 90))
        
        let s2 = CGSize(width: 1, height: 2)
        let s3 = CGSize(width: 3, height: 4)
        let s4 = CGSize(width: 4, height: 6)
        
        XCTAssert(s2 + s3 == s4)
        XCTAssert(s3 + s2 == s4)
        XCTAssert(s4 - s2 == s3)
        XCTAssert(s4 - s3 == s2)
    }
    
    func testVectorAlgebra() {
        let v1 = CGVector(dx: 100, dy: 100)
        let v2 = CGVector(dx: 10, dy: 10)
        
        XCTAssert(v1 / 10 == .init(dx: 10, dy: 10))
        XCTAssert(v1 * 10 == .init(dx: 1000, dy: 1000))
        XCTAssert(v1 + v2 == .init(dx: 110, dy: 110))
        XCTAssert(v1 - v2 == .init(dx: 90, dy: 90))
    }
}
