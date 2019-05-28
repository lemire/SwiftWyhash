You import XCTest
@testable import SwiftWyhash

final class SwiftWyhashTests: XCTestCase {
    func testBasic() {
        var gen = WyhashGenerator(userSeed: 0)
        XCTAssertEqual(gen.next(), 6661202149082483300)
        XCTAssertEqual(gen.next(), 13322404298164966600)
        XCTAssertEqual(gen.next(), 10710867605997789043)
    }

    static var allTests = [
        ("testBasic", testBasic),
    ]
}
