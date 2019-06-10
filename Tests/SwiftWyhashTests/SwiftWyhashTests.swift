import XCTest
@testable import SwiftWyhash

final class SwiftWyhashTests: XCTestCase {
    func testBasic() {
        var gen = WyRand(seed: 42)
        XCTAssertEqual(gen.next(), 12558987674375533620)
        XCTAssertEqual(gen.next(), 16846851108956068306)
        XCTAssertEqual(gen.next(), 14652274819296609082)
    }

    func testShuffled() {
        var g = WyRand(seed: 42)
        XCTAssertEqual((1...10).shuffled(using: &g),
                       [1, 3, 5, 2, 4, 9, 6, 10, 8, 7])
    }

    func testNumberSequence() {
        var numbers = sequence(state: WyRand(seed: 42)) {
            return Int.random(in: Int.min...Int.max, using: &$0)
        }
        // Array initializer takes a copy of numbers value,
        // because `UnfoldSequence` and `Wyhash64` are both value types.
        XCTAssertEqual(Array(numbers.prefix(2)),
                       [-5887756399334017996, -1599892964753483310])
        XCTAssertEqual(numbers.next(), -5887756399334017996)

        XCTAssertEqual(Array(numbers.prefix(2)),
                       [-1599892964753483310, -3794469254412942534])
        XCTAssertEqual(numbers.next(), -1599892964753483310)
        XCTAssertEqual(numbers.next(), -3794469254412942534)

        measure {
          _ = Array(numbers.lazy.prefix(524288))
        }
    }

    func testNumberSequenceBoundedPerformance() {
        let numbers = sequence(state: WyRand(seed: 42)) {
          Int.random(in: Int.min...(Int.max / 2 + 1), using: &$0)
        }
        measure {
          _ = Array(numbers.lazy.prefix(524288))
        }
    }

    func testRawGeneratorPerformance() {
        var g = WyRand(seed: 42)
        var a = Array(repeating: UInt64(0), count: 524288)

        measure {
            for i in a.indices {
                a[i] = g.next()
            }
        }
    }

    func testBoundedGeneratorPerformance() {
        var g = WyRand(seed: 42)
        var a = Array(repeating: UInt64(0), count: 524288)
        let b = UInt64.max / 2 + 1

        measure {
            for i in a.indices {
                a[i] = g.next(upperBound: b)
            }
        }
    }

    static var allTests = [
        ("testBasic", testBasic),
        ("testShuffled", testShuffled),
        ("testNumberSequence", testNumberSequence),
    ]
}
