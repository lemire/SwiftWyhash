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

    func testNumberSequence() {
        var numbers = sequence(state: Wyhash64(seed: 0)) {
            (g: inout Wyhash64) -> Int? in
            return Int.random(in: Int.min...Int.max, using: &g)
        }
        // Array initializer takes a copy of numbers value,
        // because `UnfoldSequence` and `Wyhash64` are both value types.
        XCTAssertEqual(Array(numbers.prefix(2)),
                       [6661202149082483300, -5124339775544585016])
        XCTAssertEqual(numbers.next(), 6661202149082483300)

        XCTAssertEqual(Array(numbers.prefix(2)),
                       [-5124339775544585016, -7735876467711762573])
        XCTAssertEqual(numbers.next(), -5124339775544585016)
        XCTAssertEqual(numbers.next(), -7735876467711762573)
    }

    static var allTests = [
        ("testBasic", testBasic),
        ("testShuffled", testShuffled),
        ("testNumberSequence", testNumberSequence),
    ]
}
