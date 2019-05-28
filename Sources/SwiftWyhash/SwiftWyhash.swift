public struct WyhashGenerator: RandomNumberGenerator {
    private var seed : UInt64

    private static let multiplier1 : UInt64 = 0xa3b195354a39b70d
    private static let multiplier2 : UInt64 = 0x1b03738712fad5c9
    private static let increment : UInt64 = 0x60bee2bee120fc15

    init(userSeed : UInt64) {
        seed = userSeed;
    }

    public mutating func next() -> UInt64 {
        seed &+= WyhashGenerator.increment
        let fullmult1 = seed.multipliedFullWidth(by: WyhashGenerator.multiplier1)
        let m1 = fullmult1.high ^ fullmult1.low;
        let fullmult2 = m1.multipliedFullWidth(by: WyhashGenerator.multiplier2)
        let m2 = fullmult2.high ^ fullmult2.low;
        return m2;
    }
}
