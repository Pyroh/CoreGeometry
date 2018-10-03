import XCTest
@testable import CoreGeometry

final class CoreGeometryTests: XCTestCase {
    func testDegree() {
        XCTAssert(90° == 90.radian)
        let r = 90
        XCTAssert(r° == r.radian)
    }
}
