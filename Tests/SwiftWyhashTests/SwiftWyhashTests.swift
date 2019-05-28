import XCTest
@testable import SwiftWyhash

final class SwiftWyhashTests: XCTestCase {
    func testBasic() {
        let gen = WyhashGenerator(userSeed: 0)
        XCTAssertEqual(gen.random(), 6661202149082483300)
        XCTAssertEqual(gen.random(), 13322404298164966600)
        XCTAssertEqual(gen.random(), 10710867605997789043)
    }

    static var allTests = [
        ("testBasic", testBasic),
    ]
}
