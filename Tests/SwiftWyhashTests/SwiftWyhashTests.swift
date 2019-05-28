import XCTest
@testable import SwiftWyhash

final class SwiftWyhashTests: XCTestCase {
    func testBasic() {
        var gen = Wyhash64(seed: 0)
        XCTAssertEqual(gen.next(), 6661202149082483300)
        XCTAssertEqual(gen.next(), 13322404298164966600)
        XCTAssertEqual(gen.next(), 10710867605997789043)
    }
    
    func testShuffled() {
        var g = Wyhash64(seed: 0)
        XCTAssertEqual((1...10).shuffled(using: &g),
                       [1, 6, 2, 8, 4, 7, 5, 10, 3, 9])
    }

    static var allTests = [
        ("testBasic", testBasic),
        ("testShuffled", testShuffled),
    ]
}
